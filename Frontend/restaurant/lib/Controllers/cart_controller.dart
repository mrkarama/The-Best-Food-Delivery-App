import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/constants/route_names.dart';
import 'package:restaurant/Commons/widgets/custom_snackbar.dart';
import 'package:restaurant/Models/products_model.dart';
import 'package:restaurant/Views/payment/widget/cash_order_success.dart';
import '../Data/Repositories/cart_repo.dart';
import '../Models/cart_model.dart';

class CartController extends GetxController implements GetxService {
  final CartRepository cartRepository;

  CartController({
    required this.cartRepository,
  });

  Map<int, CartModel> _items = <int, CartModel>{};
  Map<int, CartModel> _cartHistoryitems = <int, CartModel>{};
  double _totalAmount = 0.0;
  int _totalQuantity = 0;

  List<CartModel> storageItems = [];

  Map<int, CartModel> get items => _items;
  Map<int, CartModel> get cartHistoryItems => _cartHistoryitems;
  int get totalQuantity => _totalQuantity;
  double get totalAmount => _totalAmount;

  Future<void> addItem(
    ProductsModel productsModel,
    int quantity,
  ) async {
    if (_items.containsKey(productsModel.id)) {
      var totalQuantity = 0;
      _items.update(
        productsModel.id,
        (value) {
          totalQuantity = value.quantity + quantity;
          return CartModel(
            id: value.id,
            title: value.title,
            category: value.category,
            image: value.image,
            description: value.description,
            rating: value.rating,
            price: value.price,
            quantity: value.quantity + quantity,
            isExist: true,
            time: DateTime.now().toString(),
            productsModel: productsModel,
          );
        },
      );

      if (totalQuantity == 0) {
        _items.remove(productsModel.id);
      }
    } else {
      _items.putIfAbsent(
        productsModel.id,
        () {
          return CartModel(
            id: productsModel.id,
            title: productsModel.title,
            category: productsModel.category,
            description: productsModel.description,
            rating: productsModel.rating,
            image: productsModel.image,
            price: productsModel.price,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
            productsModel: productsModel,
          );
        },
      );
      update();
    }

    await cartRepository.addToCart(_items);
    update();
  }

  List<CartModel> get getItems {
    List<CartModel> cartItems = [];
    if (_items.isEmpty) {
      cartItems = [];
    } else {
      _items.forEach((key, value) {
        cartItems.add(value);
      });
    }

    return cartItems;
  }

  void getTotalItems() {
    _totalQuantity = 0;
    if (_items.isEmpty) {
      _totalQuantity = 0;
    } else {
      _items.forEach(
        (key, value) {
          _totalQuantity += value.quantity;
        },
      );
    }
  }

  void getTotalAmount() {
    _totalAmount = 0;
    _items.forEach((key, value) {
      _totalAmount += (value.quantity * value.price) + 0.0;
    });
  }

  void getCartData() {
    /* This function will be called when we boot the app */
    storageItems = cartRepository.getCartListData();

    for (int i = 0; i < storageItems.length; i++) {
      _items.putIfAbsent(storageItems[i].id, () => storageItems[i]);
    }

    getTotalItems();
    getTotalAmount();
  }

  set setItemsWhenBootingTheApp(List<CartModel> items) {
    storageItems = items;
  }

  // Test Purpose
  void removeCartSharedData() {
    cartRepository.removeCartSharedData();
  }

  // Test Purpose
  void removeCarHistorySharedData() {
    cartRepository.removeCartHistorySharedData();
  }

  Future<void> addToCartHistory() async {
    await cartRepository.addToCartHistory(_items);
    clear();
    getTotalItems();
  }

  set setItems(Map<int, CartModel> items) {
    _items = items;
  }

  void clear() {
    _items = {};
    update();
  }

  List<CartModel> getCartHistory() {
    return cartRepository.getCartHistory();
  }

  List<CartModel> get getItemsData {
    return _items.entries.map((e) => e.value).toList();
  }

  Future<void> callback(bool isSuccess, String message, String orderID) async {
    if (isSuccess) {
      if (index == 0) {
        _isLoading = true;
        update();
        Get.find<CartController>().addToCartHistory();
        await Future.delayed(const Duration(seconds: 2));
        _isLoading = false;
        update();
        Get.to(
          () => const CashOrderSuccessPage(),
        );
        update();
      } else {
        Get.offNamed(AppRouteNames.getPaymentRoute(), arguments: {
          'order_id': orderID,
        });
      }
    } else {
      CustomSnackbar(
        message,
        Colors.redAccent,
      );
    }
  }

  // For Payment Options

  int _index = 0;
  double _deliveryCharge = 0.0;
  String _radio = 'home delivery';
  String _initialOrderNote = '';
  bool _isLoading = false;

  int get index => _index;
  String get radio => _radio;
  double get deliveryCharge => _deliveryCharge;
  bool get isLoading => _isLoading;
  String get initialOrderNote => _initialOrderNote;

  set setOnPaymentOptionsClicked(int value) {
    _index = value;
    update();
  }

  set setOnRadioOptionsClicked(String value) {
    _radio = value;
    update();
  }

  set setDeliveryCharge(double value) {
    _deliveryCharge = value;
    update();
  }

  set setIsLoading(bool value) {
    _isLoading = value;
    update();
  }

  setInitialOrderNote(String value) {
    _initialOrderNote = value;
    update();
  }
}
