import 'package:e_comm_app/common/layout/grid_layout.dart';
import 'package:e_comm_app/common/product_card_vertical/product_card_vertical.dart';
import 'package:flutter/material.dart';

import '../../../common/Widgets/product_list.dart';


class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
    //   body: ECGridLayout(
    // itemBuilder: (_, index) {
    // final product = ProductList().products[index];
    // return ECProductCardVertical(
    // imageName: product['image'],
    // title: product['title'],
    // brand: product['brand'],
    // price: product['price'],
    // index: index);
    // },
    // itemCount: ProductList().products.length
    // ),
    );
  }
}
