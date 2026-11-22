import 'package:restaurant/Commons/Utils/export.dart';
import 'package:restaurant/Commons/Utils/packages.dart';

class PopularPage extends StatefulWidget {
  const PopularPage({Key? key}) : super(key: key);

  @override
  State<PopularPage> createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage> {
  late Map<String, dynamic> productsModel;
  late int id;
  late String title;
  late String description;
  late String category;
  late String image;
  late dynamic price;
  late dynamic rating;

  @override
  void initState() {
    super.initState();
    productsModel = Get.arguments;
    id = productsModel['id'];
    title = productsModel['title'];
    description = productsModel['description'];
    category = productsModel['category'];
    image = productsModel['image'];
    price = productsModel['price'];
    rating = productsModel['rating'];

    // cartController.getCartListData();
    // cartController.totalItems();
    // print(
    //     'Total quantity is ${cartController.state.totalQuantity.value.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    //Get.find<CartController>().removeCartSharedData();

    //Get.find<CartController>().removeCarHistorySharedData();
    //Get.find<PopularController>().initializeQuantity();

    return SafeArea(
      child:
          GetBuilder<BlinkitHomeController>(builder: (blinkitHomeController) {
        return GetBuilder<CartController>(builder: (cartController) {
          return GetBuilder<PopularController>(builder: (popularController) {
            return blinkitHomeController.isSingleItemLoading
                ? const Scaffold(
                    backgroundColor: AppColors.backgroundColor,
                    body: CustomBlinkitLoader(),
                  )
                : Scaffold(
                    backgroundColor: AppColors.backgroundColor,
                    bottomNavigationBar: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                popularController.setQuantity(false);
                              },
                              child: CustomButton(
                                icon: Icons.remove,
                                radius: 20.r,
                                height: 40,
                              ),
                            ),
                            resizableText(
                              text:
                                  '\$${price.toString()} X ${popularController.quantity.toString()}',
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.mainBlackColor,
                            ),
                            GestureDetector(
                              onTap: () {
                                popularController.setQuantity(true);
                              },
                              child: CustomButton(
                                icon: Icons.add,
                                radius: 20.r,
                                height: 40,
                              ),
                            ),
                          ],
                        ),
                        verticalSpacer(
                          10.h,
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
                                    width: 60.w,
                                    height: 60.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        15.r,
                                      ),
                                      color: AppColors.backgroundColor,
                                    ),
                                    child: Center(
                                      child: CustomButton(
                                        icon: Icons.favorite,
                                        radius: 15.r,
                                        height: 45,
                                        iconColor: AppColors.mainColor,
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      ProductsModel productsModel =
                                          ProductsModel(
                                        id: id,
                                        title: title,
                                        description: description,
                                        category: category,
                                        image: image,
                                        price: price,
                                        rating: rating,
                                      );

                                      popularController.addItem(productsModel);
                                    },
                                    child: Container(
                                      width: Get.find<LocalizationController>()
                                                  .getCountryCode() ==
                                              'FR'
                                          ? 220.w
                                          : 170.w,
                                      height: 60.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          15.r,
                                        ),
                                        color: AppColors.mainColor,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          resizableText(
                                            text: '\$${price.toString()}',
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            'add_to_cart'.tr,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: robotoRegular.copyWith(
                                              fontSize: 20.sp,
                                            ),
                                          ),
                                        ],
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
                    body: CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          automaticallyImplyLeading: false,
                          //floating: true,
                          pinned: true,
                          toolbarHeight: 90.h,
                          backgroundColor: AppColors.yellowColor,
                          bottom: PreferredSize(
                            preferredSize: Size.fromHeight(
                              20.h,
                            ),
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 10.h,
                                bottom: 10.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                    20.r,
                                  ),
                                  topRight: Radius.circular(
                                    20.r,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: bigText(
                                  text: title.toString(),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          expandedHeight: context.screenHeight * 0.41.h,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: CustomButton(
                                  icon: Icons.close,
                                  radius: 22.5.r,
                                  height: 45,
                                  backgroundColor: AppColors.mainColor,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (cartController.totalQuantity != 0) {
                                    Get.toNamed(
                                      AppRouteNames.getCartRoute(),
                                    );
                                  } else {
                                    CustomSnackbar(
                                      "you_can't_view_an_empty_cart".tr,
                                      AppColors.mainColor,
                                      title: 'empty_cart'.tr,
                                    );
                                  }
                                },
                                child: Stack(
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
                                                ),
                                              ),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          flexibleSpace: FlexibleSpaceBar(
                            background: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      '${ApiValues.imageBaseUrl}${image.toString()}',
                                    ),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                              15.w,
                              10.h,
                              15.w,
                              0,
                            ),
                            child: Column(
                              children: [
                                ExpansionableText(
                                  text: description.toString(),
                                ),
                                verticalSpacer(
                                  5.h,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
          });
        });
      }),
    );
  }
}
