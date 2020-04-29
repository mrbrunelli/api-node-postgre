# API Node.js + Express + PostgreSQL

## Docker
Para subir o container do PostgreSQL, navegue na pasta raíz e digite:
```docker
docker-compose up -d
```

Configuração Banco de Dados
```javascript
const pool = new Pool({
    host: 'localhost',
    user: 'postgres',
    password: 'postgres',
    database: 'postgres',
    port: 5432
})
```