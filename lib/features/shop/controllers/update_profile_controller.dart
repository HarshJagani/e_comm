import 'package:e_comm_app/data/repositories/user_repository.dart';
import 'package:e_comm_app/features/authentication/controllers/network_manager.dart';
import 'package:e_comm_app/features/authentication/models/usermodel.dart';
import 'package:e_comm_app/features/personalization/controllers/user_controller.dart';
import 'package:e_comm_app/utils/constants/image_strings.dart';
import 'package:e_comm_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileController extends GetxController {

  //Initialization and variables.
  GlobalKey<FormState> updateUserDetailesKey = GlobalKey<FormState>();
  UpdateProfileController get instance => Get.find();
  bool isImageChange = false;
  XFile? userProfilePicture ;
  RxString? profilePictureUrl;
  final profileController = Get.put(UserController());
  final ImagePicker _picker = ImagePicker();
  final userRepository = UserRepository.instance;
  final firstName = TextEditingController(text: UserController.instance.user.value.firstName);
  final lastName = TextEditingController(text: UserController.instance.user.value.lastName);
  final userName = TextEditingController(text: UserController.instance.user.value.userName);
  final email = TextEditingController(text: UserController.instance.user.value.emailAddress);
  final phone = TextEditingController(text: UserController.instance.user.value.phoneNumber);
  


 //Function to update user detales.
  Future<void> updateUserData(UserModel userModel) async {
    //Start Loading
    ECFullScreenLoader.openLoadingDialog(
        'We are processing your information..', ECImageString.loadanimation);

    // Check Internet Connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      ECFullScreenLoader.stopLoading();
      return;
    }

    //Form Validation
    if (!updateUserDetailesKey.currentState!.validate()) {
      ECFullScreenLoader.stopLoading();
      return;
    }

   //Upload Profile Picture.
   if(isImageChange){
     try {
      dynamic imageUrl = await userRepository.uploadProfilePicture(userProfilePicture!);
      profilePictureUrl!.value = imageUrl;
      
    } catch (e){
       throw 'Somthing went wrong';
    }
    update();
   }

    //Update user detailes
    try {
      await userRepository.updateUserDetails(userModel);
    } catch (e) {
      throw 'Somthing went wrong';
    }

    //Fetch the updated user detailes from the database
    profileController.fetchuserRecord();

    // stops the loading
    ECFullScreenLoader.stopLoading();

    isImageChange = false;

    // rebuildes the ui when called
    update();
   
  }

  Future<void> updateUserImage () async {
   
    XFile? image;
    image = await _picker.pickImage(source: ImageSource.gallery);
   if(image != null){
    isImageChange = true;
     userProfilePicture = image;
   }
}

}