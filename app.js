const express = require("express")
const path = require("path")
const cookieParser = require("cookie-parser")
const logger = require("morgan")

const cors = require("cors")

const indexRouter = require("./routes/index")
const usersRouter = require("./routes/users")

const config = require('./config');
if (config.credentials.client_id == null || config.credentials.client_secret == null) {
    console.error('Missing FORGE_CLIENT_ID or FORGE_CLIENT_SECRET env. variables.');
    return;
}

const port = 4000

const app = express()

app.use(cors())

app.use(logger("dev"))
app.use(express.json())
app.use(express.urlencoded({ extended: false }))
app.use(cookieParser())
app.use(express.static(path.join(__dirname, "public")))

app.use("/", indexRouter)
app.use("/users", usersRouter)

app.use((err, req, res, next) => {
    console.error(err);
    res.status(err.statusCode).json(err);
});

app.listen(port, () => {
    console.log(`app listening at http://localhost:${port}`)
})

module.exports = app
