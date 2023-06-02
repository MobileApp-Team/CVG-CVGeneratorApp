const mongoose = require('mongoose');
const bcrypt = require('bcrypt');
const db = require('../config/dbConnection'); 

const {Schema} = mongoose;

const userSchema = new Schema({

    name:{

        type: String,
        required: true,
        
    },

    email:{
        type: String,
        required : true,
        unique: true,
        lowercase: true

    },

    password:{
        type: String,
        required: true
    }
});

userSchema.pre('save', async function(){
    try {
        var user = this;
        const salt = await (bcrypt.genSalt(10));
        const hashed = await bcrypt.hash(user.password,salt);
        user.password = hashed;
        
    } catch (error) {

        throw error
        
    }
});

userSchema.methods.comparePass = async function(loginpassword) {

    try {
        const comparison = await bcrypt.compare(loginpassword, this.password)
        return comparison;
    } catch (error) {
        throw error
    }
    
};




const userModel = db.model('user' , userSchema);
module.exports = userModel;
