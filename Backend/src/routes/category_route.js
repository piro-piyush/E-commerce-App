const CategoryRoutes = require('express').Router();
const CategoryController = require('../controllers/category_controller');

CategoryRoutes.post("/createCategory", CategoryController.createCategory);
CategoryRoutes.get("/", CategoryController.fetchAllCategories);

module.exports = CategoryRoutes;
