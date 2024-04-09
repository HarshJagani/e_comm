import 'package:e_comm_app/common/Widgets/brad_name.dart';
import 'package:e_comm_app/common/Widgets/product_price.dart';
import 'package:e_comm_app/common/Widgets/product_title.dart';
import 'package:e_comm_app/common/Widgets/rounded_container.dart';
import 'package:e_comm_app/common/Widgets/rounded_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants/size.dart';


class ECProductCardVertical extends StatelessWidget {
  const ECProductCardVertical(
      {super.key,
      required this.imageName,
      required this.title,
      required this.brand,
      required this.price,
      this.isDiscounted = false});

  final String imageName;
  final String title;
  final String brand;
  final String price;
  final bool isDiscounted;

  @override
  Widget build(BuildContext context) {
    RxBool favoriteIconClicked = false.obs;
    return Stack(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color:Colors.grey),
                borderRadius: BorderRadius.circular(ECSize.md),
                color: Colors.transparent),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ECRoundedImage(
                    imageUrl: imageName,
                    height: MediaQuery.of(context).size.height*0.25,
                    width: double.infinity,
                    applyImageRadius: true,
                    fit: BoxFit.cover),
              //Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top:5),
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
                      padding: const EdgeInsets.only(left: 8.0),
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
        isDiscounted
            ? Positioned(
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
              )
            : Container(),
      ],
    );
  }
}
