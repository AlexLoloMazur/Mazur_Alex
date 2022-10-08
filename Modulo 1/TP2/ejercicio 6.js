/*Ejercicio 6:
Escribir un script que muestre la posición de la primera vocal de un texto introducido por
teclado.Por ejemplo: perro = “e” es la letra Nº2 ; árbol = “a” es la letra Nº1*/
var vocal = 0
var palabra= prompt("Ingrese un texto para comparar")
var texto = palabra.toLowerCase()
for (i=0; i<texto.length; i++){
    if (texto[i]==="a" || texto[i]==="á"){
        vocal = i+1
    }else{
        if (texto[i]==="e" || texto[i]==="é"){
            vocal = i+1
        }else{
            if (texto[i]==="i" || texto[i]==="í"){
                vocal = i+1
            }else{
                if (texto[i]==="o" || texto[i]==="ó"){
                    vocal = i+1
                }else{
                    if (texto[i]==="u" || texto[i]==="ú"){
                        vocal = i+1
                    }
                }
            }
        }
    }
    if (vocal!=0){
        console.log("La primera vocal de la palabra ingresada es '"+texto[vocal-1]+"' y es la "+vocal+" letra del texto")
        break
    }
}