import 'package:e_comm_app/navigation_bar.dart';
import 'package:e_comm_app/utils/constants/colors.dart';
import 'package:e_comm_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../authentication/controllers/product_upload_controller.dart';

class UploadProduct extends StatelessWidget {
  UploadProduct({super.key});
  final productUploadController = Get.put(ProductUploadController());

  @override
  Widget build(BuildContext context) {
    final dark = ECHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.off(() => const NavigationMenu());
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      backgroundColor: dark ? Colors.black : Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Obx(
            () => Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0, top: 18),
                      child: TextField(
                        controller: productUploadController.titleController,
                        decoration:
                            const InputDecoration(hintText: 'Product title'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: TextField(
                        controller: productUploadController.brandController,
                        decoration:
                            const InputDecoration(hintText: 'Product brand'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: TextField(
                        controller: productUploadController.priceController,
                        decoration:
                            const InputDecoration(hintText: 'Product Price'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: TextField(
                        controller: productUploadController.salePriceController,
                        decoration: const InputDecoration(
                            hintText: 'Product sale price'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: TextField(
                        controller: productUploadController.stockController,
                        decoration:
                            const InputDecoration(hintText: 'Product Stock'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: Container(
                        //  height: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)),
                        child: Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
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
                                      title: Text(productUploadController
                                          .sizeList[index]['size']),
                                      leading: Obx(
                                        () => IconButton(
                                            onPressed: () {
                                              productUploadController
                                                          .sizeList[index]
                                                      ['isSelected'] =
                                                  !productUploadController
                                                          .sizeList[index]
                                                      ['isSelected'];
                                            },
                                            icon: productUploadController
                                                            .sizeList[index]
                                                        ['isSelected'] ==
                                                    true
                                                ? const Icon(
                                                    Icons.check_box,
                                                    color: Colors.blue,
                                                  )
                                                : const Icon(
                                                    Icons
                                                        .check_box_outline_blank,
                                                    color: Colors.blue,
                                                  )),
                                      ),
                                    );
                                  },
                                  itemCount:
                                      productUploadController.sizeList.length,
                                  shrinkWrap: true,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              productUploadController.openGallery();
                            },
                            child: Text('Browse image',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .apply(color: ECColors.primary))),
                        ElevatedButton(
                          onPressed: () {
                            productUploadController.selectImages(
                                productUploadController.selectedImages);
                          },
                          child: const Text('Upload image'),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            productUploadController.returnSelectedSizeList();
                            productUploadController.productDetails();
                          },
                          child: const Text('Upload data'),
                        ),
                      ),
                    ),
                  ],
                ),
                if (productUploadController.uploading)
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
