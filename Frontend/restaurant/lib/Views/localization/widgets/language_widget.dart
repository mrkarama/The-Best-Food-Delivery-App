import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/Commons/Utils/styles.dart';
import 'package:restaurant/Commons/Widgets/spacer.dart';
import 'package:restaurant/Commons/constants/colors.dart';
import 'package:restaurant/Controllers/localization_controller.dart';

class LanguageWidget extends StatelessWidget {
  final LocalizationController localizationController;
  final int index;
  const LanguageWidget({
    super.key,
    required this.localizationController,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        localizationController.setSelectedIndex = index;
        localizationController.setLanguage(
          Locale(
            localizationController
                .languages[localizationController.selectedIndex].languageCode,
            localizationController
                .languages[localizationController.selectedIndex].countryCode,
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          margin: EdgeInsets.fromLTRB(
            15.w,
            7.h,
            15.w,
            7.h,
          ),
          width: 120.w,
          height: 100.h,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                //spreadRadius: 4,
                blurRadius: 2.r,
                // offset: Offset(1, 5),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              localizationController.selectedIndex == index
                  ? Icon(
                      Icons.check_circle_rounded,
                      color: AppColors.mainColor,
                      size: 30.sp,
                    )
                  : const SizedBox.shrink(),
              verticalSpacer(
                5.h,
              ),
              Text(
                localizationController.languages[index].languageName,
                textAlign: TextAlign.center,
                style: robotoMedium.copyWith(
                  fontSize: 18.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
