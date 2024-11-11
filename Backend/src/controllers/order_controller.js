const OrderModel = require("./../models/order_model");
const CartModel = require("./../models/cart_model");

const OrderController = {
  createOrder: async function (req, res) {
    try {
      const { user, items, status } = req.body;
      const newOrder = new OrderModel({
        user: user,
        items: items,
      });
      await newOrder.save();
      //Update cart
      await CartModel.findOneAndUpdate(
        { user: user._id },
        {
          items: []
        }
      );

      return res.json({
        success: true,
        data: newOrder,
        message: "Order created",
      });
    } catch (ex) {
      return res.json({ success: false, message: ex.message });
    }
  },

  fetchOrdersByUser: async function (req, res) {
    try {
      const userId = req.params.userId;
      const foundOrders = await OrderModel.find({
        "user._id": userId,
      }).sort({ createdOn: -1 });
      return res.json({
        success: true,
        data: foundOrders,
        message: "Orders Fetched",
      });
    } catch (ex) {
      return res.json({ success: false, message: ex });
    }
  },

  updateOrderStatus: async function (req, res) {
    try {
      const { orderId, status } = req.body;
      const updatedOrder = await OrderModel.findOneAndUpdate(
        { _id: orderId },
        { status: status },
        { new: true }
      );
      return res.json({
        success: true,
        data: updatedOrder,
        message: "Status Updated",
      });
    } catch (ex) {
      return res.json({ success: false, message: ex.message });
    }
  },
};

module.exports = OrderController;
