import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm_app/features/authentication/models/productmodel.dart';
import 'package:e_comm_app/features/authentication/models/usermodel.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  final FirebaseFirestore _db =  FirebaseFirestore.instance;
  static UserRepository get instance => Get.find();

//Function to save userdata to the fire store
Future<void> saveUserRecord(UserModel user) async {
  await _db.collection('Users').doc(user.id).set(user.toJson());
}
//Function to save product data to the fire store
 Future<void> uploadProduct(ProductModel productModel) async {
   _db.collection('products').doc().set(productModel.toJson());
 }


}