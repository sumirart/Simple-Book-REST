'use strict'

const BooksControllers = require('../../controllers/books')
let Route = express.Router()

Route
  // .all('/*', AuthHelper.requiresAuthorization)
  .get('/get', BooksControllers.get)
  .get('/get/:id', BooksControllers.getBook)

module.exports = Route