import 'package:e_comm_app/common/Widgets/brad_name.dart';
import 'package:e_comm_app/common/Widgets/choice_chip.dart';
import 'package:e_comm_app/common/Widgets/product_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetailePage extends StatelessWidget {
  const ProductDetailePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 320,
                  child: GestureDetector(
                    onTap: () {
                      SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: Image.asset('assets/images/products/A-111.jpg',
                            fit: BoxFit.cover),
                      );
                    },
                    child: PageView(
                      controller: PageController(),
                      children: const [
                        Image(
                          image: AssetImage('assets/images/products/A-111.jpg'),
                          fit: BoxFit.cover,
                        ),
                        Image(
                          image: AssetImage('assets/images/products/A-11.jpg'),
                          fit: BoxFit.cover,
                        ),
                        Image(
                          image: AssetImage('assets/images/products/A-1.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
                AppBar(
                  leading: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back, color: Colors.black)),
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.heart,
                          color: Colors.black,
                        ))
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 4,
                          child: Text('Adidas Sneakers',
                              style:
                                  Theme.of(context).textTheme.headlineSmall)),
                      const Spacer(),
                      InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: () {},
                          child: const Icon(Icons.share))
                    ],
                  ),
                  const ECBrandName(brandName: 'Adidas'),
                  const SizedBox(height: 7),
                  const ECProductPrice(price: '250', isLarge: true),
                  const SizedBox(height: 15),
                  Text('Select Size',
                      style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                        itemBuilder: (_, index) {
                          return ECChoiceChip(
                           selected: false.obs,
                            label: 'S',
                            onSelected: () {

                            },
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 10);
                        },
                        itemCount: 4),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
