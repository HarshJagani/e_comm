import 'package:e_comm_app/common/Widgets/brad_name.dart';
import 'package:e_comm_app/common/Widgets/product_price.dart';
import 'package:e_comm_app/common/Widgets/product_title.dart';
import 'package:e_comm_app/common/Widgets/rounded_container.dart';
import 'package:e_comm_app/common/Widgets/rounded_image.dart';
import 'package:e_comm_app/utils/constants/colors.dart';
import 'package:e_comm_app/utils/device/device_utilities.dart';
import 'package:e_comm_app/utils/helpers/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants/size.dart';

class ECProductCardVertical extends StatelessWidget {
  ECProductCardVertical(
      {super.key,
        required this.imageName,
        required this.title,
        required this.brand,
        required this.price,
        this.isDiscounted = false
      });
    String imageName;
    String title;
    String brand;
    String price;
    bool isDiscounted;

  @override
  Widget build(BuildContext context) {
    final dark = ECHelperFunctions.isDarkMode(context);
    RxBool favoriteIconClicked = false.obs;
    return Stack(
      children: [
        GestureDetector(
          onTap: (){},
          child: Container(
            width: ECDeviceUtilities.getScreenWidth(context) * 0.48,
            decoration: BoxDecoration(
                border: Border.all(color: dark ? Colors.grey : Colors.grey),
                borderRadius: BorderRadius.circular(ECSize.md),
                color: Colors.transparent),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ECRoundedContainer(
                  height: 180,
                  width: ECDeviceUtilities.getScreenWidth(context) * 0.48,
                  backgroundColor: dark ? ECColors.dark : ECColors.light,
                  child: ECRoundedImage(
                      imageUrl: imageName,
                      applyImageRadius: true,
                      fit: BoxFit.cover),
                ),
              //  const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ECProductTitle(productTitle: title),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ECBrandName(brandName: brand),
                ),
              // const SizedBox(height: 5),
               Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left:8.0),
                     child: ECProductPrice(price: price),
                   ),
                   Obx(
                         () => IconButton(
                       onPressed: () {
                         favoriteIconClicked.toggle();
                       },
                           icon: favoriteIconClicked.isTrue
                               ? const Icon(CupertinoIcons.heart_fill)
                               : const Icon(CupertinoIcons.heart),
                           color: favoriteIconClicked.isTrue ? Colors.red : null,
                     ),
                   ),
                 ],
               )
              ],
            ),
          ),
        ),
       isDiscounted ? Positioned(
          top: 10,
          left: 8,
          child: ECRoundedContainer(
            radius: 100,
            padding: const EdgeInsets.symmetric(
                horizontal: ECSize.sm, vertical: ECSize.xs),
            backgroundColor: Colors.grey.shade400,
            child: Center(
                child: Text('20%',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .apply(color: Colors.black))),
          ),
        ) : Container(),

      ],
    );
  }
}
