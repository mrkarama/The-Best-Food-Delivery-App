import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/Commons/Utils/extensions.dart';
import 'package:restaurant/Commons/Utils/styles.dart';
import 'package:restaurant/Commons/widgets/spacer.dart';

class NoDataPage extends StatelessWidget {
  final String imageUrl;
  final String text;
  final bool isCartHistory;
  const NoDataPage({
    Key? key,
    required this.imageUrl,
    required this.text,
    required this.isCartHistory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpacer(
              isCartHistory
                  ? context.screenHeight * 0.14.h
                  : context.screenWidth * 0.11.h,
            ),
            Image.asset(
              imageUrl,
              fit: BoxFit.fill,
              width: isCartHistory ? context.screenWidth / 2 : null,
            ),
            isCartHistory
                ? verticalSpacer(
                    20.h,
                  )
                : verticalSpacer(
                    0,
                  ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: robotoRegular.copyWith(
                fontSize: 25.sp,
                color: Theme.of(context).disabledColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
