import 'package:e_comm_app/data/repositories/authentication_repo.dart';
import 'package:e_comm_app/features/authentication/controllers/network_manager.dart';
import 'package:e_comm_app/utils/constants/image_strings.dart';
import 'package:e_comm_app/utils/loaders/loader.dart';
import 'package:e_comm_app/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormkey = GlobalKey<FormState>();

  Future<void> emailAndPasswordSignIn() async {
    try {
      //Start Loading..
      ECFullScreenLoader.openLoadingDialog(
          'Please wait..', ECImageString.appLogo);

      //check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        ECFullScreenLoader.stopLoading();
        return;
      }

      //Form validation
      if (!loginFormkey.currentState!.validate()) {
        ECFullScreenLoader.stopLoading();
        return;
      }

      //Login user using email and password authentication
      await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //Remove Loader
      ECFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } on FirebaseAuthException catch (e) {
        ECFullScreenLoader.stopLoading();
      return ECLoader.errorSnackBar(title: e.code.toString().toUpperCase());
    }
  
    
  }
}
