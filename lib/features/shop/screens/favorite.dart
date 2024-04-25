import 'package:e_comm_app/common/Widgets/appbar/appbar.dart';
import 'package:e_comm_app/features/shop/screens/upload_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ECAppBar(
        actions: [
          IconButton(
            onPressed:   () {
              Get.off(() => const UploadProduct());
            },
            icon: const Icon(Icons.add,color: Colors.blue)
            )
        ],
      )
      );
  
  
  }
}
