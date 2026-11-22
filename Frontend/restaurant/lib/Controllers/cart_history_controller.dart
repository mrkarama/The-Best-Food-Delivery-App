import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:restaurant/Data/Repositories/cart_repo.dart';

import '../Models/cart_model.dart';
import 'cart_controller.dart';

class CartHistoryController extends GetxController implements GetxService {
  final CartRepository cartRepository;
  final CartController cartController;

  CartHistoryController({
    required this.cartController,
    required this.cartRepository,
  });

  var cartHistoryData = [];

  List<int> _cartOrderTimeIntList = <int>[];
  List<String> _cartOrderTimeList = <String>[];
  Map<int, CartModel> _orderTimeItems = <int, CartModel>{};
  Map<String, int> _cartItemOrderMap = <String, int>{};

  bool _isLoading = false;

  List<int> get cartOrderTimeIntList => _cartOrderTimeIntList;
  List<String> get cartOrderTimeList => _cartOrderTimeList;
  Map<int, CartModel> get orderTimeItems => _orderTimeItems;
  Map<String, int> get cartItemOrderMap => _cartItemOrderMap;

  bool get isLoading => _isLoading;

  Future<void> loadResources() async {
    await Future.delayed(const Duration(seconds: 2));
    getCartHistoryData();
  }

  void getCartHistoryData() {
    _isLoading = true;
    update();
    var cartHistory = [];
    cartHistoryData = [];
    var listOfCartHistoryData = [];
    cartHistory = cartController.getCartHistory();

    for (int i = 0; i < cartHistory.length; i++) {
      listOfCartHistoryData.add(cartHistory[i]);
    }

    cartHistoryData = listOfCartHistoryData.reversed.toList();

    cartOrderTime();

    // print(jsonEncode(state.cartHistoryData).toString());
    print('Cart Order Time is ${_cartOrderTimeIntList}');
    _isLoading = false;
    update();
  }

  void cartOrderTime() {
    _cartItemOrderMap = {};
    for (int i = 0; i < cartHistoryData.length; i++) {
      if (_cartItemOrderMap.containsKey(cartHistoryData[i].time)) {
        print('true');
        _cartItemOrderMap.update(cartHistoryData[i].time, (value) => value + 1);
      } else {
        _cartItemOrderMap.putIfAbsent(cartHistoryData[i].time, () => 1);
      }
    }

    // To get List<int> of the number of item for each row in the cart history page
    _cartOrderTimeIntList = [];
    _cartOrderTimeIntList =
        _cartItemOrderMap.entries.map((e) => e.value).toList();

    // To get List<time(String)> of the number of item for each row in the cart history page
    _cartOrderTimeList = [];
    _cartOrderTimeList = _cartItemOrderMap.entries.map((e) => e.key).toList();
  }

  String transformDataFormat(String time) {
    String result = '';

    final parseDate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(time);

    final outputFormat = DateFormat('dd/MM/yyyy hh:mm a');

    final inputDate = DateTime.parse(parseDate.toString());

    result = outputFormat.format(inputDate);

    return result;
  }

  void getOrderTimeItems(int index) {
    _orderTimeItems = {};
    for (int i = 0; i < cartHistoryData.length; i++) {
      if (cartHistoryData[i].time == _cartOrderTimeList[index]) {
        _orderTimeItems.putIfAbsent(
          cartHistoryData[i].id,
          () => cartHistoryData[i],
        );
      }
    }

    cartController.setItems = _orderTimeItems;
    cartRepository.addToCart(cartController.items);
    cartController.getTotalAmount();
    cartController.getTotalItems();

    // print(
    //   'LENGTH OF ORDER TIME ITEMS IS ' + state.orderTimeItems.length.toString(),
    // );
  }

  // Test
  void getUserToken() {
    cartRepository.getUserToken();
  }
}
