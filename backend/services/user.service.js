const  userModel = require('../models/user.model')
const jwt = require('jsonwebtoken');

class userService{


    static async registerUser(name,email, password){
        try{

            const createUser = new userModel({name,email, password})
            return await createUser.save();

        }catch(err){
            throw err;
        }
    }

    static async checker(email){
        try {
            return await userModel.findOne({email});
        } catch (error) {
            throw error
        }
    }

    static async tokenGen(tokenData, seceretkey ,jwtExpire){
        return jwt.sign(tokenData,seceretkey,{expiresIn:jwtExpire})
    }

}

module.exports = userService;