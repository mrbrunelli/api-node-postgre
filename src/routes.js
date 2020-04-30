/**
 * Arquivo: routes.js
 * Descrição: Gerenciar rotas da aplicação
 * Data: 29/04/2020
 * Autor: Matheus Ricardo Brunelli
 */

const express = require('express')

const routes = express.Router()

const ColaboradorController = require('./controllers/ColaboradorController')

// Rotas Colaborador
routes.get('/colaborador', ColaboradorController.listAll)
routes.get('/colaborador/:id', ColaboradorController.listById)
routes.post('/colaborador', ColaboradorController.create)
routes.put('/colaborador/:id', ColaboradorController.update)
routes.delete('/colaborador/:id', ColaboradorController.delete)

module.exports = routes