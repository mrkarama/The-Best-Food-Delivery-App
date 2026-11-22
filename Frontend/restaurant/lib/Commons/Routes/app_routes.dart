import 'package:get/get.dart';
import 'package:restaurant/Commons/constants/route_names.dart';
import 'package:restaurant/Middlewares/routes_middleware.dart';
import 'package:restaurant/Views/address/view.dart';
import 'package:restaurant/Views/auth/log%20in%20or%20sign%20up/login_or_sign_up.dart';
import 'package:restaurant/Views/auth/login/view.dart';
import 'package:restaurant/Views/auth/register/view.dart';
import 'package:restaurant/Views/blinkit%20home/view.dart';
import 'package:restaurant/Views/blinkit%20home/widgets/all_products_widget.dart';
import 'package:restaurant/Views/blinkit%20home/widgets/best_sellers_all_products.dart';
import 'package:restaurant/Views/localization/view.dart';
import 'package:restaurant/Views/no%20internet/view.dart';
import 'package:restaurant/Views/payment/view.dart';
import 'package:restaurant/Views/payment/widget/cash_order_success.dart';
import 'package:restaurant/Views/payment/widget/order_success.dart';
import 'package:restaurant/Views/person/view.dart';
import 'package:restaurant/Views/search/view.dart';
import 'package:restaurant/Views/settings/view.dart';
import 'package:restaurant/Views/onboarding/view.dart';
import 'package:restaurant/Views/track%20order/view.dart';
import '../../Views/cart history/view.dart';
import '../../Views/cart/view.dart';
import '../../Views/popular/view.dart';
import '../../Views/recommended/view.dart';
import '../../Views/splash/view.dart';
import '../../Views/welcome/view.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(
      name: AppRouteNames.getInitialRoute(),
      page: () => const SplashScreen(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRouteNames.getWelcomeRoute(),
      page: () => const WelcomePage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRouteNames.getBlinkitHomeRoute(),
      page: () => const BlinkitHomePage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRouteNames.getRecommendedRoute(),
      page: () => const RecommendedPage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRouteNames.getPopularRoute(),
      page: () => const PopularPage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRouteNames.getRegisterRoute(),
      page: () => const RegisterPage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRouteNames.getLoginRoute(),
      page: () => const LoginPage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRouteNames.getPersonRoute(),
      page: () => const PersonPage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRouteNames.getCartRoute(),
      page: () => const CartPage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRouteNames.getCartHistoryRoute(),
      page: () => const CartHistoryPage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRouteNames.getAddressRoute(),
      page: () => const AddressPage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRouteNames.getPaymentRoute(),
      page: () => const PaymentPage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRouteNames.getOrderSuccessRoute(),
      page: () => const OrderSuccessPage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRouteNames.getCashOrderSuccessRoute(),
      page: () => const CashOrderSuccessPage(),
      transition: Transition.fade,
    ),
    GetPage(
        name: AppRouteNames.getLocalizationRoute(),
        page: () => const LocalizationPage(),
        transition: Transition.fade,
        middlewares: [
          RoutesMiddleware(),
        ]),
    GetPage(
      name: AppRouteNames.getSettingsRoute(),
      page: () => const SettingsPage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRouteNames.getOnboardingRoute(),
      page: () => const OnboardingPage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRouteNames.getLoginSignupRoute(),
      page: () => const LoginOrSignupPage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRouteNames.getAllProductRoute(),
      page: () => const AllProductsWidget(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRouteNames.getBestSellerAllProductsRoute(),
      page: () => const AllProductsBestSeller(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRouteNames.getSearchRoute(),
      page: () => const SearchPage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRouteNames.getTrackOrderRoute(),
      page: () => const TrackOrderPage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRouteNames.getNoInternetRoute(),
      page: () => const NoInternetPage(),
      transition: Transition.fade,
    ),
  ];
}
