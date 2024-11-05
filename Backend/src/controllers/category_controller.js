const Categorymodel = require("../models/category_model");

const CategoryController = {
    createCategory: async function (req, res) {
        try {
            const categoryData = req.body;
            const newCategory = new Categorymodel(categoryData);
            await newCategory.save();
            return res.json({ success: true, data: newCategory, message: "Category created !!" });
        } catch (ex) {
            return res.json({ success: false, message: ex });
        }
    },

    fetchAllCategories: async function (req, res) {
        try {
            const categories = await Categorymodel.find();
            return res.json({ success: true, data: categories, });
        } catch (ex) {
            return res.json({ success: false, message: ex });
        }
    }
};

module.exports = CategoryController;