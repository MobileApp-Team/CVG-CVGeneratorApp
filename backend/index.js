const app = require('./app');
const db = require('./config/dbConnection');
const userModel = require('./models/user.model')

const port = 8000;

app.listen(port, () =>{
    console.log(`server running on port ${port}`)
})