import 'package:restaurant/Commons/Utils/export.dart';
import 'package:restaurant/Commons/Utils/packages.dart';

class TrackOrderPage extends StatefulWidget {
  const TrackOrderPage({
    super.key,
  });

  @override
  State<TrackOrderPage> createState() => _TrackOrderPageState();
}

class _TrackOrderPageState extends State<TrackOrderPage> {
  late Map<String, dynamic> data;
  late int orderId;

  @override
  void initState() {
    super.initState();
    data = Get.arguments;
    orderId = data["orderId"];

    Get.find<TrackOrderController>().trackOrder();
  }

  // void getData(){
  //   if ()
  // }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: Get.find<TrackOrderController>().trackOrder,
      child: SafeArea(
        child:
            GetBuilder<TrackOrderController>(builder: (trackOrderController) {
          if (!trackOrderController.isLoading) {
            Get.find<TrackOrderController>().trackUniqueOrderId(orderId);
          }
          return trackOrderController.isLoading
              ? const Scaffold(
                  backgroundColor: AppColors.backgroundColor,
                  body: CustomLoader(),
                )
              : Scaffold(
                  appBar: MyOrderAppBar(
                    text: 'track_my_order'.tr,
                    isBackButton: true,
                  ),
                  body: Padding(
                    padding: EdgeInsets.only(
                      left: context.screenWidth / 6,
                      top: 20.h,
                    ),
                    child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          OrderTimelineWidget(
                            isFirst: true,
                            isLast: false,
                            isPast: trackOrderController.orderPlaced,
                            eventCard: EventCard(
                              title: 'track_order_title1'.tr,
                              content: 'track_order_content1'.tr,
                              isPast: trackOrderController.orderPlaced,
                            ),
                          ),
                          OrderTimelineWidget(
                            isFirst: false,
                            isLast: false,
                            isPast: trackOrderController.orderConfirmed,
                            eventCard: EventCard(
                              title: 'track_order_title2'.tr,
                              content: 'track_order_content2'.tr,
                              isPast: trackOrderController.orderConfirmed,
                            ),
                          ),
                          OrderTimelineWidget(
                            isFirst: false,
                            isLast: false,
                            isPast: trackOrderController.orderShipped,
                            eventCard: EventCard(
                              title: 'track_order_title3'.tr,
                              content: 'track_order_content3'.tr,
                              isPast: trackOrderController.orderShipped,
                            ),
                          ),
                          OrderTimelineWidget(
                            isFirst: false,
                            isLast: true,
                            isPast: trackOrderController.orderDelivered,
                            eventCard: EventCard(
                              title: 'track_order_title4'.tr,
                              content: 'track_order_content4'.tr,
                              isPast: trackOrderController.orderDelivered,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        }),
      ),
    );
  }
}
