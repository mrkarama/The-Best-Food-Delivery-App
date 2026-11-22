import 'package:restaurant/Commons/Utils/packages.dart';

class ScrollableWidget extends StatelessWidget {
  final ScrollController scrollController;
  final List<String> scrollUrlImages;

  const ScrollableWidget({
    super.key,
    required this.scrollController,
    required this.scrollUrlImages,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: scrollUrlImages.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(
            right: 20.w,
            bottom: 15.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              30.r,
            ),
            color: const Color.fromARGB(255, 214, 241, 238),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              top: 15.h,
              bottom: 15.h,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                25.r,
              ),
              child: Image.asset(
                scrollUrlImages[index],
                width: 100.w,
                height: 150.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
