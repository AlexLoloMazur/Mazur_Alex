'use strict';
const fs = require('fs');
fs.readFile('./personas.json', (err, data) => {
if (err) throw err;
else console.log(JSON.stringify(data));
console.log(data);
});


/*
¿Qué sucede cuando utilizamos JSON.stringify? Por que?

A- vuelve a tirar la serie de numeros representando cada uno de los caracteres utilizados en el archivo personas.json

B- convierte cada dato del objeto en su valor hexadecimal
*/