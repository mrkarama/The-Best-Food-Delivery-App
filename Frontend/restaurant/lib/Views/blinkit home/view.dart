import 'package:restaurant/Commons/Utils/export.dart';
import 'package:restaurant/Commons/Utils/packages.dart';

class BlinkitHomePage extends StatefulWidget {
  const BlinkitHomePage({super.key});

  @override
  State<BlinkitHomePage> createState() => _BlinkitHomePageState();
}

class _BlinkitHomePageState extends State<BlinkitHomePage> {
  late ScrollController scrollController;
  final GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    if (Get.find<WelcomeController>().isFromSplashScreen) {
      getData();
    }
  }

  Future<void> getData() async {
    await Get.find<BlinkitHomeController>().getPizzaCategoryProducts();
    await Get.find<BlinkitHomeController>().getDrinksCategoryProducts();
    await Get.find<BlinkitHomeController>().getBiryaniCategoryProducts();

    await Get.find<BlinkitHomeController>().getChickenCategoryProducts();
    await Get.find<BlinkitHomeController>().getBurgersCategoryProducts();
    await Get.find<BlinkitHomeController>().getRollsCategoryProducts();
    await Get.find<BlinkitHomeController>().getThaliCategoryProducts();
    await Get.find<BlinkitHomeController>().getDosaCategoryProducts();
    await Get.find<BlinkitHomeController>().getSandwichCategoryProducts();
    await Get.find<BlinkitHomeController>().getIdliCategoryProducts();

    await Get.find<BlinkitHomeController>().getMomosCategoryProducts();
    await Get.find<BlinkitHomeController>().getCakeCategoryProducts();
    await Get.find<BlinkitHomeController>().getNoodlesCategoryProducts();

    scrollController.addListener(() {
      if (scrollController.offset > Get.context!.height / 2) {
        Get.find<BlinkitHomeController>().setIsStartingScrolling = true;
      } else {
        Get.find<BlinkitHomeController>().setIsStartingScrolling = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<CartController>(builder: (cartController) {
        return GetBuilder<BlinkitHomeController>(
          builder: (blinkitHomeController) {
            return blinkitHomeController.isLoading
                ? const Scaffold(
                    body: CustomBlinkitLoader(),
                  )
                : Scaffold(
                    key: key,
                    backgroundColor: AppColors.backgroundColor,
                    floatingActionButton: blinkitHomeController
                            .isStartingScrolling
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(230.r),
                            child: FloatingActionButton(
                              backgroundColor: Colors.redAccent,
                              child: Image.asset(
                                'assets/images/top1.png',
                                color: AppColors.mainColor,
                              ),
                              onPressed: () {
                                scrollController.animateTo(
                                  scrollController.position.minScrollExtent,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                );
                              },
                            ),
                          )
                        : SizedBox.shrink(),
                    body: CustomScrollView(
                      controller: scrollController,
                      slivers: [
                        SliverAppBar(
                          automaticallyImplyLeading: false,
                          pinned: true,
                          toolbarHeight: 20.h,
                          backgroundColor: AppColors.mainColor,
                          expandedHeight: context.screenHeight / 4.9.h,
                          flexibleSpace: const FlexibleSpaceBar(
                            background: BlinkitCustomAppBar(),
                          ),
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(
                                10.r,
                              ),
                              bottomRight: Radius.circular(
                                10.r,
                              ),
                            ),
                          ),
                          bottom: PreferredSize(
                            preferredSize: Size.fromHeight(
                              60.h,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  AppRouteNames.getSearchRoute(),
                                );
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 60.h,
                                      margin: EdgeInsets.only(
                                        right: 5.w,
                                        left: 10.w,
                                        bottom: 10.h,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          15.r,
                                        ),
                                        color: Colors.grey.shade100,
                                        border: Border.all(
                                          width: 0.3.w,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                left: 10.w,
                                              ),
                                              child: Icon(
                                                Icons.search,
                                                size: 24.sp,
                                              ),
                                            ),
                                          ),
                                          horizontalSpacer(
                                            10.w,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'search_pizza'.tr,
                                              style: robotoRegular.copyWith(
                                                fontSize: 18.sp,
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                right: 10.w,
                                              ),
                                              child: Icon(
                                                Icons.mic,
                                                size: 24.sp,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: 7.w,
                                    ),
                                    child: GestureDetector(
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
                                            backgroundColor:
                                                AppColors.yellowColor,
                                          ),
                                          cartController.totalQuantity == 0
                                              ? const SizedBox(
                                                  width: 0,
                                                )
                                              : Positioned(
                                                  right: 4.w,
                                                  top: 4.h,
                                                  child: CircleAvatar(
                                                    backgroundColor: AppColors
                                                        .backgroundColor,
                                                    radius: 10.r,
                                                    child: Center(
                                                      child: Text(
                                                        cartController
                                                            .totalQuantity
                                                            .toString(),
                                                        style: robotoRegular
                                                            .copyWith(
                                                          fontSize: 16.sp,
                                                        ),
                                                      ),
                                                    ),
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
                        SliverToBoxAdapter(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 10.w,
                                  left: 10.w,
                                  top: 5.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'bestsellers'.tr,
                                      style: robotoBold.copyWith(
                                        fontSize: 19.sp,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        blinkitHomeController
                                            .onLoadingShimmer();
                                        Get.toNamed(
                                          AppRouteNames
                                              .getBestSellerAllProductsRoute(),
                                          arguments: {
                                            "products": blinkitHomeController
                                                .flattenBestSellerProducts(),
                                          },
                                        );
                                      },
                                      child: Text(
                                        'see_all'.tr,
                                        style: robotoMedium.copyWith(
                                          fontSize: 16.sp,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              verticalSpacer(
                                15.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 10.w,
                                ),
                                child: SizedBox(
                                  width: context.screenWidth,
                                  height: context.screenHeight / 2.3.h,
                                  child: MediaQuery.removePadding(
                                    context: context,
                                    removeLeft: true,
                                    child: SquareHosrizontalListView(
                                      products: blinkitHomeController
                                          .allCategoryProducts,
                                    ),
                                  ),
                                ),
                              ),
                              // verticalSpacer(
                              //   25.h,
                              // ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 10.w,
                                ),
                                child: Text(
                                  'shop_by_category'.tr,
                                  style: robotoBold.copyWith(
                                    fontSize: 19.sp,
                                  ),
                                ),
                              ),
                              verticalSpacer(
                                15.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 10.w,
                                  right: 10.w,
                                ),
                                child: SizedBox(
                                  width: context.screenWidth,
                                  height: context.screenHeight / 1.365,
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FourBythreeGridView(),
                                    ],
                                  ),
                                ),
                              ),
                              verticalSpacer(
                                10.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 10.w,
                                ),
                                child: SizedBox(
                                  width: context.screenWidth,
                                  height: 230.h,
                                  child: const RectangleListView(),
                                ),
                              ),
                              const FooterWidget(),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
          },
        );
      }),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
