import 'package:e_comm_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/authentication/controllers/homepage_controller.dart';

class HomeCartIcon extends StatelessWidget {
  HomeCartIcon({
    super.key,
  });
  final controller = Get.put(CheckHomePageController());
  @override
  Widget build(BuildContext context) {

    final dark = ECHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        Obx(
          () => IconButton(
            onPressed: () {
              
            },
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: controller.isHomePage.isFalse
                  ? (dark ? Colors.white : Colors.black)
                  : Colors.white
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: controller.isHomePage.isFalse
                    ? (dark ? Colors.white : Colors.black)
                    : Colors.white),
            child: Center(
              child: Text(
                '1',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: controller.isHomePage.isFalse
                    ? (dark ? Colors.black : Colors.white)
                    : Colors.black),
              ),
            ),
          ),
        )
      ],
    );
  }
}
