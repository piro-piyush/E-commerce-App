const UserRoutes = require("express").Router();
const UserController = require("./../controllers/user_controller");

UserRoutes.post("/createAccount", UserController.createAccount);
UserRoutes.post("/signIn", UserController.signIn);
UserRoutes.put("/updateUser/:id", UserController.updateUser);
UserRoutes.delete("/clearCart/:cartId", UserController.clearCart);

module.exports = UserRoutes;
