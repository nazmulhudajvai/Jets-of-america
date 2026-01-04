import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jets_of_america/utils/appColors.dart' show Appcolors;
import 'package:jets_of_america/views/bottomNavigationBar/homeScreen/inside_jets/all_aircraft.dart';

class TitleAndView extends StatelessWidget {
  const TitleAndView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.0.sp),
      child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Featured Aircraft',style: GoogleFonts.playfairDisplay(fontSize: 22.sp,fontWeight: FontWeight.w700,color: Appcolors.TitleTextColor),),
          InkWell(onTap: () {
            Get.to(()=> AllAircraft());
            debugPrint('View all Aircruft');
          }, child: Text('View All',style: GoogleFonts.montserrat(fontSize: 16.sp,fontWeight: FontWeight.w400,color: Appcolors.TitleTextColor),)),
        
        ],
      ),
    );
  }
}