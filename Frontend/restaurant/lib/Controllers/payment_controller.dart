import 'dart:async';
import 'package:restaurant/Controllers/cart_controller.dart';
import 'package:restaurant/Controllers/welcome_controller.dart';
import 'package:restaurant/Data/Repositories/order_repo.dart';
import 'package:restaurant/Models/order_model.dart';
import 'package:restaurant/Models/place_order_body.dart';
import 'package:restaurant/commons/constants/api_values.dart';
import 'package:restaurant/commons/constants/constants.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController implements GetxService {
  final OrderRepository orderRepository;
  PaymentController({required this.orderRepository});

  bool _isLoading = false;
  bool _status = false;

  bool get isLoading => _isLoading;
  bool get status => _status;

  late String theOrderId;

  List<OrderModel> _currentOrderData = [];
  List<OrderModel> _historyOrderData = [];

  List<OrderModel> get currentOrderData => _currentOrderData;
  List<OrderModel> get historyOrderData => _historyOrderData;

  set setLoading(bool value) {
    _isLoading = value;
    update();
  }

  void redirect(String url) {
    if (url.contains('success') && url.contains(ApiValues.appBaseUrl)) {
      Get.find<CartController>().addToCartHistory();
      _status = true;
      update();
      Get.find<WelcomeController>().setIsFromSplashScreen = false;
      Get.offAllNamed(AppRouteNames.getOrderSuccessRoute());
      print('SUCCESS SUCCESS SUCCESS SUCCESS SUCCESS SUCCESS SUCCESS');
    } else if (url.contains('cancel') && url.contains(ApiValues.appBaseUrl)) {
      _status = false;
      update();
      Get.find<WelcomeController>().setIsFromSplashScreen = false;
      Get.offAllNamed(AppRouteNames.getOrderSuccessRoute());
      print('FAILED FAILED FAILED FAILED FAILED v');
    } else {
      print("Encountered problem");
    }
  }

  Future<void> placeOrder(
      Function callback, PlaceOrderBody placeOrderBody) async {
    _isLoading = true;
    update();
    Response response = await orderRepository.placeOrder(placeOrderBody);

    print('RESPONSE ULTIMATE' + response.body.toString());
    if (response.statusCode == 200) {
      print('RESPONSE BODY IS ' + response.body.toString());
      String message = response.body['message'];
      String orderID = response.body['order_id'].toString();
      theOrderId = orderID;
      print('THE ORDER ID IS ---- ' + theOrderId.toString());

      callback(true, message, orderID);
    } else {
      print(
        'ERROR WHILE GETTING THE PLACE ORDER FUNCTION SC IS ' +
            response.statusCode.toString(),
      );
      callback(false, response.statusText, '-1');
    }

    _isLoading = false;
    update();
  }

  Future<void> getOrderData() async {
    _isLoading = true;
    update();

    final Response response = await orderRepository.getOrderData();

    if (response.statusCode == 200) {
      // print('BODY BODEY IS' + response.body.toString());
      _currentOrderData = [];
      _historyOrderData = [];
      for (int i = 0; i < response.body.length; i++) {
        final OrderModel orderModel = OrderModel.fromJson(response.body[i]);
        if (orderModel.orderStatus == 'accepted' ||
            orderModel.orderStatus == 'pending' ||
            orderModel.orderStatus == 'processing' ||
            orderModel.orderStatus == 'handover' ||
            orderModel.orderStatus == 'picked_up') {
          _currentOrderData.add(orderModel);
        } else {
          _historyOrderData.add(orderModel);
        }
      }
    } else {
      _currentOrderData = [];
      _historyOrderData = [];
    }
    _isLoading = false;
    print('LOADINDDD' + _isLoading.toString());
    update();
  }

  Future<void> onRefresh() async {
    await getOrderData();
  }
}
