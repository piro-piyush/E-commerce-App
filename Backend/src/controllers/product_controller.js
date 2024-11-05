const ProductModel = require('./../models/product_model');

const ProductController = {
    createProduct: async function (req, res) {
        try {
            const productData = req.body;
            const newProduct = new ProductModel(productData);
            await newProduct.save();
            return res.json({ success: true, data: newProduct, message: "Product created !" });

        } catch (ex) {
            return res.json({ success: false, message: ex });
        }
    },

    fetchALLProducts: async function () {
        try {
            const products = ProductModel.find();
            return res.json({ success: true, data: products, });
        } catch (ex) {
            return res.json({ success: false, message: ex });
        }
    },

    fetchProductById: async function () {
        try {
            const id = req.params.id;
            const foundProduct = ProductModel.findById(id);
            return res.json({ success: true, data: foundProduct, message: "Product found !" });
        } catch (ex) {
            return res.json({ success: false, message: ex });
        }
    }
};

module.exports = ProductController;