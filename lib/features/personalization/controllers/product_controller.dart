import 'package:e_comm_app/data/repositories/user_repository.dart';
import 'package:e_comm_app/features/authentication/models/productmodel.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {

  //Initialization and variables.
  static ProductController get instance => Get.find();
  final userRepository = Get.put(UserRepository());
  RxList<ProductModel> product = <ProductModel>[].obs;
  RxList<ProductModel> brandProducts = <ProductModel>[].obs;
  int brandId = 0;

  @override
  void onInit() {
    super.onInit();
    setBradIdValue(brandId);
    fetchProductRecord();
  }

  //Set the brandId variable to the apropriet brand id.
  int setBradIdValue(int id) {
    brandId = id;
    fetchBrandProducts();
    update();
    return brandId;
  }

  //Fetch user record
  Future<void> fetchProductRecord() async {
    try {
      final product = await userRepository.fetchAllProducts();
      this.product.addAll(product);
    } catch (e) {
      throw 'Something went wrong!';
    }
    update();
  }

  //Function to fetch brand products
  Future<void> fetchBrandProducts() async {
    try {
      this.brandProducts.clear();
      final brandProducts =
          await userRepository.fetchSpecificBrandProducts(id: brandId);
      this.brandProducts(brandProducts);
    } catch (e) {
      throw 'Something went wrong!';
    }
    update();
  }
}
