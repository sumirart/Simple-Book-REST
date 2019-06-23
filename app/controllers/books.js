/* global _ */

'use strict'

const async = require('async')
const booksModel = require('../models/books')
const redisCache = require('../libs/RedisCache')

exports.get = (req, res) => {
  const limit = _.result(req.query, 'limit', 10)
  const offset = _.result(req.query, 'offset', 0)
  const keyword = _.result(req.query, 'keyword', '')

  const key = `get-books-all-${limit}-${offset}-${keyword}`

  async.waterfall([
    (cb) => {
      redisCache.get(key, books => {
        if (_.result(books, 'data')) {
          return MiscHelper.responses(res, books.data, 200, {total: books.total})
        } else {
          cb(null)
        }
      })
    },
    (cb) => {
      booksModel.get(req, limit, offset, keyword, (errBooks, resultBooks) => {
        cb(errBooks, resultBooks)
      })
    },
    (dataBooks, cb) => {
      booksModel.getTotal(req, keyword, (errBooks, total) => {
        let resultBooks = {
          data: dataBooks,
          total: total[0].total
        }
        cb(errBooks, resultBooks)
      })
    },
    (dataBooks, cb) => {
      redisCache.setex(key, 600, dataBooks)
      console.log(`${key} is cached`)
      cb(null, dataBooks)
    }
  ], (errBooks, resultBooks) => {
    if (!errBooks) {
      return MiscHelper.responses(res, resultBooks.data, 200, { total: resultBooks.total })
    } else {
      return MiscHelper.errorCustomStatus(res, errBooks, 404)
    }
  })
}

exports.getBook = (req, res) => {
  req.checkParams('id', 'idd is required').notEmpty().isInt()

  if (req.validationErrors()) {
    return MiscHelper.errorCustomStatus(res, req.validationErrors(true))
  }

  const key = `get-books-${req.params.id}`

  async.waterfall([
    (cb) => {
      redisCache.get(key, book => {
        if (book) {
          return MiscHelper.responses(res, book)
        } else {
          cb(null)
        }
      })
    },
    (cb) => {
      booksModel.getBook(req, req.params.id, (errBook, resultBook) => {
        cb(errBook, resultBook[0])
      })
    },
    (dataBook, cb) => {
      redisCache.setex(key, 600, dataBook)
      console.log(`${key} is cached`)
      cb(null, dataBook)
    }
  ], (errBook, dataBook) => {
    if (!errBook) {
      return MiscHelper.responses(res, dataBook)
    } else {
      return MiscHelper.errorCustomStatus(res, errBook, 404)
    }
  })
}
