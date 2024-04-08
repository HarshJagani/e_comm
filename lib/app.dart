import 'package:e_comm_app/bindings/general_bindings.dart';
import 'package:e_comm_app/features/authentication/screens/login/login.dart';
import 'package:e_comm_app/navigation_bar.dart';
import 'package:e_comm_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class App extends StatelessWidget {
   App({super.key});
final deviceStorage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ECTheme.lightTheme,
      darkTheme: ECTheme.darkTheme,
      home:  deviceStorage.read('IsLoggedIn') != true ?  const LoginScreen() : const NavigationMenu(),
      initialBinding: GeneralBindings(),
    );
  }
}