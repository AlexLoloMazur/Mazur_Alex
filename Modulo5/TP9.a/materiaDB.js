const mysql = require('mysql2');
const config = require("../config/config.json");

//conectarnos a nuestra DB
var connection = mysql.createConnection(config.database);

connection.connect((err) => {
    if (err) {
        console.log(err);
    } else {
        console.log("DB Conectada correctamente a tabla materias");
    }
});
//fin de conexion db

var materiaDb = {};


materiaDb.getAll = function (funCallback) {
    connection.query("SELECT * FROM materias where estado >=1", function (err, result, fields) {
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

materiaDb.create = function (materias, funCallback) {
    var query = 'INSERT INTO materias (nombre, objetivo, plan_estudio, estado) VALUES (?,?,?,?)'
    var dbParams = [materias.nombre, materias.objetivo, materias.plan_estudio, materias.estado];
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
                message: `Se creo la materia ${materias.nombre}`,
                detail: result
            });
        }
    });
}

/**
 * 
 * @param {*} idmateria 
 * @param {*} funCallback 
 *         retorna:
 *              code = 1 (EXITO)
 *              code = 2 (NOT FOUND) (NO encontro elemento)
 *              code = 3 (ERROR)
 * 
 */
materiaDb.update = function (idmateria, materias, funCallback) {
    var query = 'UPDATE materias SET nombre = ?, objetivo = ?, plan_estudio = ?, estado = ? WHERE idmateria = ?'
    var dbParams = [materias.nombre, materias.objetivo, materias.plan_estudio, materias.estado, idmateria];
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
                    message: `No se encontro la materia ${idmateria}`,
                    detail: result
                });
            } else {
                funCallback({
                    code:1,
                    message: `Se modifico la materia ${materias.nombre}`,
                    detail: result
                });
            }
        }
    });

}


/**
 *  
 * @param {*} idmateria
 * @param {*} funCallback
 *         retorna:
 *              code = 1 (EXITO)
 *              code = 2 (NOT FOUND) (NO encontro elemento)
 *              code = 3 (ERROR)
 * 
 */
materiaDb.logdelete = function (idmateria, funCallback) {
    connection.query("UPDATE materias SET estado = 0 WHERE idmateria = ?", idmateria, function (err, result, fields) {
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
                    message: `No se encontro el id  ${idmateria} de la materia`,
                    detail: result
                }); 
            } else {
         //       console.error(err);
                    funCallback({
                    code:1,
                    message: `Se modifico la materia con el id ${idmateria}`,
                    detail: result
                }); 
            }
        }
    });
}

module.exports = materiaDb;