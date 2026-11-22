import 'package:get/get.dart';
import 'package:restaurant/Commons/constants/api_values.dart';
import 'package:restaurant/Data/Api/api_client.dart';
import 'package:restaurant/Models/place_order_body.dart';

class OrderRepository extends GetxService {
  final ApiClient apiClient;

  OrderRepository({
    required this.apiClient,
  });

  Future<Response> placeOrder(PlaceOrderBody placeOrderBody) async {
    return await apiClient.postData(
      ApiValues.placeOrderUri,
      placeOrderBody.toJson(),
    );
  }

  Future<Response> getOrderData() async {
    return await apiClient.getData(ApiValues.getOrderData);
  }
}
