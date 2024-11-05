const CartRoutes = require('express').Router();
const CartController = require("./../controllers/cart_controller")

CartRoutes.get('/:user', CartController.getCartByUserID);
CartRoutes.post('/addToCart', CartController.addToCart);
CartRoutes.delete('/removeFromCart', CartController.removeFromCart);

module.exports = CartRoutes