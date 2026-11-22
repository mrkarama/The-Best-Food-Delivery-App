import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/Commons/Utils/extensions.dart';
import 'package:shimmer/shimmer.dart';

class ProductTileShimmer extends StatelessWidget {
  const ProductTileShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade100,
      child: GridView.builder(
        itemCount: 6,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 10.h,
          mainAxisExtent: context.screenWidth / 1.5,
        ),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
              top: 20.h,
            ),
            width: context.screenWidth / 2 - 30.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                15.r,
              ),
              color: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}
