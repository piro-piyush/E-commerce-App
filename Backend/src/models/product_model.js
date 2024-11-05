const { Schema, model } = require('mongoose');

const productSchema = new Schema({
    title: { type: String, required: [true, "Title is required"], },
    images: { type: Array, default: [] },
    price: { type: Number, required: true },
    description: { type: String, default: "" },
    category: { type: Schema.Types.ObjectId, ref: 'Category', required: true },
    updatedOn: { type: Date },
    createdOn: { type: Date }
});

productSchema.pre('save', function (next) {
    this.updatedOn = new Date();
    this.createdOn = new Date();
    next();
});

productSchema.pre(['update', 'findOneAndUpdate', 'updateOne'], function (next) {
    const update = this.getUpdate();
    delete update._id;

    this.updatedOn = new Date();

    next();
});

const ProductModel = model("Product", productSchema);
module.exports = ProductModel;