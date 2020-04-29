const express = require('express')

const routes = express.Router()

const ColaboradorController = require('./controllers/ColaboradorController')

// Rota para listar colaboradores
routes.get('/colaborador', ColaboradorController.index)

module.exports = routes