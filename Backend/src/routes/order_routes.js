const OrderRoutes = require('express').Router();
const OrderController = require('./../controllers/order_controller');

OrderRoutes.post("/createOrder", OrderController.createOrder);
OrderRoutes.get("/:userId", OrderController.fetchOrdersByUser);
OrderRoutes.put("/updateStatus", OrderController.updateOrderStatus);


module.exports = OrderRoutes;