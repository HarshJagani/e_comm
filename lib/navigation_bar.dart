
import 'package:e_comm_app/features/authentication/controllers/homepage_controller.dart';
import 'package:e_comm_app/features/shop/screens/home.dart';
import 'package:e_comm_app/features/shop/screens/profile_settings.dart';
import 'package:e_comm_app/features/shop/screens/store.dart';
import 'package:e_comm_app/utils/helpers/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
   const NavigationMenu({super.key});

   // RxBool isHomePage = false.obs;
   // isHome(RxBool isHomeNav) {
   //   isHomePage = isHomeNav;
   // }
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final homepageController = Get.put(CheckHomePageController());
    bool dark = ECHelperFunctions.isDarkMode(context);
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(0, 0),
          child: Container(),
        ),
        bottomNavigationBar: Obx(() => CurvedNavigationBar(
                height: 50,
                index: controller.currentIndex.value,
                backgroundColor: Colors.transparent,
                animationDuration: const Duration(milliseconds: 200),
                buttonBackgroundColor: dark ? Colors.white : Colors.black,
                color: dark ? Colors.white : Colors.black,
                onTap: (index) => {
                      controller.currentIndex.value = index,
                  homepageController.isHomePage = controller.currentIndex.value == 0 ? true.obs : false.obs
                    },
                items: [
                  Icon(Iconsax.home, color: dark ? Colors.black : Colors.white),
                  Icon(Iconsax.shop4,
                      color: dark ? Colors.black : Colors.white),
                  Icon(CupertinoIcons.heart,
                      color: dark ? Colors.black : Colors.white),
                  Icon(CupertinoIcons.person,
                      color: dark ? Colors.black : Colors.white)
                ])),
        body: Obx(() => controller.screen[controller.currentIndex.value]),
      ),
    );
  }
}

class NavigationController extends GetxController {
  RxInt currentIndex = 0.obs;
  final screen = [
    const HomeScreen(),
    const Store(),
    Container(color: Colors.green),
    const ProfileSetting()
  ];
}