import 'package:get/get.dart';
import 'package:restaurant/Data/Repositories/user_repo.dart';
import 'package:restaurant/Models/response_model.dart';
import 'package:restaurant/Models/track_order_model.dart';

class TrackOrderController extends GetxController implements GetxService {
  final UserRepository userRepository;
  TrackOrderController({
    required this.userRepository,
  });

  List<TrackOrderModel> _trackOrderList = [];
  List<TrackOrderModel> get trackOrderList => _trackOrderList;

  bool _orderPlaced = false;
  bool _orderConfirmed = false;
  bool _orderShipped = false;
  bool _orderDelivered = false;

  bool get orderPlaced => _orderPlaced;
  bool get orderDelivered => _orderDelivered;
  bool get orderConfirmed => _orderConfirmed;
  bool get orderShipped => _orderShipped;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> trackOrder() async {
    _isLoading = true;
    update();
    Response response = await userRepository.trackOrder();

    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      _trackOrderList = [];
      response.body['data'].forEach((data) {
        _trackOrderList.add(TrackOrderModel.fromJson(data));
      });
      responseModel = ResponseModel(
        isSuccess: true,
        message: 'Track order data successfully got',
      );
    } else {
      responseModel = ResponseModel(
        isSuccess: false,
        message: 'Failed to get track order data',
      );
    }

    _isLoading = false;
    update();
    return responseModel;
  }

  void trackUniqueOrderId(int orderId) {
    final List<TrackOrderModel> value =
        _trackOrderList.where((element) => element.orderId == orderId).toList();

    _orderPlaced = value[0].orderPlaced == 1 ? true : false;
    _orderDelivered = value[0].orderDelivered == 1 ? true : false;
    _orderShipped = value[0].orderShipped == 1 ? true : false;
    _orderConfirmed = value[0].orderConfirmed == 1 ? true : false;

    print('ORDER SHIPPED IS + ' + _orderShipped.toString());
    update();
  }
}
