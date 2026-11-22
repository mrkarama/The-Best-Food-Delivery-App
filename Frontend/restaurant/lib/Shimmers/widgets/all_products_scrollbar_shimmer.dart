import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/Commons/Utils/extensions.dart';
import 'package:restaurant/Commons/Utils/styles.dart';
import 'package:restaurant/Commons/Widgets/spacer.dart';
import 'package:restaurant/Commons/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class AllProductsScrollbarShimmer extends StatelessWidget {
  const AllProductsScrollbarShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: RawScrollbar(
        trackVisibility: true,
        thumbVisibility: true,
        thumbColor: AppColors.mainColor,
        thickness: 5.w,
        interactive: true,
        radius: Radius.circular(
          5.r,
        ),
        child: SizedBox(
          width: 80.w,
          height: context.screenHeight,
          child: ListView.builder(
            itemCount: 7,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 70.h,
                    width: 70.w,
                    margin: EdgeInsets.only(
                      right: 10.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        30.r,
                      ),
                      color: Colors.grey.shade300,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        30.r,
                      ),
                    ),
                  ),
                  verticalSpacer(
                    10.h,
                  ),
                  Text(
                    'Title',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: robotoMedium.copyWith(
                      fontSize: 15.sp,
                    ),
                  ),
                  verticalSpacer(
                    20.h,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
