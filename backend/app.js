const express = require('express')
const bodyParser = require('body-parser');
const userRouter = require('./routes/user.route')

const app = express();

app.use(bodyParser.json());

app.use('/user' , userRouter);


module.exports = app;