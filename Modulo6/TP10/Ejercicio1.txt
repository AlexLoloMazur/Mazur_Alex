## a - Describe dos usos o funciones que proporciona la declaración DOCTYPE en una página web.

Fundamentalmente, un Doctype nos ayuda a determinar en qué versión de HTML vamos a trabajar
En versiones anteriores de HTML5 había que brindar a nuestro navegador todo tipo de datos, como el nivel del elemento, si este era público o privado, el idioma, tipo de organización, etc.  
Todos los documentos HTML deben comenzar con la declaración <!DOCTYPE>; esta no es una etiqueta HTML sino informacion que se le brinda al navegador acerca de que tipo de documento esperar.

## b - Para que se utilizan las siguientes etiquetas:

### <head> </head>:
Es un contenedor de metadatos (datos sobre datos) y se coloca entre la etiqueta *<html>* y la etiqueta *<body>*. Los metadatos son datos sobre el documento HTML. Los metadatos no se muestran.
### <title> </title>:
Define el título del documento. El título debe ser solo de texto y se muestra en la barra de título del navegador o en la pestaña de la página.
### <meta>:
Define metadatos sobre un documento HTML. Siempre van dentro del elemento *<head>* y normalmente se utilizan para especificar el juego de caracteres, la descripción de la página, las palabras clave, el autor del documento y la configuración de la ventana.
### <style> </style>:
Se utiliza para definir la información de estilo (CSS) de un documento. Especifica cómo deben mostrarse los elementos HTML en un navegador. Cuando un navegador lee una hoja de estilo, formateará el documento HTML de acuerdo con la información de la hoja de estilo.
### <body> </body>:
Define el cuerpo del documento. Contiene todo el contenido de un documento HTML, como encabezados, párrafos, imágenes, hipervínculos, tablas, listas, etc. Solo puede haber un <body> en un documento HTML.
### <h1>,<h2>,<h3>,<h4>,<h5>,<h6>:
Las etiquetas *<h1>* a *<h6>* se utilizan para definir encabezados HTML. *<h1>* representaria al encabezado mas importante y *<h6>* al encabezado menos importante.
### <a>:
Define un hipervínculo, que se utiliza para enlazar de una página a otra. El atributo más importante del elemento es *href*, que indica el destino del enlace.
### <strong>:
Etiqueta que se utiliza para definir texto con gran importancia. El contenido interior normalmente se muestra en **negrita** .
### <br>:
Inserta un salto de linea.
### <ul>:
Etiqueta que define una lista desordenada* con viñetas.  
*Hace referencia a que no hay un orden establecido en los items de la lista. Si se desea hacer una lista ordenada, se recomienda usar la etiqueta *<ol>*
### <li>:
Etiqueta que define un item de una lista. Normalmente se utiliza dentro de listas ordenadas, desordenadas y listas de menu.
### <p>:
Etiqueta que define un parrafo. Los navegadores agregan automáticamente una sola línea en blanco antes y después de cada *<p>*.
### <span>:
Es un contenedor en línea que se utiliza para marcar una parte de un texto o una parte de un documento. Se diseña fácilmente con CSS o se manipula con JavaScript usando el atributo *class* o *id*. Es muy parecida al elemento *<div>*, pero *<div>* es un elemento a nivel de bloque y *<span>* es un elemento en línea.
### <table> </table>:
Etiqueta que define una tabla HTML. Una tabla HTML consta de una etiqueta *<table>* y uno o más elementos *<tr>*, *<th>* y *<td>*. El elemento *<tr>* define una fila de la tabla , el elemento *<th>* define el encabezado de tabla y el elemento *<td>* define una celda de tabla y se debe cargar en orden en el que se desea que aparezca la informacion dentro de la tabla.
### <tr> </tr>:
Etiqueta que define una fila dentro de una tabla HTML
### <td> </td>:
Etiqueta que define una celda dentro de una tabla HTML.  

## c- La etiqueta <script> puede ir dentro de las etiquetas de de <body> o <head>, hay alguna diferencia donde pueda ir?

El renderizado e interpretacion del HTML se realiza a medida que el navegador encuentra los elementos en tu documento HTML. Por lo tanto si encuentra en la cabecera una etiqueta *<script>*, pues tendrá que esperar a que el navegador cargue el script para continuar con el renderizado de la pagina por lo que verías el navegador con la pantalla en blanco, comportamiento que uno desea evitar.