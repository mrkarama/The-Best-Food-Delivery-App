import 'package:restaurant/Commons/Utils/export.dart';
import 'package:restaurant/Commons/Utils/packages.dart';

class OrderTimelineWidget extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final Widget eventCard;
  const OrderTimelineWidget({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.eventCard,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight / 5.5,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        endChild: eventCard,
        indicatorStyle: IndicatorStyle(
          width: 30.r,
          color: isPast ? AppColors.yellowColor : Colors.grey,
          iconStyle: IconStyle(
            iconData: Icons.done,
            color: isPast ? Colors.black : Colors.transparent,
          ),
        ),
        beforeLineStyle: LineStyle(
          color: isPast ? AppColors.yellowColor : Colors.grey,
        ),
      ),
    );
  }
}
