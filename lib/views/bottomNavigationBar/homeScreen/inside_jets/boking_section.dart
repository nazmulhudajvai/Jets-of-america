
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:jets_of_america/utils/appColors.dart';

class booking_Section extends StatelessWidget {
  const booking_Section({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     width: double.infinity,
     padding: EdgeInsets.all(16),
     decoration: BoxDecoration(
       border: Border(top: BorderSide(color: Appcolors.whiteColor)),
       borderRadius: BorderRadius.circular(10.r)),
       
       child: Column(
         children: [
           Row(
             children: [
               Expanded(
                 child: SizedBox(
                   child:Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('Starting from',style: GoogleFonts.montserrat(
                         fontSize: 14.sp,
                         fontWeight: FontWeight.w400,
                         color: Appcolors.UnselectedNavBarcolor
                       )),SizedBox(height: 2.sp),
                       Text('\$10,000/hr',style: GoogleFonts.playfairDisplay(
                         fontSize: 24.sp,
                         fontWeight: FontWeight.w700,
                         color: Appcolors.whiteColor
                       )),
                     ],
                   ),
                 ),
               ),
               Expanded(
                 child: Container(
                   padding: EdgeInsets.symmetric(vertical: 20.h),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(5.sp),
                     color: Appcolors.whiteColor,
                     
                   ),
                   child: Center(child: Text('Book Now',style: GoogleFonts.montserrat(fontSize: 16.sp,fontWeight: FontWeight.w600))),
                 ),
               )
             ],
           ),
    
           SizedBox(height: 30.h),
          Container( 
           width: double.infinity,
           padding: EdgeInsets.all(10.sp),
           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.sp),border: Border.all(color: Appcolors.whiteColor)),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
           Text('Empty Leg Deal',style: GoogleFonts.montserrat(
             fontSize: 14.sp,
             fontWeight: FontWeight.w400,
             color: Appcolors.UnselectedNavBarcolor
           )),
           Padding(
             padding: EdgeInsets.symmetric( vertical: 8.0.r),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('\$25,000',style: GoogleFonts.playfairDisplay(
                   fontSize: 20.sp,
                   fontWeight: FontWeight.w600,
                   color: Appcolors.whiteColor
                 )),
    
                 Icon(Icons.arrow_forward_ios,color: Appcolors.homeTabBar,size:22.sp,)
               ],
             ),
           ),
           Text('New York (TEB) → London (LHR)',style: GoogleFonts.montserrat(
             fontSize: 14.sp,
             fontWeight: FontWeight.w400,
             color: Appcolors.UnselectedNavBarcolor
           ))
         ])
          )
         ],
       )
    );
  }
}