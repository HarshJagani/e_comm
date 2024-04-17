import 'package:e_comm_app/common/Widgets/appbar/appbar.dart';
import 'package:e_comm_app/common/layout/grid_layout.dart';
import 'package:e_comm_app/common/product_card_vertical/product_card_vertical.dart';
import 'package:e_comm_app/features/personalization/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      appBar: const ECAppBar(
        showBackArrow: true,
      ),
      body: ECGridLayout(itemBuilder: (_, index) {
        return
         Obx(
          () => ECProductCardVertical(product: controller.brandProducts[index]));
      }, itemCount: controller.brandProducts.length)
    );
  }
}