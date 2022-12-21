const mysql = require('mysql2');
const config = require("../config/config.json");

//conectarnos a nuestra DB
var connection = mysql.createConnection(config.database);

connection.connect((err) => {
    if (err) {
        console.log(err);
    } else {
        console.log("DB Conectada correctamente a tabla cursos");
    }
});
//fin de conexion db

var cursoDb = {};


cursoDb.getAll = function (funCallback) {
    connection.query("SELECT * FROM cursos where estado >=1", function (err, result, fields) {
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

cursoDb.create = function (cursos, funCallback) {
    var query = 'INSERT INTO cursos (nombre,descripcion,estado) VALUES (?,?,?)'
    var dbParams = [cursos.nombre, cursos.descripcion, cursos.estado];
    connection.query(query, dbParams, function (err, result, fields) {
        if (err) {
            if(err.code == 'ER_DUP_ENTRY'){
                funCallback({
                    message: `Ya existe el curso con el ID ${cursos.idcurso}`,
                    detail: err
                });
            }else{
                funCallback({
                    message: "Surgio un problema, contactese con un administrador. Gracias",
                    detail: err
                });
            }
            
            console.error(err);
        } else {
            funCallback(undefined, {
                message: `Se creo el curso ${cursos.nombre}`,
                detail: result
            });
        }
    });
}

/**
 * 
 * @param {*} idcurso 
 * @param {*} funCallback 
 *         retorna:
 *              code = 1 (EXITO)
 *              code = 2 (NOT FOUND) (NO encontro elemento)
 *              code = 3 (ERROR)
 * 
 */
cursoDb.update = function (idcurso, cursos, funCallback) {
    var query = 'UPDATE cursos SET nombre = ? , descripcion = ?, estado = ? WHERE idcurso = ?'
    var dbParams = [cursos.nombre, cursos.descripcion, cursos.estado, idcurso];
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
                    message: `No se encontro el curso ${idcurso}`,
                    detail: result
                });
            } else {
                funCallback({
                    code:1,
                    message: `Se modifico el curso ${cursos.nombre}`,
                    detail: result
                });
            }
        }
    });

}


/**
 *  
 * @param {*} idcurso 
 * @param {*} funCallback
 *         retorna:
 *              code = 1 (EXITO)
 *              code = 2 (NOT FOUND) (NO encontro elemento)
 *              code = 3 (ERROR)
 * 
 */
cursoDb.logdelete = function (idcurso, funCallback) {
    connection.query("UPDATE cursos SET estado = 0 WHERE idcurso = ?", idcurso, function (err, result, fields) {
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
                    message: `No se encontro el id  ${idcurso} del curso`,
                    detail: result
                }); 
            } else {
         //       console.error(err);
                    funCallback({
                    code:1,
                    message: `Se modifico el curso con el id ${idcurso}`,
                    detail: result
                }); 
            }
        }
    });
}

module.exports = cursoDb;