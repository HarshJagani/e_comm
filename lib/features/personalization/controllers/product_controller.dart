import 'package:e_comm_app/data/repositories/user_repository.dart';
import 'package:e_comm_app/features/authentication/models/productmodel.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  RxList<ProductModel> product = <ProductModel>[].obs;
  RxList<ProductModel> brandProducts = <ProductModel>[].obs;
  //List<String> brandList = [];
  final userRepository = Get.put(UserRepository());
  RxInt brandId = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchProductRecord();
    fetchBrandProducts();
  }

  //Fetch user record
  Future<void> fetchProductRecord() async {
    try {
      final product = await userRepository.fetchAllProducts();
      this.product.addAll(product);
    } catch (e) {
      throw 'Somthing went wrong!';
    }
    update();
  }

  //Function to fetch brand products
  Future<void> fetchBrandProducts() async {
    try {
      print('bcdhdhbcdbcvfjvjfvdfhjvfdjvvfhjfbnvf id:::$brandId');
      final brandProducts =
          await userRepository.fetchSpecifycBrandProducts(id: brandId.value);
      this.brandProducts(brandProducts);
    } catch (e) {
      throw 'Somthing went wrong!';
    }
    update();
  }

  void setBradIdValue(int id) {
    brandId.value = id;
    update();
  }
}
