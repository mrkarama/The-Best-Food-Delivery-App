import 'package:restaurant/Commons/Utils/export.dart';
import 'package:restaurant/Commons/Utils/packages.dart';

class MyOrderAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final bool? isBackButton;
  const MyOrderAppBar({
    super.key,
    required this.text,
    this.isBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              20.r,
            ),
            bottomRight: Radius.circular(
              20.r,
            ),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 25.h,
              child: isBackButton!
                  ? GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 30.sp,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            Align(
              alignment: Alignment.center,
              child: Center(
                child: bigText(
                  text: text,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ));
  }

  @override
  Size get preferredSize => Size(
        Get.context!.width,
        90.h,
      );
}
