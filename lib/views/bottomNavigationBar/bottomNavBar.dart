import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:jets_of_america/controllers/bottomNavBar/BottomNavControler.dart';
import 'package:jets_of_america/utils/appColors.dart';

class Bottomnavbar extends StatelessWidget {
  const Bottomnavbar({super.key});
  @override
  Widget build(BuildContext context) {
    final controler = Get.put(BottomnavigationbarCon());
        return Obx(
      () => Scaffold(
        backgroundColor: Colors.transparent,
        body: controler.allpages.elementAt(controler.selectedIndx.value),

        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor:  Colors.transparent,
            highlightColor:  Colors.transparent,
             
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.black,
            currentIndex: controler.selectedIndx.value,
            selectedItemColor: Appcolors.strokeLineColor,
            showUnselectedLabels: true,
            unselectedLabelStyle: TextStyle(fontSize:12.sp,color: Appcolors.UnselectedNavBarcolor),
            unselectedItemColor: Appcolors.UnselectedNavBarcolor,
            
          
            onTap: (value) {
              controler.selectedInd(value);
            },

            
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: CustomButton(iconPath: 'assets/icons/fly_icon.svg', index: 0, controler: controler),
                label: 'Book',
              ),
              BottomNavigationBarItem(
                icon: CustomButton(iconPath: 'assets/icons/book_icon.svg', index: 1, controler: controler),
                label: 'Smart Jet Access',
              ),
              BottomNavigationBarItem(
                icon: CustomButton(iconPath: 'assets/icons/person_icon.svg', index: 2, controler: controler),
                label: 'Jet Share',
              ),
              BottomNavigationBarItem(
                icon: CustomButton(iconPath: 'assets/icons/single_person.svg', index: 3, controler: controler),
                   label: 'Profile'
                ),
              
            
            ],
          ),
        ),
      ),
    );
  }
}


class CustomButton extends StatelessWidget {

final String iconPath;
final int index;
final BottomnavigationbarCon controler;
  const CustomButton({super.key, required this.iconPath, required this.index, required this.controler});
  

  @override
  Widget build(BuildContext context) {

    return Obx((){
     final isSelected= controler.selectedIndx.value==index;
    final iconcolor=isSelected?Appcolors.strokeLineColor:Appcolors.UnselectedNavBarcolor;
        if ( iconPath.endsWith('.svg')){
          return SizedBox(
            height: 20,
            child: SvgPicture.asset(iconPath,colorFilter: ColorFilter.mode(iconcolor, BlendMode.srcIn),height: 20),
          );
        }else{
          return SizedBox(
            height: 20,
            child:ColorFiltered(colorFilter: ColorFilter.mode(iconcolor, BlendMode.srcIn),child: Image.asset(iconPath,height: 20)),
          );
        }
      }
    );
  }
}