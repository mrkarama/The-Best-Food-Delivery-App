import 'dart:convert';
import 'package:get/get.dart';
import 'package:restaurant/Commons/constants/api_values.dart';
import 'package:restaurant/Models/cart_model.dart';
import 'package:restaurant/commons/constants/app_values.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepository extends GetxService {
  final SharedPreferences sharedPreferences;
  CartRepository({
    required this.sharedPreferences,
  });

  Future<void> addToCart(Map<int, CartModel> items) async {
    List<String> cart = [];
    List<CartModel> cartModel = [];

    items.entries.map((e) => cartModel.add(e.value)).toList();

    for (var element in cartModel) {
      cart.add(jsonEncode(element));
    }

    await sharedPreferences.setStringList(AppValues.cartList, cart);
  }

  List<CartModel> getCartListData() {
    List<CartModel> cart = [];
    if (sharedPreferences.containsKey(AppValues.cartList)) {
      for (var item in sharedPreferences.getStringList(AppValues.cartList)!) {
        cart.add(CartModel.fromJson(jsonDecode(item)));
      }
    }

    return cart;
  }

  Future<void> addToCartHistory(Map<int, CartModel> items) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    List<String> previousCartHistory = [];
    List<String> currentCartHistory = [];

    if (sharedPreferences.containsKey(AppValues.cartHistory)) {
      previousCartHistory =
          sharedPreferences.getStringList(AppValues.cartHistory)!;
    }

    items.forEach((key, value) {
      currentCartHistory.add(jsonEncode(value));
    });

    String time = DateTime.now().toString();
    List<CartModel> cartModelOfCurrentCartHistory = [];
    List<CartModel> cartModelOfPreviousCartHistory = [];
    for (var element in currentCartHistory) {
      cartModelOfCurrentCartHistory
          .add(CartModel.fromJson(jsonDecode(element)));
    }

    for (var element in cartModelOfCurrentCartHistory) {
      element.time = time;
    }

    for (var element in previousCartHistory) {
      cartModelOfPreviousCartHistory
          .add(CartModel.fromJson(jsonDecode(element)));
    }

    List<String> saveCartList = [];
    List<CartModel> totalCartList =
        cartModelOfPreviousCartHistory + cartModelOfCurrentCartHistory;

    for (var element in totalCartList) {
      saveCartList.add(jsonEncode(element));
    }

    removeCartSharedData();
    await sharedPreferences.setStringList(AppValues.cartHistory, saveCartList);
    print(totalCartList.length);
    for (var element in totalCartList) {
      print(element.time.toString());
    }
  }

  List<CartModel> getCartHistory() {
    List<CartModel> cart = [];
    if (sharedPreferences.containsKey(AppValues.cartHistory)) {
      sharedPreferences
          .getStringList(AppValues.cartHistory)
          ?.forEach((element) {
        cart.add(CartModel.fromJson(jsonDecode(element)));
      });
    }

    return cart;
  }

  // Test purpose
  Future<void> removeCartSharedData() async {
    if (sharedPreferences.containsKey(AppValues.cartList)) {
      sharedPreferences.remove(AppValues.cartList);
    }
  }

  // Test purpose
  Future<void> removeCartHistorySharedData() async {
    if (sharedPreferences.containsKey(AppValues.cartHistory)) {
      sharedPreferences.remove(AppValues.cartHistory);
    }
  }

  // Test
  void getUserToken() {
    final String token = sharedPreferences.getString(ApiValues.token) ?? '';
    print('USER TOKEN IS ' + token);
  }
}
