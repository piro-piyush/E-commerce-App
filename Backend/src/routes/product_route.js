const ProductRoutes = require('express').Router();
const ProductController = require('./../controllers/product_controller');

ProductRoutes.post("/createProduct", ProductController.createProduct);
ProductRoutes.get("/", ProductController.fetchALLProducts);
ProductRoutes.get("/:id", ProductController.fetchProductById);
ProductRoutes.get("/category/:categoryId", ProductController.fetchProductByCategoryId);

module.exports = ProductRoutes;