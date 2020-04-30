/**
 * Arquivo: routes.js
 * Descrição: Gerenciar rotas da aplicação
 * Data: 29/04/2020
 * Autor: Matheus Ricardo Brunelli
 */

const express = require('express')

const routes = express.Router()

const ColaboradorController = require('./controllers/ColaboradorController')

// Rota para listar colaboradores
routes.get('/colaborador', ColaboradorController.listAll)
routes.get('/colaborador/:id', ColaboradorController.listById)
routes.post('/colaborador', ColaboradorController.create)

module.exports = routes