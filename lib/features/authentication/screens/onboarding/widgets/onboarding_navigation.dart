import 'package:e_comm_app/features/authentication/controllers/onboarding_controller.dart';
import 'package:e_comm_app/utils/constants/colors.dart';
import 'package:e_comm_app/utils/constants/size.dart';
import 'package:e_comm_app/utils/device/device_utilities.dart';
import 'package:e_comm_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingNavigation extends StatelessWidget {
  const OnBoardingNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ECHelperFunctions.isDarkMode(context);
    final controller = OnBoardingController.instance;
    return Positioned(
        bottom: ECDeviceUtilities.getBottomNavigationBarHeight() + 25,
        left: ECSize.defaultSpace,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          count: 3,
          effect: ExpandingDotsEffect(
              activeDotColor: dark ? ECColors.light : ECColors.dark,
              dotHeight: 6),
        ));
  }
}
