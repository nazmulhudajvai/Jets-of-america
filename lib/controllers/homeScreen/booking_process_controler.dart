import 'package:get/get.dart';

class FlightController extends GetxController {
  var currentStep = 0.obs;

  // form data
  var fromTo = ''.obs;
  var dateRange = ''.obs;
  var passenger = ''.obs;
  var travelerType = ''.obs;

  void nextStep() {
    if (currentStep.value < 3) {
      currentStep.value++;
    }
  }

  void prevStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }
}
