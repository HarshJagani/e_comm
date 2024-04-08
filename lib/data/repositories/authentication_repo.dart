import 'package:e_comm_app/features/authentication/screens/login/login.dart';
import 'package:e_comm_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_comm_app/navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

//Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  get get => null;

// Set authentication user data
//User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    // screenRedirect();
  }

  //Function to show relevant screen
  screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
      // If user is logged in
      if (user.emailVerified) {
        Get.off(() => const NavigationMenu());
      } else {
        // If user's email is not verified, navigate to the main navigation menu
        Get.offAll(() => const NavigationMenu());
      }
    } else {
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() =>
              const LoginScreen()) // Redirect to Login Screen if not first time
          : Get.offAll(() =>
              const OnBoardingScreen()); // Redirect to onboarding  screen if it's the user's first time.
    }
  }

  //To check if user is loggedin or not
  checkLoginStatus() {
    deviceStorage.writeIfNull('IsLoggedIn', false);
    if (_auth.currentUser != null) {
      deviceStorage.write('IsLoggedIn', true);
    } 
  }

  //EmailPass - Registration
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  //Login with email and password
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }
}
