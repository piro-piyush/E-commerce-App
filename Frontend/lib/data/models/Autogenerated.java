
class CartItemModel {
  ProductModel? product;
  int? quantity;
  String? sId;

  CartItemModel({this.quantity, this.sId});

  CartItemModel.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    data['_id'] = this.sId;
    return data;
  }
}