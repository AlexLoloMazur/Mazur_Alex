const fs = require("fs");
const rawdata = fs.readFileSync("./departamentos.json", "utf8");
var departamentos = JSON.parse(rawdata);
//console.log(departamentos);

function empleados(buscar) {
    for (var i = 0; i < buscar["departamentos"]["Tecnología"].length; i++) {
        console.log(buscar["departamentos"]["Tecnología"][i]["nombre"] + " " + buscar["departamentos"]["Tecnología"][i]["puesto"]);
    }
  }
  
  empleados(departamentos);