import 'package:e_comm_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ECLoader {

  static warningSnackBar({required title, message = ''}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      icon: Icon(Icons.warning_amber_rounded, color: ECColors.light),
      colorText: Colors.white,
      backgroundColor: Colors.orange.shade300,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
    );
  }
  static errorSnackBar({required title, message = ''}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      icon: Icon(Icons.error_outline_sharp, color: ECColors.light),
      colorText: Colors.white,
      backgroundColor: Colors.red.shade400,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
    );
  }

   static successSnackBar({required title, message = ''}){
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      icon: Icon(Icons.check_circle_sharp, color: ECColors.light),
      colorText: Colors.white,
      backgroundColor: Colors.blue,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
    );
  }

}