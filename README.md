# API Node.js + Express + PostgreSQL

## Iniciar aplicação
Clone o repositório, navegue até a pasta raiz e digite:
```bash
# Instalar dependências
npm install
# Subir aplicação
npm start
```

## Instalar dependências do zero
1. Criar o arquivo package.json
```bash
npm init
```

2. Gerenciar as as rotas e requisições
```bash
npm install express
```

3. Instalar o módulo para ficar ouvindo alterações no documento e reiniciar servidor sozinho
```bash
# A tag -g significa que a instalação é global
# A tag -D significar que é uma dependência de desenvolvedor
npm install -g -D nodemon
```

4. Instalar a dependência do PostgreSQL
```bash
npm install --save pg
```

5. Instalar o CORS para limitar quem pode consumir nossa API
```bash
npm install --save cors
```

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