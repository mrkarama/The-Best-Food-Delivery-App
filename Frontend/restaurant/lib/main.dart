import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/Utils/extensions.dart';
import 'package:restaurant/Commons/Utils/messages.dart';
import 'package:restaurant/Commons/constants/app_values.dart';
import 'package:restaurant/Commons/constants/colors.dart';
import 'package:restaurant/Commons/constants/constants.dart';
import 'package:restaurant/Commons/Routes/app_routes.dart';
import 'package:restaurant/Commons/Utils/logger.dart';
import 'package:restaurant/Controllers/localization_controller.dart';
import 'package:restaurant/Controllers/person_controller.dart';
import 'Commons/dependency injection/init.dart';
import 'Controllers/cart_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Map<String, Map<String, String>> language = await Dependencies.init();

  runApp(
    MyApp(
      language: language,
    ),
  );
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>> language;
  const MyApp({
    Key? key,
    required this.language,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    Get.find<PersonController>().isUserLogged();
    //Get.find<StorageService>().removeAppOpenFirstTime();
    //Get.find<StorageService>().removeIsLanguageAlreadySet();

    return GetBuilder<LocalizationController>(
      builder: (localizationController) {
        return ScreenUtilInit(
          designSize: Size(
            context.screenWidth,
            context.screenHeight,
          ),
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: AppColors.mainColor,
            ),
            initialRoute: AppRouteNames.getInitialRoute(),
            logWriterCallback: Logger.write,
            getPages: AppRoutes.routes,
            locale: localizationController.locale,
            fallbackLocale:
                const Locale(AppValues.languageCode, AppValues.languageCode),
            translations: Messages(language: language),
            defaultTransition: Transition.fade,
          ),
        );
      },
    );
  }
}

// BACKEND PLACE ORDER TEST
// {
//     "order_amount": "45",
//     "address": "Burkina Faso, Ouagadougou, Nonssin Sector 10",
//     "order_note": "Delicious food but please work on the food spiciness next time. The spicy was too much.",
//     "cart": [
//         {
//             "id": 1,
//             "title": "Italian Pizza",
//             "description": "Italian pizza is a classic dish that is loved by people all over the world. It is made with a simple dough that is topped with tomato sauce, mozzarella cheese, and various other toppings. Italian pizza is typically baked in a wood-fired oven, which gives it a unique flavor and texture.One of the things that makes Italian pizza so delicious is the quality of the ingredients. The dough is made with high-quality flour and water, and the tomato sauce is made with fresh tomatoes and herbs. The mozzarella cheese is also of the highest quality, and it is melted to perfection in the wood-fired oven.Italian pizza is also very versatile. It can be topped with a variety of different ingredients, such as pepperoni, sausage, mushrooms, onions, and peppers. It can also be topped with different types of cheese, such as Parmesan cheese or ricotta cheese.No matter how it is topped, Italian pizza is a delicious and satisfying meal. It is perfect for a casual lunch or dinner, and it can also be enjoyed as a special occasion dish.",
//             "category":"Fast Foods",
//             "image":"storage/images/foods/fast_foods/italian_pizza.jpg",
//             "price": 2.5,
//             "rating": 4.5,
//             "quantity": 5
//         }
//     ],
//     "payment_method" : "cashOn_delivery",
//     "delivery_options" : "Take away",
//     "delivery_charge": "0.1"
    
// }
// Token for Mr Wali : 9|14gRzlzFmqJO0gCTvkhuOHWfbpoVNTVqoT2cJIVTbfc7a897