import 'package:get/get.dart';
import 'package:jets_of_america/controllers/authentication/loginControler/login_Controler.dart';
import 'package:jets_of_america/controllers/homeScreen/homeControler.dart';

class AllBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(LoginController());
    Get.put(HomeControler());
    
  }
}