import 'package:restaurant/Commons/Utils/export.dart';
import 'package:restaurant/Commons/Utils/packages.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController searchEditingController;
  late ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    searchEditingController = TextEditingController();
    scrollController = ScrollController();
    getData();
    Get.find<ProductsSearchController>().getPreviousSearchData();
  }

  Future<void> getData() async {
    // all Data
    await Get.find<ProductsSearchController>().getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ProductsSearchController>(
          builder: (productsSearchController) {
        return Scaffold(
          appBar: SearchAppBar(
            textEditingController: searchEditingController,
          ),
          floatingActionButton: ClipRRect(
            borderRadius: BorderRadius.circular(
              230.r,
            ),
            child: FloatingActionButton(
              backgroundColor: Colors.redAccent,
              onPressed: () {
                scrollController.animateTo(
                    scrollController.position.minScrollExtent,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
              child: Image.asset(
                'assets/images/top1.png',
                color: AppColors.mainColor,
              ),
            ),
          ),
          body: SingleChildScrollView(
            controller: scrollController,
            child: SizedBox(
              width: context.screenWidth,
              height: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacer(
                    20.h,
                  ),
                  productsSearchController.previousSearchData.isEmpty
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: EdgeInsets.only(
                            left: 10.w,
                            right: 10.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'recent_searches'.tr,
                                style: robotoMedium.copyWith(
                                  fontSize: 20.sp,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  productsSearchController
                                      .clearSharedSearchData();
                                },
                                child: Text(
                                  'clear'.tr,
                                  style: robotoMedium.copyWith(
                                    fontSize: 18.sp,
                                    color: AppColors.mainColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                  productsSearchController.previousSearchData.isEmpty
                      ? const SizedBox.shrink()
                      : verticalSpacer(
                          15.h,
                        ),
                  productsSearchController.previousSearchData.isEmpty
                      ? const SizedBox.shrink()
                      : Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 10.w,
                              right: 10.w,
                            ),
                            child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: productsSearchController
                                          .previousSearchData.length <
                                      6
                                  ? productsSearchController
                                      .previousSearchData.length
                                  : 6,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 10.h,
                                crossAxisSpacing: 10.w,
                                mainAxisExtent: 40.h,
                              ),
                              itemBuilder: (context, index) {
                                final ProductsModel product =
                                    productsSearchController
                                        .previousSearchData[index];
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      7.r,
                                    ),
                                    border: Border.all(
                                      width: 0.7.w,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  child: index == 0
                                      ? GestureDetector(
                                          onTap: () {
                                            Get.find<BlinkitHomeController>()
                                                .onSingleItemLoading();
                                            if (double.parse(product.rating) >
                                                4) {
                                              Get.toNamed(
                                                AppRouteNames.getPopularRoute(),
                                                arguments: {
                                                  'id': product.id,
                                                  'title': product.title,
                                                  'description':
                                                      product.description,
                                                  'category': product.category,
                                                  'image': product.image,
                                                  'rating': product.rating,
                                                  'price': product.price,
                                                },
                                              );
                                            } else {
                                              Get.find<BlinkitHomeController>()
                                                  .onSingleItemLoading();
                                              Get.toNamed(
                                                AppRouteNames
                                                    .getRecommendedRoute(),
                                                arguments: {
                                                  'id': product.id,
                                                  'title': product.title,
                                                  'description':
                                                      product.description,
                                                  'category': product.category,
                                                  'image': product.image,
                                                  'rating': product.rating,
                                                  'price': product.price,
                                                },
                                              );
                                            }
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              horizontalSpacer(
                                                4.w,
                                              ),
                                              Icon(
                                                Icons.search,
                                                size: 24.sp,
                                              ),
                                              horizontalSpacer(
                                                4.w,
                                              ),
                                              Center(
                                                child: Text(
                                                  '${product.title.substring(0, 8)}...',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: robotoRegular.copyWith(
                                                    fontSize: 15.sp,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            Get.find<BlinkitHomeController>()
                                                .onSingleItemLoading();
                                            if (double.parse(product.rating) >
                                                4) {
                                              Get.toNamed(
                                                AppRouteNames.getPopularRoute(),
                                                arguments: {
                                                  'id': product.id,
                                                  'title': product.title,
                                                  'description':
                                                      product.description,
                                                  'category': product.category,
                                                  'image': product.image,
                                                  'rating': product.rating,
                                                  'price': product.price,
                                                },
                                              );
                                            } else {
                                              Get.find<BlinkitHomeController>()
                                                  .onSingleItemLoading();
                                              Get.toNamed(
                                                AppRouteNames
                                                    .getRecommendedRoute(),
                                                arguments: {
                                                  'id': product.id,
                                                  'title': product.title,
                                                  'description':
                                                      product.description,
                                                  'category': product.category,
                                                  'image': product.image,
                                                  'rating': product.rating,
                                                  'price': product.price,
                                                },
                                              );
                                            }
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              left: 3.w,
                                              right: 3.w,
                                            ),
                                            child: Center(
                                              child: Text(
                                                product.title,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: robotoRegular.copyWith(
                                                  fontSize: 15.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                );
                              },
                            ),
                          ),
                        ),
                  productsSearchController.previousSearchData.isEmpty
                      ? const SizedBox.shrink()
                      : verticalSpacer(
                          25.h,
                        ),
                  productsSearchController.resultSearchData.isEmpty
                      ? Column(
                          children: [
                            verticalSpacer(context.screenHeight / 6),
                            Center(
                              child: Lottie.asset(
                                'assets/images/search.json',
                              ),
                            ),
                          ],
                        )
                      : Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: productsSearchController
                                .resultSearchData.length,
                            itemBuilder: (context, index) {
                              final ProductsModel product =
                                  productsSearchController
                                      .resultSearchData[index];
                              return InkWell(
                                onTap: () {
                                  productsSearchController
                                      .addToPreviousSearchData(product);
                                  if (double.parse(product.rating) > 4) {
                                    Get.find<BlinkitHomeController>()
                                        .onSingleItemLoading();
                                    Get.toNamed(
                                      AppRouteNames.getPopularRoute(),
                                      arguments: {
                                        'id': product.id,
                                        'title': product.title,
                                        'description': product.description,
                                        'category': product.category,
                                        'image': product.image,
                                        'rating': product.rating,
                                        'price': product.price,
                                      },
                                    );
                                  } else {
                                    Get.find<BlinkitHomeController>()
                                        .onSingleItemLoading();
                                    Get.toNamed(
                                      AppRouteNames.getRecommendedRoute(),
                                      arguments: {
                                        'id': product.id,
                                        'title': product.title,
                                        'description': product.description,
                                        'category': product.category,
                                        'image': product.image,
                                        'rating': product.rating,
                                        'price': product.price,
                                      },
                                    );
                                  }
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 10.w,
                                    right: 10.w,
                                    bottom: 15.h,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 100.w,
                                        height: 100.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10.r,
                                          ),
                                          color: const Color.fromARGB(
                                              255, 235, 214, 172),
                                          border: Border.all(
                                            color: AppColors.mainColor,
                                            width: 3.w,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            10.r,
                                          ),
                                          child: Image.network(
                                            '${ApiValues.imageBaseUrl}${product.image.toString()}',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      horizontalSpacer(
                                        10.w,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            width: context.screenWidth - 130.w,
                                            child: Text(
                                              product.title,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: robotoMedium.copyWith(
                                                fontSize: 18.sp,
                                              ),
                                            ),
                                          ),
                                          verticalSpacer(
                                            10.h,
                                          ),
                                          Text(
                                            '\$${product.price}',
                                            style: robotoRegular.copyWith(
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                  //222
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    searchEditingController.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
