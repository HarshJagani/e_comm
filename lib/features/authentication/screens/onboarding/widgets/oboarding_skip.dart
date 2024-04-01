import 'package:e_comm_app/features/authentication/screens/login/login.dart';
import 'package:e_comm_app/utils/constants/colors.dart';
import 'package:e_comm_app/utils/constants/size.dart';
import 'package:e_comm_app/utils/device/device_utilities.dart';
import 'package:e_comm_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ECHelperFunctions.isDarkMode(context);
    return Positioned(
      top: ECDeviceUtilities.getAppBarHeight(),
      right: ECSize.defaultSpace,
      child: TextButton(
        onPressed: () {
          Get.offAll(() => const LoginScreen());
        },
        child: Text(
          'Skip',
          style: TextStyle(color: !dark ? ECColors.dark : null),
        ),
      ),
    );
  }
}
