import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {


  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isPasswordVisible = false.obs;
  var isLoading = false.obs;

  void togglePassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Error", "Email and password are required");
      return;
    }

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 1)); // fake API

    isLoading.value = false;

    Get.offNamed("/homeScreen");
  }
}
