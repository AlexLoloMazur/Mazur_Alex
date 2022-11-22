'use strict';
let jsonData = require('./personas.json');
console.log(JSON.stringify(jsonData));
console.log(JSON.parse(jsonData));


/*
¿Qué sucede cuando utilizamos JSON.stringify? Por que?
¿Qué sucede cuando utilizamos JSON.parse? Por que?
Comentar las respuestas y guardar el programa en ejercicio2.js

A- en este caso, al usar stringify trae los datos del objeto json y lo convierte en una cadena de texto en una sola linea

B- al tratar de parsear tira un error undefined, con error de sintaxis
*/