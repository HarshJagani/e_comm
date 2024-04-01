
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_comm_app/common/Widgets/rounded_image.dart';
import 'package:e_comm_app/features/authentication/controllers/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
   final controller = Get.put(CarouselControllerCommon());
    return Column(
      children: [
        CarouselSlider(items: const [
          ECRoundedImage(imageUrl: ECImageString.promoBanner1),
          ECRoundedImage(imageUrl: ECImageString.promoBanner2),
          ECRoundedImage(
            imageUrl: ECImageString.promoBanner3,
            fit: BoxFit.fill,
          ),
        ], options: CarouselOptions(viewportFraction: 1,
        onPageChanged: (index, _) {
          controller.updatePageIndicator(index);

        }),

        ),
        const SizedBox(height: 10),
        SmoothPageIndicator(
          controller: controller.pageController,
          count: 3,
          effect: ExpandingDotsEffect(
              activeDotColor: dark ? ECColors.light : ECColors.dark,
              dotHeight: 3),
        )
      ],
    );
  }
}

