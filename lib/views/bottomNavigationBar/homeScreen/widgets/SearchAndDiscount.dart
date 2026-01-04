import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jets_of_america/utils/appColors.dart';
import 'package:flutter/material.dart';

class SearchAndDiscountPart extends StatelessWidget {
  const SearchAndDiscountPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -30),
      child: Padding(
        padding:   EdgeInsets.symmetric(horizontal: 16.0.r),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.sp,horizontal: 20.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: Appcolors.browsePlaneDorder)
                ),
                child: Column(
                  children: [
                    // Image.asset('assets/icons/srchIcon.png',height: 20.h),
                    // SvgPicture.asset('assets/icons/seachIcon.svg',height:20,color: Appcolors.whiteColor, ),
                   Icon(Icons.search_outlined,color: Appcolors.whiteColor,),
                    SizedBox(height: 10.h),
                    Text('Browse Flight',style: GoogleFonts.montserrat(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: Appcolors.TitleTextColor
                    ))
                                
                  ],
                ),
              ),
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: Container(
               padding: EdgeInsets.symmetric(vertical: 20.sp,horizontal: 20.sp),
              
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: Appcolors.browsePlaneDorder)
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color:Appcolors.whiteColor
                      ),
                      child: Text('Save 80%',style: GoogleFonts.montserrat(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: Appcolors.blackColor
                      )),
                    ),
                    SizedBox(height: 10.h),
                    Text('Special Deals',style: GoogleFonts.montserrat(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: Appcolors.TitleTextColor
                    ))
                                
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}