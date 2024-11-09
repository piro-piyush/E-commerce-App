const CartModel = require('./../models/cart_model');

const CartController = {
    addToCart: async function (req, res) {
        try {
            const { user, product, quantity } = req.body;
            const foundCart = await CartModel.findOne({ user: user });

            // If cart does not exist
            if (!foundCart) {
                const newCart = new CartModel({ user: user });
                newCart.items.push({
                    product: product,
                    quantity: quantity
                });

                await newCart.save();
                return res.json({ success: true, data: newCart, message: "Product added to cart" });
            }

            // If cart does exist
            const updatedCart = await CartModel.findOneAndUpdate(
                { user: user },
                {
                    $push: { items: { product: product, quantity: quantity } }
                },
                { new: true }
            );
            return res.json({ success: true, data: updatedCart.items, message: "Product added to cart" });
        } catch (ex) {
            return res.json({ success: false, message: ex.message });
        }
    },

    removeFromCart: async function (req, res) {
        try {
            const { user, product } = req.body;
            const updatedCart = await CartModel.findOneAndUpdate(
                { user: user },
                { $pull: { item: { product: product } } },
                { new: true }
            );

            return res.json({ success: true, message: "Product removed from cart" });
        } catch (ex) {
            return res.json({ success: false, message: ex.message });
        }
    },

    getCartByUserID: async function (req, res) {
        try {
            const user = req.params.user;
            const foundCart = await CartModel.findOne({ user: user }).populate("items.product");
            if (!foundCart) {
                return res.json({ success: true, data: [], message: "No cart exist!!" });
            }
            return res.json({ success: true, data: foundCart, message: "Cart Found !!" });
        } catch (ex) {
            return res.json({ success: false, message: ex.message });
        }
    }
};

module.exports = CartController;
