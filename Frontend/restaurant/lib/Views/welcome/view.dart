import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:restaurant/Commons/constants/colors.dart';
import 'package:restaurant/Views/blinkit%20home/view.dart';
import 'package:restaurant/Views/cart%20history/view.dart';
import 'package:restaurant/Views/my%20order/order.dart';
import 'package:restaurant/Views/no%20internet/view.dart';
import 'package:restaurant/Views/person/view.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> navPages = [
      const BlinkitHomePage(),
      const MyOrder(),
      const CartHistoryPage(),
      const PersonPage(),
    ];

    List<PersistentBottomNavBarItem> navItems = [
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.home,
        ),
        title: 'Home',
        iconSize: 30.sp,
        activeColorPrimary: AppColors.yellowColor,
        activeColorSecondary: AppColors.mainColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.shopping_bag,
        ),
        title: 'History',
        iconSize: 30.sp,
        activeColorPrimary: AppColors.yellowColor,
        activeColorSecondary: AppColors.mainColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.shopping_cart,
        ),
        title: 'Cart',
        iconSize: 30.sp,
        activeColorPrimary: AppColors.yellowColor,
        activeColorSecondary: AppColors.mainColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.person,
        ),
        title: 'Me',
        iconSize: 30.sp,
        activeColorPrimary: AppColors.yellowColor,
        activeColorSecondary: AppColors.mainColor,
      ),
    ];
    return SafeArea(
      child: StreamBuilder(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
          if (snapshot.hasData) {
            final result = snapshot.data!;

            if (result == ConnectivityResult.wifi ||
                result == ConnectivityResult.mobile) {
              return PersistentTabView(
                context,
                screens: navPages,
                items: navItems,
                navBarStyle: NavBarStyle.style12,
                backgroundColor: AppColors.backgroundColor,
              );
            }
            return NoInternetPage();
          } else {
            return PersistentTabView(
              context,
              screens: navPages,
              items: navItems,
              navBarStyle: NavBarStyle.style12,
              backgroundColor: AppColors.backgroundColor,
            ); //return NoInternetPage();
          }
        },
      ),
    );
  }
}
