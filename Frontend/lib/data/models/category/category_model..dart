class CategoryModel {
  String? sId;
  String? title;
  String? description;
  String? image;
  String? updatedOn;
  String? createdOn;

  CategoryModel(
      {this.sId,
        this.title,
        this.description,
        this.image,
        this.updatedOn,
        this.createdOn});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    updatedOn = json['updatedOn'];
    createdOn = json['createdOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['updatedOn'] = this.updatedOn;
    data['createdOn'] = this.createdOn;
    return data;
  }
}
