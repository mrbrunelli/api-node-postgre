const db = require('../config/database')

module.exports = {
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
    }
}