const mongoose = require('mongoose');

const db = mongoose.createConnection("mongodb://127.0.0.1:27017/CVDB").on('open', () =>{
    console.log('DATABASE CONNECTED');
}).on('error', () =>{
    console.log('DATABSE CONNECTION ERROR')
});






module.exports = db;


