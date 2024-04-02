import 'dart:html';

import 'package:e_comm_app/features/authentication/models/productmodel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/repositories/user_repository.dart';

class ProductUploadController extends GetxController {
  static ProductUploadController get instance => Get.find();
  final titleController = TextEditingController();
  final brandController = TextEditingController();
  final categoryController = TextEditingController();
  final stockController = TextEditingController();
  final priceController = TextEditingController();
  final salePriceController = TextEditingController();

  List<XFile>? images = [];
  List<String> imagesPath = [];
  final _picker = ImagePicker();

  RxList<RxMap<String, dynamic>> sizeList = [
    {'size': 'S', 'isSelected': false}.obs,
    {'size': 'M', 'isSelected': false}.obs,
    {'size': 'L', 'isSelected': false}.obs,
    {'size': 'XL', 'isSelected': false}.obs,
    {'size': '6', 'isSelected': false}.obs,
    {'size': '7', 'isSelected': false}.obs,
    {'size': '8', 'isSelected': false}.obs,
    {'size': '9', 'isSelected': false}.obs,
    {'size': '10', 'isSelected': false}.obs,
    {'size': '28', 'isSelected': false}.obs,
    {'size': '30', 'isSelected': false}.obs,
    {'size': '32', 'isSelected': false}.obs,
    {'size': '34', 'isSelected': false}.obs,
  ].obs;
  RxList<String> finalSizeList = <String>[].obs;
  returnSelectedSizeList() {
    finalSizeList.clear();
    for (final sizeMap in sizeList) {
      if (sizeMap['isSelected'] == true) {
        finalSizeList.add(sizeMap['size']);
      }
    }
    return finalSizeList;
  }

  Future<void> productDetails() async {
    final productDetails = ProductModel(
        brand: brandController.text,
        category: categoryController.text,
        price: priceController.text,
        salePrize: salePriceController.text,
        stock: stockController.text,
        size: returnSelectedSizeList());

    //Upload product data to firebase fire store
    final userRepository = Get.put(UserRepository());
    userRepository.uploadProduct(productDetails);
  }

  void selectedImages() async {
    images = await _picker.pickMultiImage();
    if (images != null) {
      for (XFile file in images!) {
        imagesPath.add(file.path);
      }

    }

  }

  //Uploads the selected images to the firebase storage
  void uploadImages() {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('product_images/${DateTime.now().millisecondsSinceEpoch}');
    UploadTask uploadTask = ref.putFile(images!);
  }
}
