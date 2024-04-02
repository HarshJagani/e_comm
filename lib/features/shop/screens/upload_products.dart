import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../authentication/controllers/size_controller.dart';

class UploadProduct extends StatelessWidget {
  UploadProduct({super.key});


  final productUploadController = Get.put(ProductUploadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: TextField(
                  controller: productUploadController.titleController,
                  decoration: const InputDecoration(hintText: 'Product title'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: TextField(
                  controller: productUploadController.brandController,
                  decoration: const InputDecoration(hintText: 'Product brand'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: TextField(
                  controller: productUploadController.priceController,
                  decoration:
                      const InputDecoration(hintText: 'Product Price'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: TextField(
                  controller: productUploadController.salePriceController,
                  decoration:
                  const InputDecoration(hintText: 'Product sale price'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: TextField(
                  controller: productUploadController.stockController,
                  decoration:
                  const InputDecoration(hintText: 'Product Stock'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Container(
                  //  height: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: ExpansionTile(
                    title: const Text('Select Size'),
                    children: [
                      Container(
                        padding: EdgeInsets.zero,
                        height: 150,
                        child: ListView.builder(
                          padding: const EdgeInsets.all(0),
                          itemBuilder: (_, index) {
                            return ListTile(
                              title:
                                  Text(productUploadController.sizeList[index]['size']),
                              leading: Obx(
                                () => IconButton(
                                    onPressed: () {
                                      productUploadController.sizeList[index]
                                              ['isSelected'] =
                                          !productUploadController.sizeList[index]
                                              ['isSelected'];
                                    },
                                    icon: productUploadController.sizeList[index]
                                                ['isSelected'] ==
                                            true
                                        ? const Icon(
                                            Icons.check_box,
                                            color: Colors.blue,
                                          )
                                        : const Icon(
                                            Icons.check_box_outline_blank,
                                            color: Colors.blue,
                                          )),
                              ),
                            );
                          },
                          itemCount: productUploadController.sizeList.length,
                          shrinkWrap: true,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {

                  },
                  child: const Text('Browse image')),
              ElevatedButton(
                onPressed: () {
                  productUploadController.returnSelectedSizeList();
                  productUploadController.productDetails();
                },
                child: const Text('upload data'),
              ),
              ElevatedButton(
                onPressed: () {

                },
                child: const Text('upload image'),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
