import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/constants/colors.dart';
import 'package:restaurant/Commons/widgets/custom_texts.dart';
import 'package:restaurant/Commons/widgets/spacer.dart';

class ExpansionableText extends StatefulWidget {
  final String text;

  const ExpansionableText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpansionableText> createState() => _ExpansionableTextState();
}

class _ExpansionableTextState extends State<ExpansionableText> {
  bool showMore = false;
  late String firstHalf;
  late String secondHalf;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > 200) {
      firstHalf = widget.text.substring(0, 201);
      secondHalf = widget.text.substring(201, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        showMore
            ? resizableText(
                text: widget.text,
                fontSize: 18.sp,
                height: 1.4.h,
                fontWeight: FontWeight.normal,
                maxLines: 100,
              )
            : resizableText(
                text: '$firstHalf.',
                fontSize: 18.sp,
                height: 1.4.h,
                fontWeight: FontWeight.normal,
                maxLines: 100,
              ),
        verticalSpacer(
          3.h,
        ),
        secondHalf.isEmpty
            ? const SizedBox(
                width: 0,
              )
            : GestureDetector(
                onTap: () {
                  setState(() {
                    showMore = !showMore;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      showMore ? Icons.expand_less : Icons.expand_more,
                      size: 24.sp,
                      color: AppColors.mainColor,
                    ),
                    mediumText(
                      text: showMore ? 'show_less'.tr : 'show_more'.tr,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
