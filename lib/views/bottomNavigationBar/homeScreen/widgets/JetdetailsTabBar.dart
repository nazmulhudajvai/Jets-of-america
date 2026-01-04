import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jets_of_america/controllers/homeScreen/jet_details_tab_Controler.dart';
import 'package:jets_of_america/utils/appColors.dart';

class JetDetailsTabBar extends GetView<TabBarController>{
  JetDetailsTabBar({super.key});
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               _buildTabBar(),
              
              const SizedBox(height: 20),
              
               _buildTabContent(),
            ],
          ),
        ),
      ),
    );
  }
  
   Widget _buildTabBar() {
    return Container(
      decoration: BoxDecoration(
        color:   Appcolors.blackColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: List.generate(
          controller.tabsData.length,
          (index) => Expanded(
             child: Obx(
              () => _buildTabButton(
                title: controller.tabsData[index]['title']!,
                isSelected: controller.selectedIndex == index,
                onTap: () => controller.changeTab(index),
              ),
            ),
          ),
        ),
      ),
    );
  }

    Widget _buildTabButton({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        decoration: BoxDecoration(
           color: isSelected ? Appcolors.whiteColor : Colors.transparent,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
             color: isSelected ? Appcolors.blackColor: Appcolors.whiteColor,
             fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      constraints: const BoxConstraints(minHeight: 150),
      decoration: BoxDecoration(
        color:   Appcolors.blackColor, 
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Obx(
        () => AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
           child: Text(
            controller.currentTabContent,
            key: ValueKey<String>(controller.currentTabContent),
            style:  GoogleFonts.montserrat(
              color: Appcolors.whiteColor,
              fontSize: 16.sp,
              height: 1.5.h,
            ),
          ),
        ),
      ),
    );
  }
}