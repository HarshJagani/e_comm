import 'dart:io';
import 'package:e_comm_app/features/authentication/models/productmodel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  RxList<XFile> selectedImages = <XFile>[].obs;
  RxList<String> imagesUrlList = <String>[].obs;
  final ImagePicker _picker = ImagePicker();
  final RxBool _uploading = false.obs;
  bool get uploading => _uploading.value;

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

  void setUploadInProgress(bool value) {
    _uploading.value = value;
  }

  void clearData() {
    titleController.clear();
    brandController.clear();
    categoryController.clear();
    stockController.clear();
    priceController.clear();
    salePriceController.clear();
    finalSizeList.clear();
    for (var sizeItem in sizeList) {
      sizeItem['isSelected'] = false;
    }
  }

  Future<void> productDetails() async {
    //Start the progress indicator
    setUploadInProgress(true);

    //Passes the text field and size list data to the product model
    final productDetails = ProductModel(
        brand: brandController.text,
        category: categoryController.text,
        price: priceController.text,
        salePrize: salePriceController.text,
        stock: stockController.text,
        images: imagesUrlList,
        size: returnSelectedSizeList());

    //Upload product data to firebase fire store
    final userRepository = Get.put(UserRepository());
    userRepository.uploadProduct(productDetails);

    //Close the progress indicator
    setUploadInProgress(false);

    //Clear the text field and size list data
    clearData();
  }

  //Function to pick images from gallery and store them in a list
  Future<void> openGallery() async {
    List<XFile> img = [];
    img = await _picker.pickMultiImage();
    update();
    if (img.isNotEmpty) {
      selectedImages.addAll(img);
    }
  }

  //
  Future<void> selectImages(List<XFile> images) async {
    setUploadInProgress(true);  //Start the progress indicator
    imagesUrlList.clear(); //Clears the imageUrl list before updating it
    for (int i = 0; i < images.length; i++) {
      dynamic imageUrl = await uploadImages(images[i]);
      imagesUrlList.add(imageUrl.toString());
    }
    update();
    setUploadInProgress(false);  //Close the progress indicator
  }

//Upload images to firebase storage
  Future<String> uploadImages(XFile image) async {
    TaskSnapshot reference = await FirebaseStorage.instance
        .ref()
        .child('product_images/${DateTime.now().millisecondsSinceEpoch}')
        .putFile(File(image.path));
    return await reference.ref.getDownloadURL(); //Returns the uploaded images url string
  }
}
