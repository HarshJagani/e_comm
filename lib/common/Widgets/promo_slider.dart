import 'package:e_comm_app/common/Widgets/rounded_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';

class PromoSlider extends StatelessWidget {
  PromoSlider({
    super.key,
  });

  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView(
            controller: pageController,
            children: const [
              ECRoundedImage(
                imageUrl: ECImageString.promoBanner1,
                fit: BoxFit.fill,
              ),
              ECRoundedImage(
                  imageUrl: ECImageString.promoBanner2, fit: BoxFit.fill),
              ECRoundedImage(
                  imageUrl: ECImageString.promoBanner3, fit: BoxFit.fill)
            ],
          ),
        ),
        const SizedBox(height: 10),
        SmoothPageIndicator(
          controller: pageController,
          count: 3,
          effect: ExpandingDotsEffect(
              activeDotColor: ECColors.light ,
              dotHeight: 3),
        )
      ],
    );
  }
}
