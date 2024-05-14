import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm_app/features/authentication/models/productmodel.dart';
import 'package:e_comm_app/features/authentication/models/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserRepository extends GetxController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  static UserRepository get instance => Get.find();

 

//Function to save userdata to the fire store
  Future<void> saveUserRecord(UserModel user) async {
    await _db.collection('Users').doc(user.id).set(user.toJson());
  }

//Function to save product data to the fire store
  Future<void> uploadProduct(ProductModel productModel) async {
    _db.collection('products').doc().set(productModel.toJson());
  }

//Function to fetch all products from the fire store.
  Future<List<ProductModel>> fetchAllProducts() async {
    final querySnapshot = await _db.collection('products').get();
    final allProducts =
        querySnapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
        //print(allProducts);
    return allProducts;
  }

//Function to fetch specific brand products.
Future<List<ProductModel>> fetchSpecificBrandProducts({int? id}) async {
  final querySnapshot = await _db.collection('products').where('BrandId',isEqualTo: id).get();
  final brandAllProducts =
      querySnapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
  return brandAllProducts;
}  

//Function to fetch user details  from the fire base using  id
  Future<UserModel?> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } catch (e) {
      return null;
    }
  }

  Future<String> uploadProfilePicture(XFile profilePic) async{
     TaskSnapshot reference = await FirebaseStorage.instance
        .ref()
        .child('profile_pictures/${DateTime.now().millisecondsSinceEpoch}')
        .putFile(File(profilePic.path));
         print(reference.ref.getDownloadURL());
     return await reference.ref.getDownloadURL();
       
  }

  // Function to update user data in Firestore.
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updatedUser.id)
          .set(updatedUser.toJson());
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //Update any field in specific User collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update(json);
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Delete any field in specific User collection
  Future<void> removeSingleField(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
