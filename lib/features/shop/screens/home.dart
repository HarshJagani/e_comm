import 'package:e_comm_app/common/Widgets/appbar/home_appbar.dart';
import 'package:e_comm_app/common/Widgets/search_bar.dart';
import 'package:e_comm_app/common/Widgets/section_heading.dart';
import 'package:e_comm_app/common/layout/grid_layout.dart';
import 'package:e_comm_app/common/product_card_vertical/product_card_vertical.dart';
import 'package:e_comm_app/features/personalization/controllers/product_controller.dart';
import 'package:e_comm_app/utils/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/Widgets/catagory_slider.dart';
import '../../../common/Widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
   final controller = Get.put(ProductController());
   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildBody());
  }

  SingleChildScrollView buildBody() {
    print('build ran');
   
    return SingleChildScrollView(
      controller: ScrollController(keepScrollOffset: false),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [Color(0xFF000555), Color(0xFF004e92)],
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: Column(
              children: [
                const HomeAppBar(),
                SizedBox(height: ECSize.spaceBtwSections),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: ECSize.defaultSpace),
                  child: SearchBarHome(),
                ),
                SizedBox(height: ECSize.spaceBtwSections),
                const ECSectionHeading(
                    padding:
                        EdgeInsets.symmetric(horizontal: ECSize.defaultSpace),
                    text: 'Popular Categories',
                    buttonText: '',
                    textColor: Colors.white),
                const SizedBox(height: ECSize.md),
                const ECCategories()
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
              child: PromoSlider()),
          const ECSectionHeading(
            padding: EdgeInsets.symmetric(horizontal: ECSize.defaultSpace),
            text: 'Popular Products',
            buttonText: 'View all',
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ECGridLayout(
                  itemBuilder: (_, index) {
                    return Obx(
                      () => ECProductCardVertical(
                        product: controller.product[index],
                      ),
                    );
                  },
                  itemCount: controller.product.length)),
        ],
      ),
    );
     
  }
 
}
