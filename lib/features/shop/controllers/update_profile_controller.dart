import 'package:e_comm_app/data/repositories/user_repository.dart';
import 'package:e_comm_app/features/authentication/controllers/network_manager.dart';
import 'package:e_comm_app/features/authentication/models/usermodel.dart';
import 'package:e_comm_app/features/personalization/controllers/user_controller.dart';
import 'package:e_comm_app/utils/constants/image_strings.dart';
import 'package:e_comm_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileController extends GetxController {
  UpdateProfileController get instance => Get.find();
  final userRepository = UserRepository.instance;
  final firstName = TextEditingController(
      text: UserController.instance.user.value.firstName);
  final lastName = TextEditingController(
      text: UserController.instance.user.value.lastName);
  final username = TextEditingController(
      text: UserController.instance.user.value.userName);
  final email = TextEditingController(
      text: UserController.instance.user.value.emailAddress);
  final phone = TextEditingController(
      text: UserController.instance.user.value.phoneNumber);
  GlobalKey<FormState> updateUserDetailesKey = GlobalKey<FormState>();
  final profileController = Get.put(UserController());
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

    //Update user detailes
    try {
      await userRepository.updateUserDetails(userModel);
    } catch (e) {
      throw 'Somthing went wrong';
    }

    ECFullScreenLoader.stopLoading();
  }
}
