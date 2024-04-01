import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CarouselControllerCommon extends GetxController {
  static CarouselControllerCommon get instance => Get.find();
  final pageController = PageController();
  final carouselController = CarouselController();
  final carouselCurrentPage = 0.obs;

  void updatePageIndicator(index){
    carouselCurrentPage.value = index;
  }
}