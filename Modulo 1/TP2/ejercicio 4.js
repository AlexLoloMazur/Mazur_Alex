while (numero<1){
var numero = prompt("Ingrese un numero entero positivo")
}
if (paridad(numero) != 0){
    alert('El numero ingresado es Impar')
}else{
    alert('El numero ingresado es Par')
}
function paridad(numero){
    return (numero % 2)
}