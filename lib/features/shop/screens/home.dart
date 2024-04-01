import 'package:e_comm_app/common/Widgets/appbar/home_appbar.dart';
import 'package:e_comm_app/common/Widgets/product_list.dart';
import 'package:e_comm_app/common/Widgets/search_bar.dart';
import 'package:e_comm_app/common/Widgets/section_heading.dart';
import 'package:e_comm_app/common/layout/grid_layout.dart';
import 'package:e_comm_app/common/product_card_vertical/product_card_vertical.dart';
import 'package:e_comm_app/utils/constants/size.dart';
import 'package:e_comm_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import '../../../common/Widgets/catagory_slider.dart';
import '../../../common/Widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = ECHelperFunctions.isDarkMode(context);
    return SafeArea(
      child: Scaffold(
          backgroundColor: dark ? Colors.black : Colors.white,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: ECHelperFunctions.screenHeight() * 0.36,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                            colors: [Color(0xFF000555), Color(0xFF004e92)],
                          ),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25))),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(ECSize.defaultSpace),
                        child: PromoSlider(dark: dark)),
                    ECSectionHeading(
                      padding: const EdgeInsets.symmetric(
                          horizontal: ECSize.defaultSpace),
                      text: 'Popular Products',
                      buttonText: 'View all',
                      textColor: dark ? Colors.white : Colors.black,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ECGridLayout(
                            itemBuilder: (_, index) {
                              final product = ProductList().products[index];
                              return ECProductCardVertical(
                                imageName: product['image'],
                                title: product['title'],
                                brand: product['brand'],
                                price: product['price'],
                              );
                            },
                            itemCount: ProductList().products.length)),
                  ],
                ),
                Column(
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
                        padding: EdgeInsets.symmetric(
                            horizontal: ECSize.defaultSpace),
                        text: 'Popular Categories',
                        buttonText: '',
                        textColor: Colors.white),
                    const SizedBox(height: ECSize.md),
                    const ECCategories()
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
