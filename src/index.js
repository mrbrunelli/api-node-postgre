const express = require('express')

const app = express()

// A Rota inicial será a /api
app.use('/api', require('./routes'))

app.listen(8080, () => {
    console.log('Servidor iniciado na porta 8080: http://localhost:8080/')
})