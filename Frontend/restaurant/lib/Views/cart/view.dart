import 'package:restaurant/Commons/Utils/export.dart';
import 'package:restaurant/Commons/Utils/packages.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late TextEditingController noteController;
  @override
  void initState() {
    super.initState();
    Get.find<LocationController>().getAddressDataFromDatabase();
    Get.find<CartController>().getTotalAmount();
    Get.find<CartController>().getTotalItems();

    noteController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<CartController>(builder: (cartController) {
        return GetBuilder<PopularController>(builder: (popularController) {
          return cartController.isLoading
              ? const PaymentSuccessLoadingShimmer()
              : Scaffold(
                  backgroundColor: AppColors.backgroundColor,
                  bottomNavigationBar: cartController.totalQuantity == 0
                      ? const SizedBox(
                          width: 0,
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            verticalSpacer(
                              10.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                _showBottomPaymentOptions(context);
                              },
                              child: Container(
                                width: context.screenWidth,
                                height: 60.h,
                                margin: EdgeInsets.only(
                                  left: 5.w,
                                  right: 5.w,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    15.r,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      spreadRadius: 4,
                                      blurRadius: 3,
                                      offset: const Offset(0, 5),
                                      color: Colors.grey.shade200,
                                    )
                                  ],
                                  color: AppColors.mainColor,
                                ),
                                child: Center(
                                    child: Text(
                                  'payment_options'.tr,
                                  style: robotoBold.copyWith(
                                    fontSize: 22.sp,
                                  ),
                                )),
                              ),
                            ),
                            verticalSpacer(
                              3.h,
                            ),
                            Container(
                              height: 100.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                    20.r,
                                  ),
                                  topRight: Radius.circular(
                                    20.r,
                                  ),
                                ),
                                color: Colors.grey.shade300,
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 15.w,
                                    right: 15.w,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 120.w,
                                        height: 60.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            15.r,
                                          ),
                                          color: AppColors.backgroundColor,
                                        ),
                                        child: Center(
                                          child: Text(
                                              '\$${cartController.totalAmount.TwoNumbersAfterDecimalPoint}',
                                              style: robotoRegular),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          final personController =
                                              Get.find<PersonController>();
                                          final paymentController =
                                              Get.find<PaymentController>();
                                          if (await personController
                                              .isUserLogged()) {
                                            if (Get.find<LocationController>()
                                                .userAddressFromBD
                                                .isEmpty) {
                                              Get.toNamed(
                                                AppRouteNames.getAddressRoute(),
                                              );
                                            } else {
                                              await personController
                                                  .getUserInformation();
                                              print(
                                                  'USER LOGGED IN !!!!!!!!!!!!');
                                              // cartController.addToCartHistory();
                                              List<CartModel> cart =
                                                  cartController.getItemsData;
                                              double totalAmount = 0.0;
                                              for (var cartModel in cart) {
                                                totalAmount += cartModel.price *
                                                    cartModel.quantity;
                                                cartController
                                                        .setDeliveryCharge =
                                                    totalAmount / 10;
                                              }
                                              final PlaceOrderBody
                                                  placeOrderBody =
                                                  PlaceOrderBody(
                                                cart: cart,
                                                address: 'Nonssin',
                                                contactPersonName:
                                                    personController
                                                        .userInfo.name,
                                                contactPersonNumber:
                                                    personController
                                                        .userInfo.phone,
                                                distance: 20.0,
                                                latitude: '34.5566',
                                                longitude: '-12.345',
                                                orderAmount:
                                                    totalAmount.toString(),
                                                orderNote: noteController.text,
                                                deliveryOptions:
                                                    cartController.radio,
                                                paymentMethod:
                                                    cartController.index == 0
                                                        ? 'cash_on_delivery'
                                                        : 'digital_payment',
                                                deliveryCharge: cartController
                                                    .deliveryCharge
                                                    .toString(),
                                              );

                                              print('CALLING PLACE ORDER');

                                              paymentController.placeOrder(
                                                  cartController.callback,
                                                  placeOrderBody);

                                              print(
                                                  'ORDER PLACED !!!!!!!!!!!!!!');
                                            }
                                          } else {
                                            Get.toNamed(
                                              AppRouteNames.getLoginRoute(),
                                            );
                                          }
                                        },
                                        child: Container(
                                          width: 130.w,
                                          height: 60.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              15.r,
                                            ),
                                            color: AppColors.mainColor,
                                          ),
                                          child: Center(
                                            child: Text(
                                              'check_out'.tr,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: robotoBold.copyWith(
                                                fontSize: 22.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: 15.w,
                          right: 15.w,
                          top: 50.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: CustomButton(
                                icon: Icons.chevron_left,
                                radius: 22.5.r,
                                height: 45,
                                backgroundColor: AppColors.mainColor,
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.find<WelcomeController>()
                                        .setIsFromSplashScreen = false;
                                    Get.offAllNamed(
                                        AppRouteNames.getWelcomeRoute());
                                  },
                                  child: CustomButton(
                                    icon: Icons.home_outlined,
                                    radius: 22.5.r,
                                    height: 45,
                                    backgroundColor: AppColors.mainColor,
                                  ),
                                ),
                                horizontalSpacer(
                                  40.w,
                                ),
                                Stack(
                                  children: [
                                    CustomButton(
                                      icon: Icons.shopping_cart_outlined,
                                      radius: 22.5.r,
                                      height: 45,
                                      backgroundColor: AppColors.mainColor,
                                    ),
                                    cartController.totalQuantity == 0
                                        ? const SizedBox(
                                            width: 0,
                                          )
                                        : Positioned(
                                            right: 4.w,
                                            top: 4.h,
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  AppColors.backgroundColor,
                                              radius: 10.r,
                                              child: Center(
                                                  child: Text(
                                                cartController.totalQuantity
                                                    .toString(),
                                                style: robotoRegular.copyWith(
                                                  fontSize: 16.sp,
                                                ),
                                              )),
                                            ),
                                          ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      verticalSpacer(
                        15.h,
                      ),
                      cartController.totalQuantity == 0
                          ? Expanded(
                              child: NoDataPage(
                                imageUrl: 'assets/images/empty_cart.png',
                                text: 'your_cart_is_empty'.tr,
                                isCartHistory: false,
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                itemCount: cartController.getItems.length,
                                itemBuilder: (context, index) {
                                  final CartModel cartModel =
                                      cartController.getItems[index];
                                  return InkWell(
                                    onTap: () {
                                      bool recommendedIndex = false;

                                      for (int i = 0;
                                          i <
                                              Get.find<BlinkitHomeController>()
                                                  .recommendedProducts
                                                  .length;
                                          i++) {
                                        if (Get.find<BlinkitHomeController>()
                                                .recommendedProducts[i]
                                                .id ==
                                            cartModel.productsModel.id) {
                                          recommendedIndex = true;
                                        }
                                      }
                                      if (recommendedIndex) {
                                        Get.toNamed(
                                            AppRouteNames.getRecommendedRoute(),
                                            arguments: {
                                              'id': cartModel.id,
                                              'title': cartModel.title,
                                              'description':
                                                  cartModel.description,
                                              'category': cartModel.category,
                                              'image': cartModel.image,
                                              'rating': cartModel.rating,
                                              'price': cartModel.price,
                                            });
                                      } else {
                                        Get.toNamed(
                                            AppRouteNames.getPopularRoute(),
                                            arguments: {
                                              'id': cartModel.id,
                                              'title': cartModel.title,
                                              'description':
                                                  cartModel.description,
                                              'category': cartModel.category,
                                              'image': cartModel.image,
                                              'rating': cartModel.rating,
                                              'price': cartModel.price,
                                            });
                                      }
                                    },
                                    child: Container(
                                      height: 120.h,
                                      margin: EdgeInsets.only(
                                        left: 5.w,
                                        right: 5.w,
                                        bottom: 20.h,
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 120.w,
                                            width: 120.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                15.r,
                                              ),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  '${ApiValues.imageBaseUrl}${cartModel.image.toString()}',
                                                ),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          horizontalSpacer(
                                            10.w,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: context.screenWidth / 3,
                                                child: Text(
                                                  cartModel.title.toString(),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: robotoMedium.copyWith(
                                                    fontSize: 22.sp,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                cartModel.category.toString(),
                                                style: robotoRegular.copyWith(
                                                  fontSize: 18.sp,
                                                ),
                                              ),
                                              Text(
                                                '\$${double.parse((cartModel.price * cartModel.quantity).toStringAsFixed(2))}',
                                                style: robotoMedium.copyWith(
                                                  fontSize: 22.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        cartController.addItem(
                                                            cartModel
                                                                .productsModel,
                                                            -1);
                                                        cartController
                                                            .getTotalItems();

                                                        cartController
                                                            .getTotalAmount();
                                                      },
                                                      icon: Icon(
                                                        Icons.remove,
                                                        size: 24.sp,
                                                      ),
                                                    ),
                                                    Text(
                                                      cartModel.quantity
                                                          .toString(),
                                                      style:
                                                          robotoMedium.copyWith(
                                                        fontSize: 22.sp,
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        cartController.addItem(
                                                            cartModel
                                                                .productsModel,
                                                            1);
                                                        cartController
                                                            .getTotalAmount();
                                                        cartController
                                                            .getTotalItems();
                                                      },
                                                      icon: Icon(
                                                        Icons.add,
                                                        size: 24.sp,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                    ],
                  ),
                );
        });
      }),
    );
  }

  void _showBottomPaymentOptions(BuildContext context) {
    noteController.text = Get.find<CartController>().initialOrderNote;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(
                    15.w,
                    15.h,
                    15.w,
                    20.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PaymentOptions(
                        leading: Icons.money,
                        title: 'cash_on_delivery'.tr,
                        subTitle: 'pay_your_payment_after_getting_food'.tr,
                        index: 0,
                      ),
                      PaymentOptions(
                        leading: Icons.paypal,
                        title: 'digital_payment'.tr,
                        subTitle: 'faster_and_safer_way_to_send_money'.tr,
                        index: 1,
                      ),
                      verticalSpacer(
                        20.h,
                      ),
                      Text(
                        'delivery_options'.tr,
                        style: robotoBold.copyWith(
                          fontSize: 20.sp,
                        ),
                      ),
                      verticalSpacer(
                        5.h,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DeliveryOptions(
                            title: 'home_delivery'.tr,
                            radioValue: 'home delivery',
                            feeOfDelivery: double.parse(
                                    (Get.find<CartController>().totalAmount *
                                            0.05)
                                        .toString())
                                .toStringAsFixed(2),
                          ),
                          DeliveryOptions(
                            title: 'take_away'.tr,
                            radioValue: 'take away',
                            feeOfDelivery: 'free'.tr,
                          ),
                        ],
                      ),
                      verticalSpacer(
                        20.h,
                      ),
                      Text(
                        'additional_info'.tr,
                        style: robotoBold.copyWith(
                          fontSize: 20.sp,
                        ),
                      ),
                      verticalSpacer(
                        5.h,
                      ),
                      Container(
                        height: 80.h,
                        color: Colors.white,
                        child: TextField(
                          controller: noteController,
                          cursorColor: AppColors.mainColor,
                          keyboardType: TextInputType.text,
                          maxLines: 2,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            hintText: 'type_your_review_here'.tr,
                            hintStyle: robotoRegular.copyWith(
                              fontSize: 17.sp,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ).whenComplete(() {
      Get.find<CartController>().setInitialOrderNote(noteController.text);
    });
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }
}
