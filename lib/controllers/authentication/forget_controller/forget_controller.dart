import 'package:get/get.dart';

class ForgotController extends GetxController {
  var useEmail = true.obs;

  void toggleMethod() {
    useEmail.value = !useEmail.value;
  }
}
