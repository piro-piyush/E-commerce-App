const UserModel = require('./../models/user_model');

const UserController = {
    createAccount: async function (req, res) {
        try {
            const userData = req.body;
            const newUser = new UserModel(userData);

            // Save the new user document to the database
            await newUser.save();

            return res.status(201).json({
                success: true,
                data: newUser,
                message: "User created successfully!"
            });
        } catch (error) {
            return res.status(500).json({
                success: false,
                message: "An error occurred while creating the user.",
                error: error.message  // Only include the error message, not the full error object
            });
        }
    },
    signIn: async function(req,res) {
        try{
            const {email, password} = req.body;
            const foundUser = await UserModel.findOne({email:email});
            if(!foundUser){
                return res.status.json({
                    success: false,
                    message: "User not found",
                    error: error.message  // Only include the error message, not the full error object
                });
            }
        } catch (error) {
            return res.status(500).json({
                success: false,
                message: "An error occurred while creating the user.",
                error: error.message  // Only include the error message, not the full error object
            });
        }
    }
};

module.exports = UserController;
