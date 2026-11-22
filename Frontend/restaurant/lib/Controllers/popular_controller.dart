import 'package:get/get.dart';
import 'package:restaurant/Commons/constants/colors.dart';
import 'package:restaurant/Controllers/cart_controller.dart';
import '../Models/products_model.dart';
import 'package:restaurant/Commons/widgets/custom_snackbar.dart';

class PopularController extends GetxController implements GetxService {
  final CartController cartController;
  PopularController({
    required this.cartController,
  });

  int _quantity = 0;
  int get quantity => _quantity;

  // Shopping Cart Logic

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }

    update();
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      CustomSnackbar(
        "you_can't_reduce_more".tr,
        AppColors.mainColor,
        title: 'item_count'.tr,
      );
      return 0;
    } else if (quantity > 20) {
      CustomSnackbar(
        "you_can't_add_more".tr,
        AppColors.mainColor,
        title: 'item_count'.tr,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initializeQuantity() {
    _quantity = 0;
  }

  void addItem(ProductsModel productsModel) {
    if (_quantity != 0) {
      cartController.addItem(productsModel, _quantity);
      cartController.getTotalItems();
      cartController.getTotalAmount();
      CustomSnackbar(
        _quantity > 1
            ? '$_quantity ${'items_added_to_the_cart'.tr}'
            : '$_quantity ${'item_added_to_the_cart'.tr}',
        AppColors.mainColor,
        title: 'cart'.tr,
      );
      update();
    } else {
      CustomSnackbar(
        'at_least_add_one_item'.tr,
        AppColors.mainColor,
        title: 'item_count'.tr,
      );
    }
  }

  // Test Purpose
  // void removeCartSharedData() {
  //   cartController.removeCartSharedData();
  // }

  // Test Purpose
  // void removeCartHistorySharedData() {
  //   cartController.removeCarHistorySharedData();
  // }

  // int _newQuantity = 0;
  // int get newQuantity => _newQuantity;

  // set setNewQantity(int value) {
  //   _newQuantity = value;
  //   update();
  // }
}
