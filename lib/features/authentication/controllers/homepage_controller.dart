import 'package:get/get.dart';

class CheckHomePageController extends GetxController {
  static CheckHomePageController get instance => Get.find();
  RxBool isHomePage = true.obs;
}