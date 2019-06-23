/* global CONFIG, _, MiscHelper */

'use strict'

const allowClientAccessAPI = [
  'X-PRODUCT-X'
]

exports.requiresAuthorization = (req, res, next) => {
  const reqHeaderSecretKey = req.headers.authorization

  if (_.isEmpty(reqHeaderSecretKey)) return MiscHelper.errorCustomStatus(res, 'Unauthorized, need access token to access this API route', 401)

  const internalAccess = _.includes(allowClientAccessAPI, reqHeaderSecretKey)

  if (!internalAccess) return MiscHelper.errorCustomStatus(res, 'Unauthorized, authorization value is invalid/expired', 401)

  next()
}