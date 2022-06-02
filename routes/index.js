const express = require("express")
const router = express.Router()
const db = require("../db/index")

const { existFile, getToken } = require("./forgeapi")
const { getDateSql, getScaleSql } = require('./filter')
const { log } = require("debug")

/* GET home page. */
router.get("/", (req, res, next) => {
    res.render("index", { title: "Express" })
})

router.get("/search", (req, res, next) => {
    var query=``
    if(req.query.type=="reigon")
    {
    //行政区划查询
    const reigonname = req.query.reigonnamea
    query=`select * from metadata where city like '%${reigonname}%' or county like '%${reigonname}%'`
    console.log(query);
    }
    /* else if(req.body.type==select)
    {
    //点选
    const lat = req.body.lat
    const lon = req.body.lon
    const querypoint = `select * from metadata where (minlat < '${lat}' and maxlat > '${lat}' and minlon < '${lon}' and maxlon > '${lon}') `
    //框选
    const minlat = req.body.lat0
    const maxlat = req.body.lat1
    const minlon = req.body.lon0
    const maxlon = req.body.lon1

    const querysquare = `select * from metadata where (minlat > '${minlat}' and minlat < '${maxlat}' and minlon > '${minlon}' and minlon < '${maxlon}') 
    or (maxlat > '${minlat}' and maxlat < '${maxlat}' and maxlon > '${minlon}' and maxlon < '${maxlon}')
    or (minlat < '${minlat}' and maxlat > '${maxlat}' and minlon < '${minlon}' and maxlon > '${maxlon}')`
    } */
    else{
        //手动输入经纬度
        const minlat = req.query.lat0a
        const maxlat = req.query.lat1a
        const minlon = req.query.lon0a
        const maxlon = req.query.lon1a
    
        query = `select * from metadata where (minlat > ${minlat} and minlat < ${maxlat} and minlon > ${minlon} and minlon < ${maxlon}) 
        or (maxlat > ${minlat} and maxlat < ${maxlat} and maxlon > ${minlon} and maxlon < ${maxlon})
        or (minlat < ${minlat} and maxlat > ${maxlat} and minlon < ${minlon} and maxlon > ${maxlon})`
    }

    db.query(query, (err, result) => {
        if (err) {
            next(err)
        } else {
            res.json(result.rows)
        }
    })
})
// 获取地理数据
router.get("/data", (req, res, next) => {
    const values = []
    // 搜索表单中的输入值
    if (req.query.name) {
        values.push(
            req.query.name ? `(data_name like '%${req.query.name}%')` : "true"
        )
    } else {
        values.push("true")
    }

    // 类型过滤
    if (req.query.typesFilter) {
        values.push(
            req.query.typesFilter.length
                ? `(data_type in ('${req.query.typesFilter.join("', '")}'))`
                : "true"
        )
    } else {
        values.push("true")
    }

    // 时间过滤
    if (req.query.dateFilter) {
        values.push(getDateSql(req.query.dateFilter))
    } else {
        values.push("true")
    }

    // 比例尺过滤
    if (req.query.scaleFilter) {
        values.push(getScaleSql(req.query.scaleFilter))
    } else {
        values.push("true")
    }

    const query = `select * from metadata where ${values[0]} and ${values[1]} and ${values[2]} and ${values[3]}`
    console.log(query);
    // 查询
    db.query(query, (err, result) => {
        if (err) {
            next(err)
        } else {
            res.json(result.rows)
        }
    })
})
/* router.get("/data", (req, res, next) => {
    const values = []
    if (req.query.name) {
        values.push(
            req.query.name ? `data_name like '%${req.query.name}%'` : "true"
        )
    } else {
        values.push("true")
    }
    if (req.query.typesFilter) {
        values.push(
            req.query.typesFilter.length
                ? `data_type in ('${req.query.typesFilter.join("', '")}')`
                : "true"
        )
    } else {
        values.push("true")
    }
    if (req.query.dateFilter) {
        values.push(
            req.query.dateFilter.length
                ? `data_time in ('${req.query.dateFilter.join("', '")}')`
                : "true"
        )
    } else {
        values.push("true")
    }
    if (req.query.scaleFilter) {
        values.push(
            req.query.scaleFilter.length
                ? `data_scale in ('${req.query.scaleFilter.join("', '")}')`
                : "true"
        )
    } else {
        values.push("true")
    }

    const query = `select * from metadata where ${values[0]} and ${values[1]} and ${values[2]} and ${values[3]}`

    db.query(query, (err, result) => {
        if (err) {
            next(err)
        } else {
            res.json(result.rows)
        }
    })
}) */

router.post("/login", (req, res, next) => {
    const username = req.body.username
    const password = req.body.password
    const usertype = req.body.usertype

    const query = `select count(*) from userinfo where user_name = '${username}' and password = '${password}' and user_type = '${usertype}'`
    db.query(query, (err, result) => {
        if (err) {
            next(err)
        } else {
            res.json(result.rows)
        }
    })
})

router.post("/download", (req, res, next) => {
    existFile(req.body.fileName) ? res.status(200).end() : next(err)
})

router.get("/download", (req, res) => {
    const fileName = "data/download/" + req.query.fileName
    if (fileName != undefined) {
        res.download(fileName, (error) => { })
    }
})

router.get("/geodatalist", (req, res, next) => {
    const query = "select data_name from metadata order by random() limit 9"

    db.query(query, (err, result) => {
        if (err) {
            next(err)
        } else {
            res.json(result.rows)
        }
    })
})

router.get("/serviceList", async (req, res, next) => {
    const queryDom =
        "select * from metadata where data_type='DOM' order by random() LIMIT 1"
    const queryDem =
        "select * from metadata where data_type='DEM' order by random() LIMIT 1"
    const queryVector =
        "select * rom metadata where data_type='Vector' order by random() LIMIT 1"
    try {
        const resDom = await db.query(queryDom)
        const resDem = await db.query(queryDem)
        const resVector = await db.query(queryVector)
        const data = [resDom.rows[0], resDem.rows[0], resVector.rows[0]]
        res.json(data)
    } catch (err) {
        next(err)
    }
})

router.post("/api/forge", async (req, res, next) => {
    try {
        const data = await getToken(req.body.fileName)
        if (data) {
            res.json(data)
        } else {
            res.status(404).end()
        }
    } catch (err) {
        next(err)
    }
})
// 项目信息
router.get('/projectInfo',async(req, res, next) => {
    const values = []
    if(req.query.name) {
        values.push(
            req.query.name ? `(project_name like '%${req.query.name}%')` : "true"
        )
    } else {
        values.push(true)
    }

    const query1 = `select * from projectinfo where ${values[0]}`
    db.query(query1, (err, result) => {
        if (err) {
            next(err)
        } else {
             res.json(result.rows)
        }
    })
})

// 根据项目id得到相应的数据信息
router.get('/dataInfoByProject',async(req, res, next) => {
    values = []
    tempsql = '('
    if(req.query) {
        List = req.query
        for(var i in List) {
            id = List[i]
            tempsql += 'project_id = ' + id + ' or '
        };
        tempsql  = tempsql.substring(0, tempsql.length -4)
        tempsql += ')'
        values.push(tempsql)
    } else{
        values.push(true)
    }

    const query = `select * from metadata where ${values[0]}`
    db.query(query, (err, result) => {
        if (err) {
            next(err)
        } else {
             res.json(result.rows)
        }
    })


})
module.exports = router
