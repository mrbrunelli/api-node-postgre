/**
 * Arquivo: index.js
 * Descrição: Responsável por por chamar a API da aplicação
 * Data: 29/04/2020
 * Autor: Matheus Ricardo Brunelli
 */

const express = require('express')
const cors = require('cors')

const app = express()

app.use(express.json())

app.use((req, res, next) => {
    console.log('Acessou o Middleware!')
    res.header("Access-Control-Allow-Origin", "*")
    res.header("Access-Control-Allow-Methods", "GET, PUT, POST, DELETE")
    app.use(cors())
    next()
})

// A Rota inicial será a /api
app.use('/api', require('./routes'))

app.listen(8080, () => {
    console.log('Servidor iniciado na porta 8080: http://localhost:8080/')
})