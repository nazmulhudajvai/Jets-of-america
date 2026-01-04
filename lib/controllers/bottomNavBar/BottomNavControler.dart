import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jets_of_america/views/bottomNavigationBar/homeScreen/homeScreen.dart';
import 'package:jets_of_america/views/bottomNavigationBar/jetShare_Screen/jetShare.dart';
import 'package:jets_of_america/views/bottomNavigationBar/profile_screen/profile.dart';
import 'package:jets_of_america/views/bottomNavigationBar/special_jets_access/special_jets_access.dart';

class BottomnavigationbarCon extends GetxController {

var selectedIndx=0.obs;
final List allpages=<Widget>[
Homescreen(),
SpecialJetsAccess(),
Jetshare(),
Profile()
];

void selectedInd(value){
selectedIndx.value=value;
}

}