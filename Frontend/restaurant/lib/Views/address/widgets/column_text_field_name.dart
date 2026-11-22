import 'package:restaurant/Commons/Utils/export.dart';
import 'package:restaurant/Commons/Utils/packages.dart';

class ColumnTextFieldAndName extends StatelessWidget {
  final String title;
  final bool? isDisabled;
  final TextEditingController textEditingController;
  final Widget prefixIcon;
  final TextInputType keyboardType;
  const ColumnTextFieldAndName({
    Key? key,
    required this.title,
    required this.textEditingController,
    this.isDisabled = true,
    required this.prefixIcon,
    required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          resizableText(
              text: title,
              fontSize: 21.sp,
              fontWeight: FontWeight.normal,
              color: AppColors.mainBlackColor),
          verticalSpacer(
            10.h,
          ),
          CustomTextField(
            keyboardType: keyboardType,
            controller: textEditingController,
            isLoginOrRegisterPage: true,
            hintText: '',
            prefixIcon: prefixIcon,
            isDisable: isDisabled,
          ),
        ],
      ),
    );
  }
}
