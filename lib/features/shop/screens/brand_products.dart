import 'package:e_comm_app/common/Widgets/appbar/appbar.dart';
import 'package:e_comm_app/common/layout/grid_layout.dart';
import 'package:e_comm_app/common/product_card_vertical/product_card_vertical.dart';
import 'package:e_comm_app/features/personalization/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandProducts extends StatelessWidget {
  BrandProducts({super.key});

  //Initialization and variables.
  final controller = ProductController.instance;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (controller) {
      if (controller.brandProducts.isEmpty) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          color: Colors.black,
          child: CircularProgressIndicator());
      } else {
        return Scaffold(
            appBar: ECAppBar(
                showBackArrow: true,
                leadingOnPressed: () {
                  Get.back();
                }),
            body: ECGridLayout(
                itemBuilder: (_, index) {
                  return Obx(() => ECProductCardVertical(
                      product: controller.brandProducts[index]));
                },
                itemCount: controller.brandProducts.length));
      }
    });
  }
}
