const axios = require("axios")
const fs = require("fs")
const qs = require("qs")
const { Base64 } = require("js-base64")

const config = {
    client_id: "GBbApMQhV3GTGPuQwylKPOnPWEFOf74C",
    client_secret: "GhLG5vKlFYQOx79k",
    grant_type: "client_credentials",
    scope: {
        internal: 'data:read data:write data:create bucket:create bucket:read',
        public: 'viewables:read'
    }
}

const bucketKey = "wnok25s5mf6in8vjqzu0ukvgal1xxsec_bucket"

function existFile(file) {
    if (file != undefined && file != "") {
        const fileName = "data/download/" + file
        try {
            fs.accessSync(fileName, fs.constants.F_OK)
            return true
        } catch (err) {
            return false
        }
    } else {
        return false
    }
}

async function getToken(file) {
    const result = existFile(file)
    if (result) {

        let res = await axios({
            method: "post",
            url: "https://developer.api.autodesk.com/authentication/v1/authenticate",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded",
            },
            data: qs.stringify({
                client_id: config.client_id,
                client_secret: config.client_secret,
                grant_type: config.grant_type,
                scope: config.scope.internal,
            }),
        })
        const accessToken = res.data.access_token

        const fileContent = fs.readFileSync("data/download/" + file)
        res = await axios({
            method: "PUT",
            url: `https://developer.api.autodesk.com/oss/v2/buckets/${bucketKey}/objects/${file}`,
            headers: {
                Authorization: "Bearer " + accessToken,
                "Content-Length": fileContent.length,
            },
            data: fileContent,
            maxBodyLength: Infinity,
            //maxContentLength: Infinity,
        })
        const urn = Base64.encode(res.data.objectId, true)

        let input;
        if (file.endsWith('zip')) {
            const fileName = file.replace(/.zip/, ".dwg")
            input = {
                "urn": urn,
                "rootFilename": fileName,
                "compressedUrn": true
            }
        } else {
            input = {
                "urn": urn,
            }
        }

        res = await axios({
            method: "POST",
            url: "https://developer.api.autodesk.com/modelderivative/v2/designdata/job",
            headers: {
                "content-type": "application/json",
                Authorization: "Bearer " + accessToken,
                "x-ads-force": "false",
            },
            data: JSON.stringify({
                "input": input,
                "output": {
                    "destination": {
                        "region": "us"
                    },
                    "formats": [
                        {
                            "type": "svf",
                            "views": [
                                "2d",
                                "3d"
                            ]
                        }
                    ]
                }
            }),
        })
        const result = res.data.result

        if (result === "success" || result === "created") {
            res = await axios({
                method: "post",
                url: "https://developer.api.autodesk.com/authentication/v1/authenticate",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded",
                },
                data: qs.stringify({
                    client_id: config.client_id,
                    client_secret: config.client_secret,
                    grant_type: config.grant_type,
                    scope: config.scope.internal,
                }),
            })
            return {
                access_token: res.data.access_token,
                urn: urn,
            }
        } else {
            return false
        }
    } else {
        return false
    }
}

module.exports = {
    existFile,
    getToken,
}
