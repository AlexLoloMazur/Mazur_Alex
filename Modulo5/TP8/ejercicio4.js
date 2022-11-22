// OBTENER NOMBRES
const fs = require("fs");
const rawdata = fs.readFileSync("./personas.json", "utf8");
var persona = JSON.parse(rawdata);


function getNombre(buscar) {
  for (var i = 0; i < buscar["personas"].length; i++) {
    if (buscar["personas"][i]["Localidad"] === "Posadas") {
        console.log(buscar["personas"][i]["Nombre"] + " " + buscar["personas"][i]["Apellido"]);
    }
  }
}

getNombre(persona);