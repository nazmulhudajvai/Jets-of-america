import 'package:get/get.dart';

class ProfileControler extends GetxController {


var selectedInd =0.obs;
 
void changeTab( int index){
  selectedInd.value=index;
}


}