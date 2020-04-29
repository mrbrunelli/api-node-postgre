const express = require('express')

const routes = express.Router()

const ColaboradorController = require('./controllers/ColaboradorController')

// Rota para listar colaboradores
routes.get('/colaborador', ColaboradorController.index)
routes.get('/colaborador/:id', ColaboradorController.indexOne)

module.exports = routes