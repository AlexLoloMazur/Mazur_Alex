/*Ejercicio 8:
Crea una función que genere 100 números aleatorios entre 1 y 100 que no se repitan y luego
imprima por pantalla usando document.write(text)*/
var ini = 1
var fin = 100;
var segmento = []
while(segmento.length < fin ){
  numeroAleatorio = aleatorio(ini,fin)
  var existe = false;
  for(var i=0;i<segmento.length;i++){
	if(segmento [i] === numeroAleatorio){
        existe = true;
        break;
    }
  }
  if(!existe){
    segmento[segmento.length] = numeroAleatorio;
  }
}

for(var i=0;i<fin;i++){
  document.write("</br>")
  document.write(segmento[i]);
}

function aleatorio(numero){
    var numero = Math.floor(Math.random() * (fin) + ini)
    return numero
  }