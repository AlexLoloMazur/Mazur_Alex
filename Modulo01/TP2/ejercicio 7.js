/*Ejercicio 7:
Escribir una función que reciba un texto y lo devuelva al revés.*/

var palabra = prompt("Ingrese un texto para comparar")
var texto = palabra.toLowerCase()
var largo = texto.length-1
var delreves = ""
for (i = largo; i >= 0; i--){
    delreves = delreves + texto[i]
}
alert(delreves)