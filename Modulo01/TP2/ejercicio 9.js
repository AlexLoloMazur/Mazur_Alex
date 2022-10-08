/*Ejercicio 9:
Crear un programa que recibe las notas de un alumno, todos los números deben ser naturales
<11. Debe calcular el promedio. Por último imprimir en pantalla si el valor de media es < 5
“Reprobado”, entre 6 y 8 “Aprobado” y si es mayor a 8 “Sobresaliente”*/

var suma = 0
var promedio = 0
var notas = []
for (i=0; i<3; i++){
  var nota = parseInt(prompt("Ingrese la  nota del alumno"))
  if (nota>0 && nota<11){
    notas[i]=nota
  }
  else{
    var nota = parseInt(prompt("La nota ingresada debe ser un numero natural menor a 11"))
    notas[i]=nota
  }
  suma += notas[i]
} 
promedio = suma/3
if (promedio<5){
    console.log("Reprobado")
    document.write("Reprobado")
}
else if (promedio>=5 && promedio<=8){
    console.log("Aprobado")
    document.write("Aprobado")
}
else {
    console.log("Sobresaliente")
    document.write("Sobresaliente")
}
