import 'package:restaurant/Commons/Utils/export.dart';
import 'package:restaurant/Commons/Utils/packages.dart';

class PersonShimmer extends StatelessWidget {
  const PersonShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  verticalSpacer(
                    50.h,
                  ),
                  Container(
                    height: 150.h,
                    width: 150.h,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(75.r),
                    ),
                  ),
                  verticalSpacer(
                    40.h,
                  ),
                  const ShimmerPersonItem(),
                  verticalSpacer(
                    25.h,
                  ),
                  const ShimmerPersonItem(),
                  verticalSpacer(
                    25.h,
                  ),
                  const ShimmerPersonItem(),
                  verticalSpacer(
                    25.h,
                  ),
                  const ShimmerPersonItem(),
                  verticalSpacer(
                    25.h,
                  ),
                  const ShimmerPersonItem(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
