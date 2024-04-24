import 'package:e_comm_app/common/Widgets/brad_name.dart';
import 'package:e_comm_app/common/Widgets/choice_chip.dart';
import 'package:e_comm_app/common/Widgets/product_bottom_navigation/product_bottom_nav.dart';
import 'package:e_comm_app/common/Widgets/product_price.dart';
import 'package:e_comm_app/features/authentication/models/productmodel.dart';
import 'package:e_comm_app/utils/constants/size.dart';
import 'package:e_comm_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetailePage extends StatelessWidget {

  //Initialization and variables.
  const ProductDetailePage({super.key, required this.product});
  final ProductModel product;
  
  @override
  Widget build(BuildContext context) {                                                                                                                           
    return Scaffold(
      bottomNavigationBar: const ECProductBottomNav(),
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
                      children:  [
                        Image(
                          image: NetworkImage(product.images![0]),
                          fit: BoxFit.cover,
                          
                        ),
                        Image(
                          image: NetworkImage(product.images![1]),
                          fit: BoxFit.cover,
                        ),
                        Image(
                          image: NetworkImage(product.images![2]),
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
            const SizedBox(height: ECSize.sm),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: ECSize.iconSm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 4,
                          child: Text(product.title!,
                              style:
                                  Theme.of(context).textTheme.headlineSmall)),
                      const Spacer(),
                      InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: () {},
                          child: const Icon(Icons.share))
                    ],
                  ),
                  ECBrandName(brandName:product.brand),
                  const SizedBox(height: ECSize.sm),
                  ECProductPrice(price: product.price!, isLarge: true),
                  const SizedBox(height: ECSize.iconSm),
                  Text('Select Size',
                      style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: ECSize.sm),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                        itemBuilder: (_, index) {
                          return ECChoiceChip(
                            selected: false.obs,
                            label: product.size[index],
                            onSelected: () {},
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: ECSize.sm);
                        },
                        itemCount: product.size.length),
                  ),
                  const SizedBox(height: ECSize.iconLg),
                  SizedBox( 
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(ECText.buynow),
                      )),
                  const SizedBox(height: ECSize.iconLg),
                  Text(ECText.discreption,
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: ECSize.sm),
                  const Text(
                      'The Samba OG is considered the classic and most prevalent Samba Silhouette available. It typically is constructed with a mix of suede and leather, complemented by a contrasting gum sole and the Three-Stripe branding.'),
                 const SizedBox(height: ECSize.sm),
                 const Divider(thickness: 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
