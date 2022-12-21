const mysql = require('mysql2');
const config = require("../config/config.json");

//conectarnos a nuestra DB
var connection = mysql.createConnection(config.database);

connection.connect((err) => {
    if (err) {
        console.log(err);
    } else {
        console.log("DB Conectada correctamente a tabla usuarios");
    }
});
//fin de conexion db

var usuarioDb = {};


usuarioDb.getAll = function (funCallback) {
    connection.query("SELECT * FROM usuarios where estado >=1", function (err, result, fields) {
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

usuarioDb.create = function (usuarios, funCallback) {
    var query = 'INSERT INTO usuarios (nickname,email,password,estado) VALUES (?,?,?,?)'
    var dbParams = [usuarios.nickname, usuarios.email, usuarios.password, usuarios.estado];
    connection.query(query, dbParams, function (err, result, fields) {
        if (err) {
            if(err.code == 'ER_DUP_ENTRY'){
                funCallback({
                    message: `Ya existe el usuario con el nickname ${usuarios.nickname} o con el email ${usuarios.email}`,
                    detail: err
                });
            }
            else{
                funCallback({
                    message: "Surgio un problema, contactese con un administrador. Gracias",
                    detail: err
                });
            }
            console.error(err);
        } else {
            funCallback(undefined, {
                message: `Se creo el usuario ${usuarios.nickname}`,
                detail: result
            });
        }
    });
}

/**
 * 
 * @param {*} idusuario 
 * @param {*} funCallback 
 *         retorna:
 *              code = 1 (EXITO)
 *              code = 2 (NOT FOUND) (NO encontro elemento)
 *              code = 3 (ERROR)
 * 
 */
usuarioDb.update = function (idusuario, usuarios, funCallback) {
    var query = 'UPDATE usuarios SET nickname = ? , email = ?, password = ?, estado = ? WHERE idusuario = ?'
    var dbParams = [usuarios.nickname, usuarios.email, usuarios.password, usuarios.estado, idusuario];
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
                    message: `No se encontro el usuario ${idusuario}`,
                    detail: result
                });
            } else {
                funCallback({
                    code:1,
                    message: `Se modifico el usuario ${usuarios.nickname}`,
                    detail: result
                });
            }
        }
    });

}


/**
 *  
 * @param {*} idusuario
 * @param {*} funCallback
 *         retorna:
 *              code = 1 (EXITO)
 *              code = 2 (NOT FOUND) (NO encontro elemento)
 *              code = 3 (ERROR)
 * 
 */
usuarioDb.logdelete = function (idusuario, funCallback) {
    connection.query("UPDATE usuarios SET estado = 0 WHERE idusuario = ?", idusuario, function (err, result, fields) {
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
                    message: `No se encontro el id  ${idusuario} del usuario`,
                    detail: result
                }); 
            } else {
         //       console.error(err);
                    funCallback({
                    code:1,
                    message: `Se modifico el usuario con el id ${idusuario}`,
                    detail: result
                }); 
            }
        }
    });
}

module.exports = usuarioDb;