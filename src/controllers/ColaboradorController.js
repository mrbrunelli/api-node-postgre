/**
 * Arquivo: ColaboradorController.js
 * Descrição: Responsável por gerenciar os colaboradores (Cadastrar, Listar, Atualizar e Deletar Colaboradores)
 * Data: 24/04/2020
 * Autor: Matheus Ricardo Brunelli
 */

const db = require('../config/database')

module.exports = {
    // Listar todos colaboradores
    async listAll(req, res) {
        try {
            const response = await db.query("SELECT * FROM colaborador")
            return res.json(response.rows)
        } catch (err) {
            return res.status(400).json({
                error: true,
                message: `Erro ao realizar consulta: ${err}`
            })
        }
    },

    // Listar apenas um colaborador, usando id como parâmetro
    async listById(req, res) {
        try {
            const response = await db.query(`SELECT * FROM colaborador WHERE idcolaborador = ${req.params.id}`)
            return res.json(response.rows)
        } catch (err) {
            return res.status(400).json({
                error: true,
                message: `Erro ao realizar consulta: ${err}`
            })
        }
    },

    // Cadastrar colaborador
    async create(req, res) {
        const {
            nome,
            cpf,
            email,
            idfilial
        } = req.body
        try {
            const { rows } = await db.query(
                "INSERT INTO colaborador (nome, cpf, email, idfilial) VALUES ($1, $2, $3, $4)",
                [nome, cpf, email, idfilial]
            )

            return res.json({
                error: false,
                message: 'Colaborador cadastrado com sucesso!',
                body: {
                    colaborador: {
                        nome,
                        email,
                        idfilial
                    }
                }
            })
        } catch (err) {
            return res.status(400).json({
                error: true,
                message: `Erro ao cadastrar colaborador: ${err}`
            })
        }
    },

    // Atualizar cadastro do colaborador
    async update(req, res) {
        const {
            nome,
            cpf,
            email,
            idfilial,
            idsituacaousuario
        } = req.body
        try {
            const { rows } = await db.query(
                "UPDATE colaborador SET nome = $1, cpf = $2, email = $3, idfilial = $4, idsituacaousuario = $5",
                [nome, cpf, email, idfilial, idsituacaousuario]
            )

            return res.json({
                error: false,
                message: 'Colaborador atualizado com sucesso!',
                body: {
                    colaborador: {
                        nome,
                        email,
                        idfilial,
                        idsituacaousuario
                    }
                }
            })
        } catch (err) {
            return res.status(400).json({
                error: true,
                message: `Erro ao cadastrar colaborador: ${err}`
            })
        }
    }
}