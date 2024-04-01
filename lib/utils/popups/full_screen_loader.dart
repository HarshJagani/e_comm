import 'package:e_comm_app/common/loaders/animation_loader.dart';
import 'package:e_comm_app/utils/constants/colors.dart';
import 'package:e_comm_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ECFullScreenLoader {
  //open a full screen loading dialog with a given text and animation.
  //this method doesn't return anything.
  //parameters:
  //-text: the text to be displayed in the loading dialog.
  //-animation: the lottie animation to be shown.
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: ECHelperFunctions.isDarkMode(Get.context!)
              ? ECColors.dark
              : Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              ECAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

//Stop the currently open loading dialog.
//This method doesn't return anything.
  static stopLoading() {
    Navigator.of(Get.overlayContext!)
        .pop(); // close the dialog using navigator.
  }
}
