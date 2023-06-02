const userService = require('../services/user.service');


exports.register = async(req,res,next)=>{
    try {
        const {name,email,password} = req.body;
        const succRes = await userService.registerUser(name,email,password);

        res.json(
            {status: true, 
                success: 'Registered'});
    } catch (error) {
        
    }
}
exports.login = async(req,res,next)=>{
    try {
        const {email,password} = req.body;
        const user = await userService.checker(email);

        if(!user){
            res.status(403).json({status:false});
            return;
        }
        else{
            const isMatch = await user.comparePass(password);

            if (isMatch == false) {
                res.status(401).json({status:false});
                return;
                
            }
            let tokenData = {_id:user._id, name:user.name, email:user.email};

            const jtoken  = await userService.tokenGen(tokenData,'AAiT', '1m');

            res.status(200).json({status:true, token:jtoken});
            return;
s
        }
    } catch (error) {
        console.log(error);
        res.sendStatus(500);
        return;
    }
}