var db = require('../db/index');
var Mock = require('mockjs');
var Random = Mock.Random;

const dataTypes = [
    'DEM',
    'DOM',
    'Vector',
    'Model',
    'BIM'
];

const dataExt = [
    ".shp",
    ".tif",
    ".gpkg",
    ".geojson"
]

const dataCoords = [
    'CGCS2000',
    'Mars_2000_IAU_IAG',
    'Plessis_1817',
    'WGS_1984',
    'Xian_1980'
];

const dataScales = [
    '1:500',
    '1:1000',
    '1:2000',
    '1:5000',
    '1:10000'
];

async function mockData() {
    i = 0;
    while (i < 500) {
        const dataName = Random.county(true) + Mock.mock({ "array|1": dataExt })['array'];
        const dataType = Mock.mock({ "array|1": dataTypes })['array'];
        const dataTime = Random.date();
        const dataScale = Mock.mock({ "array|1": dataScales })['array'];
        const dataCoord = Mock.mock({ "array|1": dataCoords })['array'];
        const data_url = Random.url();
    
        const query = {
            text: 'insert into metadata(data_name, data_type, data_time, data_scale, data_coord, data_url) values($1, $2, $3, $4, $5, $6)',
            values: [dataName, dataType, dataTime, dataScale, dataCoord, data_url]
        };
    
        const res = await db.query(query, (err, result) => {
            
        });
        console.log(`成功插入第${i}条数据...`);
        i++;
    }
}

mockData()