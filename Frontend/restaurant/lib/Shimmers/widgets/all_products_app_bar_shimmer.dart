import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/Utils/extensions.dart';
import 'package:restaurant/Commons/Utils/styles.dart';
import 'package:restaurant/Commons/Widgets/spacer.dart';

class AllProductsAppBarShimmer extends StatelessWidget
    implements PreferredSizeWidget {
  const AllProductsAppBarShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10.h,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 24.sp,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Noodles',
                    style: robotoMedium.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    '12 products',
                    style: robotoRegular.copyWith(
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 24.sp,
                ),
              ),
            ],
          ),
          verticalSpacer(
            20.h,
          ),
          SizedBox(
            width: context.screenWidth,
            height: 40.h,
            child: ListView.builder(
              itemCount: 7,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  width: 100.w,
                  height: 40.h,
                  margin: EdgeInsets.only(
                    left: 10.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      7.r,
                    ),
                    color: Colors.grey.shade300,
                  ),
                  child: Center(
                    child: Text(
                      'Product',
                      style: robotoRegular.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(
        Get.context!.width,
        Get.context!.height / 7.h,
        //: AppValues.screenHeight / 7.h - 45.h,
      );
}
