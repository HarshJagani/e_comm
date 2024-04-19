import 'package:e_comm_app/navigation_bar.dart';
import 'package:e_comm_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../authentication/controllers/product_upload_controller.dart';

class UploadProduct extends StatelessWidget {
  const UploadProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final productUploadController = Get.put(ProductUploadController());
    return GetBuilder<ProductUploadController>(
      builder: (controller) {
        // Check if the brand list is loaded
        if (controller.brandNameList.isEmpty) {
          // If the brand list is empty, show a loading indicator or a placeholder
          return const Center(
              child: CircularProgressIndicator()); // or PlaceholderWidget();
        } else {
          // If the brand list is loaded, build the UI
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Get.off(() => const NavigationMenu());
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
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
                            padding:
                                const EdgeInsets.only(bottom: 18.0, top: 18),
                            child: TextField(
                              controller:
                                  productUploadController.titleController,
                              decoration: const InputDecoration(
                                  hintText: 'Product title'),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1.5,
                                )),
                            child: Obx(
                              () => DropdownButton<String>(
                                  padding: const EdgeInsets.all(15),
                                  borderRadius: BorderRadius.circular(10),
                                  icon: const Icon(Icons.arrow_drop_down,
                                      color: Colors.blue),
                                  value: productUploadController
                                      .dropDownMenuItem.value,
                                  items: [
                                    ...productUploadController.brandNameList
                                        .map<DropdownMenuItem<String>>((data) {
                                      return DropdownMenuItem<String>(
                                        value: data['id'].toString(),
                                        child: Text(data['name']!),
                                      );
                                    })
                                  ],
                                  onChanged: (String? newValue) {
                                    productUploadController
                                        .dropDownMenuItem.value = newValue!;
                                  }),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 18.0, top: 18),
                            child: TextField(
                              controller:
                                  productUploadController.priceController,
                              decoration: const InputDecoration(
                                  hintText: 'Product Price'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18.0),
                            child: TextField(
                              controller:
                                  productUploadController.salePriceController,
                              decoration: const InputDecoration(
                                  hintText: 'Product sale price'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18.0),
                            child: TextField(
                              controller:
                                  productUploadController.stockController,
                              decoration: const InputDecoration(
                                  hintText: 'Product Stock'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18),
                            child: Container(
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
                                                                      .sizeList[
                                                                  index]
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
                                        itemCount: productUploadController
                                            .sizeList.length,
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
                                  productUploadController
                                      .returnSelectedSizeList();
                                  productUploadController.productDetails();
                                  // productUploadController.getBrands();
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
// Your existing UI code here
          );
        }
      },
    );
  }
}
