const fs = require('fs');
let rawdata = fs.readFileSync('./personas.json');
console.log(JSON.stringify(rawdata));

/*
¿Qué sucede cuando utilizamos JSON.stringify? Por que?
¿Qué sucede cuando utilizamos JSON.parse? Por que?
Comentar las respuestas y guardar el programa en ejercicio1.js

A- stringify convierte un objeto javascript en una cadena de texto con formato json. y se usa para enviar datos a un servidor web
en el caso del ejercicio al pasar a su vez por la funcion readFileSync convierte el archivo personas.json en una serie de numeros que representan a cada caracter escrito.
sigue manteniendo el orden del objeto que se pretende convertir a cadena de texto, sin embargo, no es entendible para el usuario, solamente para el servidor

B- parse convierte una cadena de texto con formato json en un objeto javascript. y se usa generalmente cuando se recibe datos de un servidor web,
ya que al recibir datos, estos siempre son una cadena de texto
en el caso del archivo personas.json, como estamos recibiendo texto con formato json, lo transforma en un objeto javascript manteniendo el formato legible para el usuario
*/