/*Ejercicio 10:
Escribir un programa que reciba el número del mes y devuelva si tiene 31, 30 o menos días.
Por ejemplo:12 = tiene 31 días.*/

var mes=parseInt(prompt("Ingrese el numero de mes que desea saber cuantos dias tiene"))
var año=parseInt(prompt("Ingrese el año"))

function diasEnUnMes(mes, año) {
	return new Date(año, mes, 0).getDate();
}
var date = new Date();
console.log("El "+ mes + " mes del año " + año + " tiene " + diasEnUnMes(mes,año) + " dias")