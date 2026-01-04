import 'package:get/get.dart';

class JetshareControler  extends GetxController{
  var selectedInd =0.obs;

  void changeTab(int index){
    selectedInd.value=index;  
  }
}