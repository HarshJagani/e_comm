import 'package:e_comm_app/data/repositories/user_repository.dart';
import 'package:e_comm_app/features/authentication/models/productmodel.dart';
import 'package:get/get.dart';


class ProductController extends GetxController{
  static ProductController get instance => Get.find();

  RxList<ProductModel> product = <ProductModel>[].obs;
  RxList<ProductModel> brandProducts = <ProductModel>[].obs;
  List<String> brandList = [];
  final userRepository = Get.put(UserRepository());

   @override
  void onInit()  {
    super.onInit();
    fetchProductRecord();
    fetchBrandProducts();
  }

  //Fetch user record
  Future<void> fetchProductRecord() async {
    try {
      final product = await userRepository.fetchAllProducts();
      this.product.addAll(product);
      print(this.product);
  
      
    } catch (e) {
      throw 'Somthing went wrong!';
    }
  }


 //Function to fetch brand products
  Future<void> fetchBrandProducts() async{
    try{
      final brandProducts = await userRepository.fetchSpecifycBrandProducts();
      this.brandProducts(brandProducts);
      brandList = brandProducts.map((e) => e.brand).toSet().toList();
    }catch(e){
      throw 'Somthing went wrong!';
    }
  }

}