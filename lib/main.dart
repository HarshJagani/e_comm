import 'package:e_comm_app/app.dart';
import 'package:e_comm_app/data/repositories/authentication_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';

Future<void> main() async {

//Widget Binding
final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

// Initialize firebase & authentication repository
await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
  (FirebaseApp value) => Get.put(AuthenticationRepository()));
 
 // GetX local storage
await GetStorage.init();

FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding); // Keep the native splash screen until the app is opened at least once


  runApp(App());
}


