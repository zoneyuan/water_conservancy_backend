const { Client } = require('pg');

const client = new Client({
    user: 'postgres',
    host: 'localhost',
    database: 'meta',
    password: '123456',
    port: 5432
});

client.connect().then(() => {
    console.log('连接成功！')
}).catch(err => {
    console.log(`连接失败！${err}`);
});

module.exports = {
    query: (query, callback) => {
        client.query(query, (err, res) => {
            console.log('executed query!');
            callback(err, res);
        });
    }
}