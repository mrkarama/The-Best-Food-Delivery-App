import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/Commons/Utils/styles.dart';
import 'package:restaurant/Commons/widgets/spacer.dart';

class PersonItem extends StatelessWidget {
  final String title;
  final IconData circleIcon;
  final Color circleBackgroundColor;
  const PersonItem({
    Key? key,
    required this.title,
    required this.circleIcon,
    required this.circleBackgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      padding: EdgeInsets.only(
        left: 20.w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 6,
            offset: Offset(
              0.5.w,
              0.5.h,
            ),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundColor: circleBackgroundColor,
            child: Icon(
              circleIcon,
              color: Colors.white,
              size: 35.sp,
            ),
          ),
          horizontalSpacer(
            25.w,
          ),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: robotoRegular.copyWith(
                fontSize: 21.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
