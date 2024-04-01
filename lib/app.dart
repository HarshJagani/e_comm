import 'package:e_comm_app/bindings/general_bindings.dart';
import 'package:e_comm_app/navigation_bar.dart';
import 'package:e_comm_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ECTheme.lightTheme,
      darkTheme: ECTheme.darkTheme,
      home: const NavigationMenu(),
      initialBinding: GeneralBindings(),
    );
  }
}