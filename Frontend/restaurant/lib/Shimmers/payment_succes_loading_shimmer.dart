import 'package:restaurant/Commons/Utils/export.dart';
import 'package:restaurant/Commons/Utils/packages.dart';

class PaymentSuccessLoadingShimmer extends StatelessWidget {
  const PaymentSuccessLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15.w, 20.h, 15.w, 10.h),
                child: Row(
                  children: [
                    Container(
                      width: 50.w,
                      height: 50.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 50.w,
                            height: 50.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.r),
                              color: Colors.grey,
                            ),
                          ),
                          horizontalSpacer(30.w),
                          Container(
                            width: 50.w,
                            height: 50.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.r),
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(15.w, 20.h, 15.w, 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 110.h,
                            height: 110.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: Colors.grey,
                            ),
                          ),
                          horizontalSpacer(8.w),
                          Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: context.screenWidth / 4,
                                height: 25.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: Colors.grey,
                                ),
                              ),
                              verticalSpacer(20.h),
                              Container(
                                width: context.screenWidth / 4.5,
                                height: 18.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: Colors.grey,
                                ),
                              ),
                              verticalSpacer(20.h),
                              Row(
                                children: [
                                  Container(
                                    width: context.screenWidth / 12,
                                    height: 23.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
                                      color: Colors.grey,
                                    ),
                                  ),
                                  horizontalSpacer(context.screenWidth / 2.4),
                                  Container(
                                    width: context.screenWidth / 8,
                                    height: 23.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.w, right: 5.r),
                child: Container(
                  width: context.screenWidth,
                  height: 60.h,
                  margin: EdgeInsets.only(
                    left: 5.w,
                    right: 5.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: Colors.grey,
                  ),
                ),
              ),
              verticalSpacer(10.h),
              Padding(
                padding: EdgeInsets.only(left: 5.w, right: 5.r, bottom: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: context.screenWidth / 3.5,
                      height: 60.h,
                      margin: EdgeInsets.only(
                        left: 5.w,
                        right: 5.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      width: context.screenWidth / 3.5,
                      height: 60.h,
                      margin: EdgeInsets.only(
                        left: 5.w,
                        right: 5.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
