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