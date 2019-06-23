'use strict'

module.exports = {
  get: (conn, limit, offset, keyword, callback) => {
    conn.getConnection((errConnection, connection) => {
      if (errConnection) console.error(errConnection)

      connection.query(`SELECT * FROM books WHERE status = 1 AND (name LIKE '%${keyword}%' OR author LIKE '%${keyword}%' OR description LIKE '%${keyword}%') ORDER BY id DESC LIMIT ${offset}, ${limit}`, (err, rows) => {
        callback(err, rows)
      })
    })
  },
  getTotal: (conn, keyword, callback) => {
    conn.getConnection((errConnection, connection) => {
      if (errConnection) console.error(errConnection)

      connection.query(`SELECT COUNT(*) as total FROM books WHERE status=1 AND (name LIKE '%${keyword}%' OR author LIKE '%${keyword}%' OR description LIKE '%${keyword}%')`, (err, rows) => {
        callback(err, rows)
      })
    })
  },
  getBook: (conn, productId, callback) => {
    conn.getConnection((errConnection, connection) => {
      if (errConnection) console.error(errConnection)

      connection.query(`SELECT * FROM books WHERE status = 1 AND id = ?`, productId, (err, rows) => {
        callback(err, rows)
      })
    })
  },
}
