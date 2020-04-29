/**
 * Arquivo: ColaboradorController.js
 * Descrição: Responsável por gerenciar os colaboradores
 * Data: 24/04/2020
 * Autor: Matheus Ricardo Brunelli
 */

const db = require('../config/database')

module.exports = {
    // Listar todos colaboradores
    async index(req, res) {
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
    async find(req, res) {
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
}