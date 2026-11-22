import 'package:restaurant/Commons/Utils/export.dart';
import 'package:restaurant/Commons/Utils/packages.dart';

class RecommendedPage extends StatefulWidget {
  const RecommendedPage({Key? key}) : super(key: key);

  @override
  State<RecommendedPage> createState() => _RecommendedPageState();
}

class _RecommendedPageState extends State<RecommendedPage> {
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
    // state.cartController.value.totalItems();
  }

  @override
  Widget build(BuildContext context) {
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
                    bottomNavigationBar: Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 100.w,
                                height: 60.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    15.r,
                                  ),
                                  color: AppColors.backgroundColor,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        popularController.setQuantity(false);
                                      },
                                      child: Icon(
                                        Icons.remove,
                                        color: AppColors.titleColor,
                                        size: 24.sp,
                                      ),
                                    ),
                                    bigText(
                                      text:
                                          popularController.quantity.toString(),
                                      fontWeight: FontWeight.normal,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        popularController.setQuantity(true);
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: AppColors.titleColor,
                                        size: 24.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  ProductsModel productsModel = ProductsModel(
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
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    body: Stack(
                      children: [
                        Container(
                          height: context.screenHeight * 0.40.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                '${ApiValues.imageBaseUrl}${image.toString()}',
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            15.w,
                            15.h,
                            15.w,
                            0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
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
                                            height: 0,
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
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: context.screenHeight * 0.40.h,
                          ),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                              15.w,
                              15.h,
                              15.w,
                              0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                  20.r,
                                ),
                                topRight: Radius.circular(
                                  20.r,
                                ),
                              ),
                              //color: Colors.black,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                bigText(
                                  text: title.toString(),
                                  fontWeight: FontWeight.bold,
                                ),
                                verticalSpacer(
                                  9.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: List.generate(
                                        5,
                                        (index) {
                                          return Container(
                                            padding: EdgeInsets.only(
                                              right: 0.w,
                                            ),
                                            child: Icon(
                                              Icons.star,
                                              size: 20.sp,
                                              color: AppColors.mainColor,
                                            ),
                                          );
                                        },
                                      ).toList(),
                                    ),
                                    horizontalSpacer(
                                      10.w,
                                    ),
                                    smallext(
                                      text: rating.toString(),
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black54,
                                    ),
                                    horizontalSpacer(
                                      10.w,
                                    ),
                                    smallext(
                                      text: RandomNumbers.comments.toString(),
                                      fontWeight: FontWeight.normal,
                                    ),
                                    horizontalSpacer(
                                      10.w,
                                    ),
                                    smallext(
                                      text: 'comments'.tr,
                                      fontWeight: FontWeight.normal,
                                    )
                                  ],
                                ),
                                verticalSpacer(
                                  15.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const IconTextWidget(
                                      icon: Icons.circle,
                                      iconColor: AppColors.iconColor1,
                                      text: 'Normal',
                                    ),
                                    IconTextWidget(
                                      icon: Icons.place,
                                      iconColor: AppColors.mainColor,
                                      text:
                                          '${RandomNumbers.distance.toString()}km',
                                    ),
                                    IconTextWidget(
                                      icon: Icons.schedule,
                                      iconColor: AppColors.iconColor2,
                                      text:
                                          '${RandomNumbers.time.toString()}km',
                                    ),
                                  ],
                                ),
                                verticalSpacer(
                                  15.h,
                                ),
                                bigText(
                                  text: 'introduce'.tr,
                                  fontWeight: FontWeight.bold,
                                ),
                                verticalSpacer(
                                  20.h,
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: ExpansionableText(
                                      text: description.toString(),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
          });
        });
      }),
    );
  }
}
