/**
 * Arquivo: index.js
 * Descrição: Responsável por por chamar a API da aplicação
 * Data: 29/04/2020
 * Autor: Matheus Ricardo Brunelli
 */

// Dependências necessárias para trabalhar com rotas e segurança
const express = require('express')
const cors = require('cors')
const app = express()

// Retornar dados em JSON
app.use(express.json())

// As requisições usarão o CORS e Next. Somente cliente autenticado poderá consumir essa API
app.use((req, res, next) => {
    console.log('Acessou o Middleware!')
    res.header("Access-Control-Allow-Origin", "*")
    res.header("Access-Control-Allow-Methods", "GET, PUT, POST, DELETE")
    app.use(cors())
    next()
})

// A Rota inicial será a /api
app.use('/api', require('./routes'))

// Ouvindo aplicação na porta 8080
app.listen(8080, () => {
    console.log('Servidor iniciado na porta 8080: http://localhost:8080/')
})