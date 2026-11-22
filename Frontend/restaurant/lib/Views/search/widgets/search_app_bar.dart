import 'package:restaurant/Commons/Utils/export.dart';
import 'package:restaurant/Commons/Utils/packages.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController textEditingController;
  const SearchAppBar({
    super.key,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      height: 60.h,
      margin: EdgeInsets.only(
        bottom: 10.h,
        top: 20.h,
        right: 10.w,
        left: 10.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          15.r,
        ),
        color: Colors.grey.shade100,
        border: Border.all(
          width: 0.7.w,
          color: Colors.black54,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
              Get.find<ProductsSearchController>().setResultSearchData = [];
            },
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 10.w,
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 24.sp,
                ),
              ),
            ),
          ),
          horizontalSpacer(
            10.w,
          ),
          Expanded(
            child: TextField(
              controller: textEditingController,
              onChanged: (value) {
                Get.find<ProductsSearchController>().runSearchFilters(
                  searchText: value,
                );
                print('LENFTH OF RESULT SEARCH IS' +
                    Get.find<ProductsSearchController>()
                        .resultSearchData
                        .length
                        .toString());
              },
              onSubmitted: (value) {
                print(value);
              },
              textInputAction: TextInputAction.search,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'search_pizza'.tr,
                hintStyle: robotoRegular.copyWith(
                  fontSize: 18.sp,
                ),
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              CustomSnackbar(
                'coming_feature_message'.tr,
                AppColors.mainColor,
                title: 'coming_feature_title'.tr,
              );
            },
            child: Center(
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
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(
        Get.context!.width,
        90.h,
      );
}
