
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jets_of_america/utils/appColors.dart';

class jet_details_specification_card extends StatelessWidget {
  const jet_details_specification_card({
    super.key, required this.iconpath, required this.title,required this.capacity,
  });

final String iconpath;
final String title;
final String capacity;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 126.w,
     padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 22.w),
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(5.r),
       color: Appcolors.iconColor,
       
     ),
     child: Column(
       children: [
         SvgPicture.asset(iconpath,color: Appcolors.UnselectedNavBarcolor,height: 22),
        SizedBox(height: 3.sp),
         Text(title,style: GoogleFonts.montserrat(
           fontSize: 16.sp,
           fontWeight: FontWeight.w500,
           color: Appcolors.homeTabBar.withOpacity(0.6)
    
         )),SizedBox(height: 5.h),
         Text(capacity,style: GoogleFonts.montserrat(
           fontSize: 16.sp,
           fontWeight: FontWeight.w400,
           color: Appcolors.UnselectedNavBarcolor
    
         ))
       ],
     ),
    );
  }
}
