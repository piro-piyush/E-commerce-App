class ProductModel {
  String? sId;
  String? title;
  List<String>? images;
  int? price;
  String? description;
  String? category;
  String? updatedOn;
  String? createdOn;

  ProductModel(
      {this.sId,
      this.title,
      this.images,
      this.price,
      this.description,
      this.category,
      this.updatedOn,
      this.createdOn});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    images = json['images'].cast<String>();
    price = json['price'];
    description = json['description'];
    category = json['category'];
    updatedOn = json['updatedOn'];
    createdOn = json['createdOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['images'] = this.images;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['updatedOn'] = this.updatedOn;
    data['createdOn'] = this.createdOn;
    return data;
  }
}
