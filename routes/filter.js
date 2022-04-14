// tempDate = ['2020年以后', '2018年-2019年', '2017年以前'];
function getDateSql(tempDate) {
  dateArray = [];
  tempDate.forEach(date => {
      if (date.slice(5, 7) === '以后') {
          temp = date.slice(0,4) + '-12-30'
          dateArray.push(temp);
          dateArray.push('getdate()');
      } else if (date.slice(5, 7) === '以前') {
          temp1 = '1970-1-1';
          temp = date.slice(0,4) + '-12-30'
          dateArray.push(temp1);
          dateArray.push(temp);
      } else {
          start = date.slice(0,4) + '-1-1';
          end = date.slice(6, 10) + '-12-30';
          dateArray.push(start);
          dateArray.push(end);
      }
  });
  
  sql = '';
  for (let i = 0; i < dateArray.length; i++) {
      sql += `data_time between '${dateArray[i]}' and '${dateArray[i + 1]}' or `;
      i++;
  }
  sql = '(' + sql.substr(0, sql.length - 3) + ')';
  
  return sql;
}

// tempScale = ['< 1:10000', '1:10000 - 1:5000', '1:5000 - 1:2000', '> 1:2000'];
function getScaleSql(tempScale) {
  scaleArray = [];
  tempScale.forEach(scale => {
    if (scale.substr(0,1) === '<') {
      temp = scale.slice(4,);
      scaleArray.push('<');
      scaleArray.push(temp);
    } else if (scale.substr(0, 1) === '>') {
      temp = scale.slice(4,);
      scaleArray.push('>');
      scaleArray.push(temp);
    } else {
      temp = scale.slice(2,); 
      index1 = temp.indexOf(' ');
      index2 = temp.indexOf(':');
      num1 = temp.slice(0, index1);
      num2 = temp.slice(index2 + 1,);
      scaleArray.push(num1);
      scaleArray.push(num2);
    }
  });
  
  tempSql = 'cast(substr(data_scale, 3) as numeric)'
  sql = '';
  for (let i = 0; i < scaleArray.length; i++) {
    if (scaleArray[i] === '<') {
      i++;
      sql += `${tempSql} > ${scaleArray[i]} or `
    } else if (scaleArray[i] === '>') {
      i++;
      sql += `${tempSql} < ${scaleArray[i]} or `
    } else {
      sql += `${tempSql} between ${scaleArray[i + 1]} and ${scaleArray[i]} or `;
      i++;
    }
  }
  sql = '(' + sql.substr(0, sql.length - 3) + ')';
  return sql;
}

module.exports = {
  getDateSql,
  getScaleSql
}