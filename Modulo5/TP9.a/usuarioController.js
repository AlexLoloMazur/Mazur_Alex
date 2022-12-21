require("rootpath")();
const express = require('express');
const app = express();

const usuarioDb = require("../datasource/usuarioDB.js");


app.get('/', getAll);

app.post('/', create);

app.put('/:idusuario', update);

app.delete('/:idusuario', eliminacionlogica);

// Metododo para listar todos los usuarios 
function getAll(req, res) {
    usuarioDb.getAll(function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}

// Metodo para agregar usuarios
function create(req, res) {
    usuarioDb.create(req.body, function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para modificar usuarios
function update(req, res) {
    usuarioDb.update(req.params.idusuario, req.body, function (result) {
        if (result.code == 3) {
            res.status(500).send(err);
        } else if (result.code == 2) {
            res.status(404).json(result);
        } else {
            res.json(result);
        }
    });
}
// Metodo par eliminar usuarios cambiando el estado a 0
function eliminacionlogica(req, res) {
    usuarioDb.logdelete(req.params.idusuario, function (result) {
        if (result.code == 3) {
            res.status(500).send(err);
        } else if (result.code == 2) {
                res.status(404).json(result);  
        } else if (result.code == 1) {      
            res.json(result);
        }
    });
}

module.exports = app;