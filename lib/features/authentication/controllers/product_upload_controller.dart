import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm_app/features/authentication/models/productmodel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/repositories/user_repository.dart';

class ProductUploadController extends GetxController {

  //Initialization and variables.
  static ProductUploadController get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final titleController = TextEditingController();
  final brandController = TextEditingController();
  final categoryController = TextEditingController();
  final stockController = TextEditingController();
  final priceController = TextEditingController();
  final salePriceController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final RxBool _uploading = false.obs;
  bool get uploading => _uploading.value;
  RxList<Map<String, dynamic>> brandNameList = <Map<String, dynamic>>[].obs;
  RxList<XFile> selectedImages = <XFile>[].obs;
  RxList<String> imagesUrlList = <String>[].obs;
  RxList<String> finalSizeList = <String>[].obs;
  RxString dropDownMenuItem = '1'.obs;
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
  

  @override
  void onInit() {
    super.onInit();
    getBrands();
  }

 //
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
        title: titleController.text,
        brand: brandController.text,
        category: categoryController.text,
        price: priceController.text,
        salePrize: salePriceController.text,
        stock: stockController.text,
        images: imagesUrlList,
        brandId: int.tryParse(dropDownMenuItem.value),
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
      selectedImages.clear();
      selectedImages.addAll(img);
    }
  }

  //
  Future<void> selectImages(List<XFile> images) async {
    imagesUrlList.clear();
    setUploadInProgress(true); //Start the progress indicator
    imagesUrlList.clear(); //Clears the imageUrl list before updating it
    for (int i = 0; i < images.length; i++) {
      dynamic imageUrl = await uploadImages(images[i]);
      imagesUrlList.add(imageUrl.toString());
    }
    update();
    setUploadInProgress(false); //Close the progress indicator
  }

//Upload images to firebase storage
  Future<String> uploadImages(XFile image) async {
    TaskSnapshot reference = await FirebaseStorage.instance
        .ref()
        .child('product_images/${DateTime.now().millisecondsSinceEpoch}')
        .putFile(File(image.path));
    return await reference.ref
        .getDownloadURL(); //Returns the uploaded images url string
  }

//Function to fatch brands list from firestore.
  Future<void> getBrands() async {
    final querySnapshot = await _db.collection('brand').get();
    List<Map<String, dynamic>> brands = [];
    for (var doc in querySnapshot.docs) {
      brands.add(doc.data());
    }
    brandNameList = brands.obs;
    update();
  }
}
