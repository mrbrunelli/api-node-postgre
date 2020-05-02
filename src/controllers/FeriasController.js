/**
 * Arquivo: FeriasController.js
 * Descrição: Responsável por gerenciar as férias dos colaboradores (Cadastrar, Listar, Atualizar e Deletar)
 * Data: 02/05/2020
 * Autor: Matheus Ricardo Brunelli
 */

const db = require('../config/database')
//const moment = require('moment')
//const timezone = require('moment-timezone')

module.exports = {
    // Listar todas as férias
    async listAll(req, res) {
        try {
            const response = await db.query("SELECT * FROM ferias")
            return res.json(response.rows)
        } catch (err) {
            return res.status(400).json({
                error: true,
                message: `Erro ao listar férias: ${err}`
            })
        }
    },

    // Listar férias por ID
    async listById(req, res) {

    },

    // Cadastrar Férias
    async createNew(req, res) {
        const {
            idcolaborador,
            datainicio,
            datafim
        } = req.body

        // Vou usar o Current_Time_Stamp do banco
        // const datainclusao = new Date().toLocaleString('en-US', { timeZone: 'America/Sao_Paulo' })
        // const datainclusao = moment().tz('America/Sao_Paulo')

        try {
            await db.query("INSERT INTO ferias (idcolaborador, datainclusao, datainicio, datafim) VALUES ($1, $2, $3, $4)",
                [idcolaborador, datainclusao, datainicio, datafim]
            )

            return res.json({
                error: false,
                message: 'Férias cadastrada com sucesso!'
            })

        } catch (err) {
            return res.status(400).json({
                error: true,
                message: `Erro ao cadastrar férias: ${err}`
            })
        }
    },
}