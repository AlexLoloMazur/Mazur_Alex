var texto= prompt("Ingrese un texto para comparar")
if (texto == texto.toUpperCase()){
  console.log("El texto esta formado solo por mayusculas")
}
else if (texto == texto.toLowerCase()){
  console.log("El texto esta formado solo por minusculas")
}
else {
  console.log("El texto esta formado por mayusculas y minusculas")
}