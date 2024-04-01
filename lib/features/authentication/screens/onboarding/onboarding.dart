
import 'package:e_comm_app/features/authentication/controllers/onboarding_controller.dart';
import 'package:e_comm_app/features/authentication/screens/onboarding/widgets/oboarding_skip.dart';
import 'package:e_comm_app/features/authentication/screens/onboarding/widgets/onboarding_navigation.dart';
import 'package:e_comm_app/features/authentication/screens/onboarding/widgets/onboarding_nextbutton.dart';
import 'package:e_comm_app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:e_comm_app/utils/constants/image_strings.dart';
import 'package:e_comm_app/utils/constants/size.dart';
import 'package:e_comm_app/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: ECSize.productItemHeight),
            child: PageView(
              controller:controller.pageController,   
              children: const [
                OnBoardingPage(
                  image: ECImageString.onBoardingImage1,
                  title: ECText.onBoardingTitle1,
                  subTitle: ECText.onBoardingSubTitle1,
                ),
                OnBoardingPage(
                  image: ECImageString.onBoardingImage2,
                  title: ECText.onBoardingTitle2,
                  subTitle: ECText.onBoardingSubTitle2,
                ),
                OnBoardingPage(
                  image: ECImageString.onBoardingImage3,
                  title: ECText.onBoardingTitle3,
                  subTitle: ECText.onBoardingSubTitle3,
                )
              ],
            ),
          ),
          const OnBoardingSkip(),
          const OnBoardingNavigation(),
          const OnBoardingNetxtButton(),
        ],
      ),
    );
  }
}
