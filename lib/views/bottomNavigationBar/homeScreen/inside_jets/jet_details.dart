import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jets_of_america/controllers/homeScreen/jetDetails_controler.dart';
import 'package:jets_of_america/controllers/homeScreen/jet_details_tab_Controler.dart';
import 'package:jets_of_america/utils/appColors.dart';
import 'package:jets_of_america/views/bottomNavigationBar/homeScreen/inside_jets/boking_section.dart';
import 'package:jets_of_america/views/bottomNavigationBar/homeScreen/inside_jets/specification_card.dart';
import 'package:jets_of_america/views/bottomNavigationBar/homeScreen/widgets/JetdetailsTabBar.dart';
import 'package:jets_of_america/views/bottomNavigationBar/homeScreen/widgets/appBar.dart';
 
class JetDetails extends StatelessWidget {
  JetDetails({super.key});
  final JetdetailsControler Imagecontroler = Get.put(JetdetailsControler());
  @override
  Widget build(BuildContext context) {
    Get.put(TabBarController());
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              C_AppBar(showjet: false, shownotification: false),
            Obx(
              ()=> SizedBox(
                width: double.infinity,
                height: 320.h,
                child: Stack(
                  children: [
                    Image.asset(
                      Imagecontroler.selectedImage.value,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 320.h,
                      errorBuilder: (context, error, stackTrace) {
                       return Text('There is no Image , Check you image list');
                      },
                    ),
          
                    Positioned(
                      right: 10.w,
                      top: 10.h,
                      child: Container( padding:EdgeInsets.all(5.r) ,decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),color: Appcolors.TitleTextColor
                      ), child: Text('Special Deal Available ',style: GoogleFonts.montserrat(fontSize: 12.sp,fontWeight: FontWeight.w500),)),
                    )
              
                    
              
                  ],
                ),
              ),
            )
            ,
            SizedBox(height: 30),
             Padding(
               padding:   EdgeInsets.symmetric(horizontal: 16.0.w),
               child: Transform.translate(
                offset: Offset(0, -32),
                 child: SizedBox(
                  height: 90.h,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                    final imagepath=Imagecontroler.images[index];
                    return _buildThumbnailImage(imagepath);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: Imagecontroler.images.length),
                 ),
               ),
             ),
            //  SizedBox(height: 20.h),
             Padding(
               padding:  EdgeInsets.all(16.0.w),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text('Gulfstream G650',style: GoogleFonts.playfairDisplay(fontSize: 26.sp,fontWeight: FontWeight.w700,color: Appcolors.TitleTextColor)),
                  SizedBox(height: 5.h),
                   Text('Ultra long Range',style: GoogleFonts.montserrat(fontSize: 18.sp,fontWeight: FontWeight.w400,color: Appcolors.TitleTextColor.withOpacity(0.5))),
                 SizedBox(height: 10.sp),
                
                Row(
                  children: [
                 jet_details_specification_card(iconpath: 'assets/icons/person_icon.svg', title: 'Capacity', capacity: '16'),
                 SizedBox(width: 10.w),
                 jet_details_specification_card(iconpath: 'assets/icons/world.svg', title: 'Range', capacity: '7000 km'),
                 SizedBox(width: 10.w),
                 jet_details_specification_card(iconpath: 'assets/icons/airplan.svg', title: 'Crew', capacity: '2 pilots')
                  ],
                ),
                 ],
               ),
             ),
             SizedBox(height: 300.h, child: JetDetailsTabBar()),

             
             booking_Section(),

            ],
          ),
        ),
      ),
    );
  }
//this is small image of jet planes ..

  Widget _buildThumbnailImage(Imagepath) {
    return Obx(
      () => GestureDetector(
        onTap: () => Imagecontroler.setselectedImage(Imagepath),
        child: Container(
          height: 80.h,
          width: 100.w,
          margin: EdgeInsets.symmetric(horizontal:5.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            border: Imagecontroler.selectedImage.value == Imagepath
                ? Border.all(color: Appcolors.selectedImage)
                : Border.all(color: Colors.transparent),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.r),
            child: Image.asset(Imagepath, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}




