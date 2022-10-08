var verdadero=0, char=0, masletras=0, aux=0, suma=0, resta=0, multiplicacion=0, division=0
var ordenadas=[]
var numeros=[]
var valores = [verdadero, false, 2, "hola", "mundo", 3, char]

for (i = 0; i < valores.length; i++) {
    var total = contar(valores[i])
    
    //aca determino cuales toma como string, guardo cual es la palabra mayor y que cantidad de letras tiene.
    if (total>0) {
        ordenadas.push(valores[i])
        if (total>masletras){
            masletras = total
            palabra = i
            total = 0
        }
    }
}

//ordeno de menor a mayor los elementos que ya determine que son string
var numerito = ordenadas.length-1
for (i = 0; i <= ordenadas.length; i++) {
    for (j = i+1; j <= numerito ; j++) {
        if (ordenadas[i].length > ordenadas[j].length){
            aux = ordenadas[i]
            ordenadas[i] = ordenadas[j]
            ordenadas[j] = aux
         }
    }
}

//determino que elementos son numericos dentro del array y creo un nuevo arreglo con esos elementos
for (i = 0; i < valores.length; i++) {
    if (typeof valores[i]==="number"){
        if (valores[i]!=0){
            numeros.push(valores[i])
        }
    }
}

//opero con los elementos numericos
suma = numeros[0] + numeros[1]
resta = numeros[0] - numeros[1]
multiplicacion = numeros[0] * numeros[1]
division = numeros[0] / numeros[1]

//funcion para contar las letras de lo escrito dentro del array 'valores'
function contar(letras){
    return letras.length
}

//imprimo a consola la palabra mas larga
console.log('La palabra "'+valores[palabra] + '" es la que mas letras tiene, con ' + masletras + ' letras.')

//imprimo a consola lo contenido en el array de palabras ordenadas de menor a mayor
console.log(ordenadas)

//imprimo a consola los resultados de las operaciones con los numeros
console.log(suma)
console.log(resta)
console.log(multiplicacion)
console.log(division)