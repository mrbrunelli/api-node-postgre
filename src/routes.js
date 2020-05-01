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
routes.post('/colaborador', ColaboradorController.createNew)
routes.put('/colaborador/:id', ColaboradorController.updateById)
routes.delete('/colaborador/:id', ColaboradorController.deleteById)

module.exports = routes