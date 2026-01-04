import 'package:get/get.dart';

class JetdetailsControler extends GetxController {
  final List images=[
    'assets/images/homePage/5.png',
    'assets/images/homePage/homehero.png',
    'assets/images/planeDetails/6.png',
    'assets/images/planeDetails/1.png'
  ];
  final selectedImage=''.obs;
  @override
  void onInit() {
     super.onInit();
     if(images.isNotEmpty){
      selectedImage.value=images.first;
     }
  }
  void setselectedImage(String imagePath){
    selectedImage.value=imagePath;
  }
}