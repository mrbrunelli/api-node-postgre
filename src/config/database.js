/**
 * Arquivo: database.js
 * Descrição: Responsável por instanciar conexão com o Banco de Dados
 * Data: 29/04/2020
 * Autor: Matheus Ricardo Brunelli
 */

const { Pool } = require('pg')

// Criar nova conexão com o PostgreSQL. Muito parecido com o PDO :D
const pool = new Pool({
    host: 'localhost',
    user: 'postgres',
    password: 'postgres',
    database: 'postgres',
    port: 5432
})

module.exports = pool