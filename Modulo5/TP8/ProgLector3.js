'use strict';
const fs = require('fs');
fs.readFile('./personas.json', (err, data) => {
if (err) throw err;
else console.log(JSON.parse(data));
});