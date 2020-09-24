const admin = require('../services/firebase');
const logger = require('../log/logger')('Backend');

const authMiddleware = (whiteList = []) => (req, res, next) => {
    //skip whitelisted urls
    // if(whiteList.find(req.baseUrl))
    //     next();
    //authenticate request
    return admin.auth().verifyIdToken(req.headers.authorization)
        .then(function (decodedToken) {
            req.uid = decodedToken.uid;
            return next();
        }).catch(function (error) {
            logger.info(error);
            return res.status(401).send('Failed to authenticate your request');
        });
};

module.exports = authMiddleware;