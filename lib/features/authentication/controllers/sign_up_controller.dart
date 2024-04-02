import 'package:e_comm_app/data/repositories/authentication_repo.dart';
import 'package:e_comm_app/data/repositories/user_repository.dart';
import 'package:e_comm_app/features/authentication/controllers/network_manager.dart';
import 'package:e_comm_app/features/authentication/models/usermodel.dart';
import 'package:e_comm_app/features/authentication/screens/verify_email/email_varification.dart';
import 'package:e_comm_app/utils/constants/image_strings.dart';
import 'package:e_comm_app/utils/loaders/loader.dart';
import 'package:e_comm_app/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //Variables
  final email = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();
  final lastname = TextEditingController();
  final firstname = TextEditingController();
  final phonenumber = TextEditingController();
  GlobalKey<FormState> signupformkey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      //Start Loading
      ECFullScreenLoader.openLoadingDialog(
          'We are processing your information..', ECImageString.loadanimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      //Form Validation
      if (!signupformkey.currentState!.validate()) return;

      // Privacy  Policy and Terms of Service should be checked here

      //Register user in firebase authentication and save user data in firebase.
      final UserCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save Authenticated user data in the firebase fireStore
      final newUser = UserModel(
          id: UserCredential.user!.uid,
          firstName: firstname.text.trim(),
          lastName: lastname.text.trim(),
          userName: username.text.trim(),
          phoneNumber: phonenumber.text.trim(),
          emailAddress:email.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);

      //Show Success Message
      ECLoader.successSnackBar(title: 'Success!', message: "Your account has been created. Varify email to continue.");

      //Move to verify email screen.
      Get.to(() => const EmailVerification());
      
    } catch (e) {
      ECLoader.errorSnackBar(title: 'Oh Snap !', message: e.toString());
    } 
  
  }
}
