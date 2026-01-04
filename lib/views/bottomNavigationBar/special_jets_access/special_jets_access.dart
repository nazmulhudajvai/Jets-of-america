import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jets_of_america/utils/appColors.dart';
import 'package:jets_of_america/views/bottomNavigationBar/homeScreen/widgets/appBar.dart';
import 'package:jets_of_america/views/bottomNavigationBar/special_jets_access/widgets/smart_jet_access_card.dart';
 

class SpecialJetsAccess extends StatelessWidget {
  const SpecialJetsAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            C_AppBar(showjet: true, shownotification: true),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0.r,
                    vertical: 20.h,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 5.h,
                        ),
                        decoration: BoxDecoration(
                          color: Appcolors.loginForegroundColor.withOpacity(
                            0.3,
                          ),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10.r),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Appcolors.loginForegroundColor,
                              ),
                              child: SvgPicture.asset(
                                'assets/icons/lux.svg',
                                height: 25.sp,
                              ),
                            ),
                            SizedBox(width: 15.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Special Deals',
                                  style: GoogleFonts.playfairDisplay(
                                    fontSize: 24.sp,
                                    color: Appcolors.TitleTextColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'Save up to 75%',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 18.sp,
                                    color: Appcolors.TitleTextColor.withOpacity(
                                      0.7,
                                    ),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 15.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Appcolors.whiteColor),
                          borderRadius: BorderRadius.circular(10.r),
                          color: Appcolors.icon_bg_color.withOpacity(0.1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'What are Empty Leg Flights?',
                              style: GoogleFonts.montserrat(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: Appcolors.TitleTextColor,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              'Empty leg flights occur when a jet needs to reposition. Book these for the same luxury experience at up to 75% off regular rates. Limited availability!',
                              style: GoogleFonts.montserrat(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Appcolors.TitleTextColor.withOpacity(
                                  0.7,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h),
                      SmartJetAccessCard(
                        img: 'assets/images/homePage/3.png',
                        title: 'Gulfstream G700',
                        price: 2000,

                      ),
                      SizedBox(height: 15.h),
                      SmartJetAccessCard(
                        img: 'assets/images/homePage/5.png',
                        title: 'G60 GlovMaster',
                        price: 2500,

                      ),
                      SizedBox(height: 15.h),
                      SmartJetAccessCard(
                        img: 'assets/images/homePage/4.png',
                        title: 'Gulfstream G300',
                        price: 1300,

                      ),
                     
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
