import 'package:e_comm_app/common/Widgets/appbar/appbar.dart';
import 'package:e_comm_app/common/Widgets/brad_name.dart';
import 'package:e_comm_app/common/Widgets/home_cart_icon.dart';
import 'package:e_comm_app/common/Widgets/rounded_container.dart';
import 'package:e_comm_app/common/Widgets/search_bar.dart';
import 'package:e_comm_app/common/Widgets/section_heading.dart';
import 'package:e_comm_app/common/layout/grid_layout.dart';
import 'package:e_comm_app/features/authentication/controllers/product_upload_controller.dart';
import 'package:e_comm_app/features/personalization/controllers/product_controller.dart';
import 'package:e_comm_app/features/shop/screens/brand_products.dart';
import 'package:e_comm_app/utils/constants/colors.dart';
import 'package:e_comm_app/utils/constants/size.dart';
import 'package:e_comm_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Store extends StatelessWidget {
  Store({
    super.key,
  });
  final controller = Get.put(ProductUploadController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductUploadController>(builder: (controller) {
      if (controller.brandNameList.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: ECAppBar(
              title: Text('Store',
                  style: Theme.of(context).textTheme.headlineMedium),
              actions: [HomeCartIcon()],
            ),
            body: Padding(
              padding: const EdgeInsets.all(ECSize.defaultSpace),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SearchBarHome(hintText: 'Search in store'),
                    const SizedBox(height: ECSize.defaultSpace),
                    const ECSectionHeading(
                        text: 'Featured Brands',
                        buttonText: 'View all',
                        padding: EdgeInsets.symmetric(vertical: 10)),
                    ECGridLayout(
                        //  mainAxisIntent: 80,
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () {
                              int selectedBrandId = controller.brandNameList[index]['id'];
                              ProductController.instance.setBradIdValue(selectedBrandId);
                              Get.to(() =>  BrandProducts() );
                            },
                            child: ECRoundedContainer(
                              backgroundColor: Colors.transparent,
                              borderColor: Colors.grey,
                              showBorder: true,
                              height: 70,
                              width: 180,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Icon(Iconsax.additem),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ECBrandName(
                                              brandName: controller
                                                      .brandNameList[index]
                                                  ['name']),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: controller.brandNameList.length),
                    TabBar(
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        indicatorColor: ECColors.primary,
                        unselectedLabelColor: Colors.grey,
                        padding: const EdgeInsets.only(top: 20),
                        labelColor: ECHelperFunctions.isDarkMode(context)
                            ? Colors.white
                            : Colors.black,
                        tabs: const [
                          Tab(child: Text('Sports')),
                          Tab(child: Text('Clothes')),
                          Tab(child: Text('Electronics')),
                          Tab(child: Text('Cosmetics'))
                        ])
                  ],
                ),
              ),
            ),
          ),
        );
      }
    });
  }
}
