
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm_app/features/authentication/models/productmodel.dart';
import 'package:e_comm_app/features/authentication/models/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

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

//Function to fetch user detailes  from the fire base using  id
  Future<UserModel?> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db.collection("Users").doc(FirebaseAuth.instance.currentUser?.uid).get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } catch (e) {
      return null;
    }
  }

  // Function to update user data in Firestore.
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db.collection("Users").doc(updatedUser.id).set(updatedUser.toJson());
      print(updatedUser.id);
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //Update any field in specific User collection
  Future<void> updateSingleField(Map<String ,dynamic > json) async {
    try {
      await _db.collection("Users").doc(FirebaseAuth.instance.currentUser?.uid).update(json);
      }catch(e){
         throw 'Something went wrong. Please try again';
    }
  }

   // Delete any field in specific User collection
  Future<void> removeSingleField(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
      }catch(e){
         throw 'Something went wrong. Please try again';
    }
  }
}
