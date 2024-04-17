import 'package:e_comm_app/data/repositories/user_repository.dart';
import 'package:e_comm_app/features/authentication/models/productmodel.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  static ProductController get instance => Get.find();

  RxList<ProductModel> product = List<ProductModel>.empty().obs;
  final userRepository = Get.put(UserRepository());

   @override
  void onInit() {
    super.onInit();
    fetchProductRecord();
  }

  //Fetch user record
  Future<void> fetchProductRecord() async {
    try {
      final product = await userRepository.fetchAllProducts();
      this.product(product);
    } catch (e) {
      throw 'Somthing went wrong!';
    }
  }

}