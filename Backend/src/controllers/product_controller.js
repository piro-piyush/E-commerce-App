const ProductModel = require('./../models/product_model');

const ProductController = {
    createProduct: async function (req, res) {
        try {
            const productData = req.body;
            const newProduct = new ProductModel(productData);
            await newProduct.save();
            return res.json({ success: true, data: newProduct, message: "Product created!" });
        } catch (ex) {
            return res.json({ success: false, message: ex.message });
        }
    },

    fetchALLProducts: async function (req, res) {
        try {
            const products = await ProductModel.find(); // Use await to resolve the promise
            return res.json({ success: true, data: products });
        } catch (ex) {
            return res.json({ success: false, message: ex.message });
        }
    },

    fetchProductById: async function (req, res) {
        try {
            const id = req.params.id;
            const foundProduct = await ProductModel.findById(id); // Use await to resolve the promise
            if (!foundProduct) {
                return res.json({ success: false, message: "Product not found!" });
            }
            return res.json({ success: true, data: foundProduct, message: "Product found!" });
        } catch (ex) {
            return res.json({ success: false, message: ex.message });
        }
    },

    fetchProductByCategoryId: async function (req, res) {
        try {
            const categoryId = req.params.categoryId;
            const foundProducts = await ProductModel.find({category : categoryId}); // Use await to resolve the promise
            if (!foundProducts) {
                return res.json({ success: false, message: "Products not found!" });
            }
            return res.json({ success: true, data: foundProducts, message: "Products found!" });
        } catch (ex) {
            return res.json({ success: false, message: ex.message });
        }
    },

};

module.exports = ProductController;
