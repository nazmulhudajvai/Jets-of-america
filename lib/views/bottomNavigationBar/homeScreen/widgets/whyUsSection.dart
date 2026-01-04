import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:jets_of_america/utils/appColors.dart';

class whyChooseUs_section extends StatelessWidget {
  const whyChooseUs_section({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0.w,
        vertical: 10.h,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Appcolors.tabBarIconColor),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0.h),
              child: Text(
                'Why Choose LUXEJET',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 20.h,
                  fontWeight: FontWeight.w700,
                  color: Appcolors.TitleTextColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(15.r),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Appcolors.icon_bg_color
                          .withOpacity(0.1.r),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/lux.svg',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Luxury Flight',
                          style: GoogleFonts.montserrat(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: Appcolors.TitleTextColor,
                          ),
                        ),
                        Text(
                          'Access to the finest private jets with \npremiumn amenities',
                          style: GoogleFonts.montserrat(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color:
                                Appcolors
                                    .TitleTextColor.withOpacity(
                                  0.8,
                                ),
                          ),
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: Row(
                children: [
                  Container(
                    
                    padding: EdgeInsets.all(15.r),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Appcolors.icon_bg_color
                          .withOpacity(0.1.r),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/person_icon.svg',height: 25.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          '24/7 Availability',
                          style: GoogleFonts.montserrat(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: Appcolors.TitleTextColor,
                          ),
                        ),
                        Text(
                          'Book flights anytime with instant \nconfirmation',
                          style: GoogleFonts.montserrat(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color:
                                Appcolors
                                    .TitleTextColor.withOpacity(
                                  0.8,
                                ),
                          ),
                          
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
