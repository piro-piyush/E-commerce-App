import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/api.dart';
import 'package:ecommerce/data/models/cart/cart_item_model.dart';

class CartRepository {
  final _api = Api();

  Future<List<CartItemModel>> fetchCartByUserId(String userId) async {
    try {
      Response response = await _api.sendRequest.get(
        "/cart/$userId",
      );
      ApiResponse apiResponse = ApiResponse.fromResponse(response);
      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }

      return (apiResponse.data as List<dynamic>)
          .map((json) => CartItemModel.fromJson(json))
          .toList();
    } catch (ex) {
      rethrow;
    }
  }

  Future<List<CartItemModel>> addToCart(String userId,
      CartItemModel cartItemModel) async {
    try {
      Map<String, dynamic> data = cartItemModel.toJson();
      data["user"] = userId;

      Response response = await _api.sendRequest.post(
        "/cart/addToCart",
        data: jsonEncode(data),
      );
      ApiResponse apiResponse = ApiResponse.fromResponse(response);
      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }

      return (apiResponse.data as List<dynamic>)
          .map((json) => CartItemModel.fromJson(json))
          .toList();
    } catch (ex) {
      rethrow;
    }
  }

  Future<List<CartItemModel>> removeFromCart(String userId,
      String product,) async {
    try {
      Map<String, dynamic> data = {
        "product": product,
        "user": userId
      };

      Response response = await _api.sendRequest.delete(
        "/cart/removeFromCart",
        data: jsonEncode(data),
      );
      ApiResponse apiResponse = ApiResponse.fromResponse(response);
      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }

      return (apiResponse.data as List<dynamic>)
          .map((json) => CartItemModel.fromJson(json))
          .toList();
    } catch (ex) {
      rethrow;
    }
  }

}
