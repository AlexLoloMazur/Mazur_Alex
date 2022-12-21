const mysql = require('mysql2');
const config = require("../config/config.json");

//conectarnos a nuestra DB
var connection = mysql.createConnection(config.database);

connection.connect((err) => {
    if (err) {
        console.log(err);
    } else {
        console.log("DB Conectada correctamente a tabla sedes");
    }
});
//fin de conexion db

var sedeDb = {};


sedeDb.getAll = function (funCallback) {
    connection.query("SELECT * FROM sedes where estado >=1", function (err, result, fields) {
        if (err) {
            funCallback({
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            });
            console.error(err);
        } else {
            funCallback(undefined, result);
        }
    });
}

sedeDb.create = function (sedes, funCallback) {
    var query = 'INSERT INTO sedes (nombre, direccion, localidad, cod_postal, telcontacto, telcontacto2, estado) VALUES (?,?,?,?,?,?,?)'
    var dbParams = [sedes.nombre, sedes.direccion, sedes.localidad, sedes.cod_postal, sedes.telcontacto, sedes.telcontacto2, sedes.estado];
    connection.query(query, dbParams, function (err, result, fields) {
        if (err) {
            funCallback({
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            });
            console.error(err);
        } 
        else {
            funCallback(undefined, {
                message: `Se creo la sede ${sedes.nombre}`,
                detail: result
            });
        }
    });
}

/**
 * 
 * @param {*} idsede 
 * @param {*} funCallback 
 *         retorna:
 *              code = 1 (EXITO)
 *              code = 2 (NOT FOUND) (NO encontro elemento)
 *              code = 3 (ERROR)
 * 
 */
sedeDb.update = function (idsede, sedes, funCallback) {
    var query = 'UPDATE sedes SET nombre = ?, direccion = ?, localidad = ?, cod_postal = ?, telcontacto = ?, telcontacto2 = ?, estado = ? WHERE idsede = ?'
    var dbParams = [sedes.nombre, sedes.direccion, sedes.localidad, sedes.cod_postal, sedes.telcontacto, sedes.telcontacto2, sedes.estado, idsede];
    connection.query(query, dbParams, function (err, result, fields) {
        if (err) {
            funCallback({
                code:3,
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            });
            console.error(err);
        } else {
            if (result.affectedRows == 0) {
                funCallback({
                    code:2,
                    message: `No se encontro la sede ${idsede}`,
                    detail: result
                });
            } else {
                funCallback({
                    code:1,
                    message: `Se modifico la sede ${sedes.nombre}`,
                    detail: result
                });
            }
        }
    });

}


/**
 *  
 * @param {*} idsede
 * @param {*} funCallback
 *         retorna:
 *              code = 1 (EXITO)
 *              code = 2 (NOT FOUND) (NO encontro elemento)
 *              code = 3 (ERROR)
 * 
 */
sedeDb.logdelete = function (idsede, funCallback) {
    connection.query("UPDATE sedes SET estado = 0 WHERE idsede = ?", idsede, function (err, result, fields) {
        if (err) {
            funCallback({
                code:3,
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            }); 
            console.error(err);
        } else {
            if (result.affectedRows == 0) {
                funCallback({
                    code:2,
                    message: `No se encontro el id  ${idsede} de la sede`,
                    detail: result
                }); 
            } else {
         //       console.error(err);
                    funCallback({
                    code:1,
                    message: `Se modifico la sede con el id ${idsede}`,
                    detail: result
                }); 
            }
        }
    });
}

module.exports = sedeDb;