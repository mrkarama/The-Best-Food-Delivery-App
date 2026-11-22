import 'package:restaurant/Commons/Utils/export.dart';
import 'package:restaurant/Commons/Utils/packages.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String content;
  final bool isPast;
  const EventCard({
    super.key,
    required this.title,
    required this.content,
    required this.isPast,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 25.w,
        bottom: 25.h,
        right: 25.w,
      ),
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 10.w,
        bottom: 10.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.r,
        ),
        color: isPast ? AppColors.yellowColor : Colors.grey,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: robotoBold.copyWith(
                fontSize: 21.sp,
              ),
            ),
            Text(
              content,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: robotoRegular.copyWith(
                fontSize: 17.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
