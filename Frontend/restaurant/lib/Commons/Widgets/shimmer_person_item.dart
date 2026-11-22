import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/Commons/widgets/spacer.dart';

class ShimmerPersonItem extends StatelessWidget {
  const ShimmerPersonItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      padding: EdgeInsets.only(
        left: 20.w,
      ),
      decoration: const BoxDecoration(color: Colors.grey),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(radius: 30.r, backgroundColor: Colors.grey),
          horizontalSpacer(
            25.w,
          ),
          Expanded(
            child: Container(
              height: 70.h,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(
                  10.r,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
