import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/Commons/constants/colors.dart';
import 'package:restaurant/Commons/widgets/custom_texts.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  const SettingsTile({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      padding: EdgeInsets.only(
        left: 15.w,
      ),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          resizableText(
            text: title,
            fontSize: 21.sp,
            color: AppColors.mainBlackColor,
            fontWeight: FontWeight.normal,
          ),
        ],
      ),
    );
  }
}
