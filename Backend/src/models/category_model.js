const { Schema, model } = require('mongoose');

const categorySchema = new Schema({
    title: { type: String, required: [true, "Title is required"], },
    description: { type: String, default: "" },
    image:{type:String,required:true},
    updatedOn: { type: Date },
    createdOn: { type: Date }
});

categorySchema.pre('save', function (next) {
    this.updatedOn = new Date();
    this.createdOn = new Date();

    next();
});

categorySchema.pre(['update', 'findOneAndUpdate', 'updateOne'], function (next) {
    const update = this.getUpdate();
    delete update._id;

    this.updatedOn = new Date();

    next();
});

const CategoryModel = model("Category", categorySchema);
module.exports = CategoryModel;