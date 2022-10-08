var numero = prompt("Ingrese un numero entero positivo para saber su factorial")
var resultado = 1

for (i = 1; i<=numero; i++){
    resultado = i*resultado
}

console.log(resultado)