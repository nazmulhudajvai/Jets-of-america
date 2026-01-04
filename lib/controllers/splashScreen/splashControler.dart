import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jets_of_america/views/authenticaionPages/loginPages/loginScreen.dart';

class SplashControler extends GetxController
    with GetSingleTickerProviderStateMixin {

  final double rectWidth = 250.0;
  final double rectHeight = 400.0;

  RxBool slideUp = false.obs;

  @override
  void onInit() {
    super.onInit();

    /// Wait → slide splash up
    Future.delayed(const Duration(milliseconds: 2000), () {
      slideUp.value = true;
    });

    /// After animation → navigate
    Future.delayed(const Duration(milliseconds: 3200), () {
      Get.off(() => Loginscreen());
    });
  }
}
