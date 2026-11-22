import 'package:restaurant/Commons/Utils/export.dart';
import 'package:restaurant/Commons/Utils/packages.dart';

class AllProductsShimmer extends StatefulWidget {
  const AllProductsShimmer({
    super.key,
  });

  @override
  State<AllProductsShimmer> createState() => _AllProductsShimmerState();
}

class _AllProductsShimmerState extends State<AllProductsShimmer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: EdgeInsets.only(
            left: 10.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    height: context.screenHeight,
                    color: Colors.grey.shade300,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 10.w,
                        right: 10.w,
                      ),
                      child: const ProductTileShimmer(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
