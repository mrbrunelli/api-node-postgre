# API Node.js + Express + PostgreSQL

## Organização das pastas
```bash
# Exemplo
 - src
     - config
         - database.js
     - controllers
         - ColaboradorController.js
     - index.js
     - routes.js
 - docker-compose.yml
 - package.json
```

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