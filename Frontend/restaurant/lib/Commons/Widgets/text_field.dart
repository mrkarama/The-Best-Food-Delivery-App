import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant/Commons/Utils/styles.dart';
import 'package:restaurant/commons/constants/colors.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String hintText;
  final bool? isDisable;
  final Widget prefixIcon;
  bool? isLoginOrRegisterPage;
  bool? isObscure;
  CustomTextField({
    Key? key,
    required this.keyboardType,
    required this.controller,
    required this.hintText,
    this.isDisable = true,
    required this.prefixIcon,
    this.isObscure = false,
    this.isLoginOrRegisterPage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: isLoginOrRegisterPage! ? 0 : 15.w,
        right: isLoginOrRegisterPage! ? 0 : 15.w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 10.r,
            spreadRadius: isLoginOrRegisterPage! ? 3.r : 7.r,
            offset: Offset(
              1.w,
              isLoginOrRegisterPage! ? 3.h : 10.h,
            ),
          ),
        ],
        borderRadius: BorderRadius.circular(
          isLoginOrRegisterPage! ? 40.r : 15.r,
        ),
      ),
      child: TextField(
        enabled: isDisable,
        style: robotoRegular.copyWith(
          fontSize: 18.sp,
          color: AppColors.mainBlackColor,
        ),
        controller: controller,
        cursorColor: AppColors.mainColor,
        keyboardType: keyboardType,
        textInputAction: TextInputAction.done,
        obscureText: isObscure!,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              isLoginOrRegisterPage! ? 40.r : 15.r,
            ),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              isLoginOrRegisterPage! ? 40.r : 15.r,
            ),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              isLoginOrRegisterPage! ? 40.r : 15.r,
            ),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
