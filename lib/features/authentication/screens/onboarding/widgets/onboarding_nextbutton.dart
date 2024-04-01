import 'package:e_comm_app/features/authentication/controllers/onboarding_controller.dart';
import 'package:e_comm_app/features/authentication/screens/login/login.dart';
import 'package:e_comm_app/utils/constants/colors.dart';
import 'package:e_comm_app/utils/constants/size.dart';
import 'package:e_comm_app/utils/device/device_utilities.dart';
import 'package:e_comm_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnBoardingNetxtButton extends StatelessWidget {
  const OnBoardingNetxtButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ECHelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: ECDeviceUtilities.getBottomNavigationBarHeight(),
      right: ECSize.defaultSpace,
      child: ElevatedButton(
        onPressed: () {
          if (OnBoardingController.instance.pageController.page! >= 2) {
            Get.offAll(() => const LoginScreen());
          } else {
            OnBoardingController.instance.pageController.nextPage(
                duration: const Duration(seconds: 1), curve: Curves.bounceOut);
          }
          // final storage = GetStorage();
          // storage.write('IsFirstTime' , false);
          // Get.offAll(const LoginScreen());
        },
        style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromRadius(25),
            shape: const CircleBorder(),
            backgroundColor: dark ? ECColors.primary : ECColors.dark),
        child: const Icon(Icons.arrow_right, size: 35),
      ),
    );
  }
}
