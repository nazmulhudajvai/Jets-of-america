import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jets_of_america/utils/appColors.dart';

class SmartJetAccessCard extends StatelessWidget {

  final String img;
  final String title;
  final int price;

  const SmartJetAccessCard({
    super.key,
     required this.img, required this.title, required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Appcolors.whiteColor.withOpacity(0.15),
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                  child: Image.asset(
                    img,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10.h,
                left: 10.w,
                child: Container(
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Appcolors.whiteColor,
                  ),
                  child: Text(
                    'Save 38%',
                    style: GoogleFonts.montserrat(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
    
          Padding(
            padding: EdgeInsetsGeometry.symmetric(
              vertical: 20.h,
              horizontal: 20.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Appcolors.TitleTextColor,
                  ),
                ),
                Text(
                  'Ultra Long Range',
                  style: GoogleFonts.montserrat(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w200,
                    color: Appcolors.TitleTextColor,
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Appcolors
                          .TitleTextColor.withOpacity(0.7),
                      size: 20.sp,
                    ),
                    SizedBox(width: 15.w),
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Route',
                          style: GoogleFonts.montserrat(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color:
                                Appcolors
                                    .TitleTextColor.withOpacity(
                                  0.7,
                                ),
                          ),
                        ),
    
                        Text(
                          'New York (TEB) → London (LHR)',
                          style: GoogleFonts.montserrat(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color:
                                Appcolors
                                    .TitleTextColor.withOpacity(
                                  0.7,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: Appcolors
                          .TitleTextColor.withOpacity(0.7),
                      size: 20.sp,
                    ),
                    SizedBox(width: 15.w),
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Departure',
                          style: GoogleFonts.montserrat(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color:
                                Appcolors
                                    .TitleTextColor.withOpacity(
                                  0.7,
                                ),
                          ),
                        ),
    
                        Text(
                          'Oct 25, 2025',
                          style: GoogleFonts.montserrat(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color:
                                Appcolors
                                    .TitleTextColor.withOpacity(
                                  0.7,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$40,000',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            decoration:
                                TextDecoration.lineThrough,
                            decorationColor:
                                Appcolors.TitleTextColor,
                            color:
                                Appcolors
                                    .TitleTextColor.withOpacity(
                                  0.9,
                                ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          '\$$price',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w700,
                            color: Appcolors.TitleTextColor,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'Total Price',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w200,
                            color: Appcolors.TitleTextColor,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        
                        Get.toNamed('/jetDetails');

                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            5.r,
                          ),
                          color: Appcolors.whiteColor,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Book Now',
                              style: GoogleFonts.montserrat(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: Appcolors.blackColor,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Icon(
                              Icons.arrow_forward,
                              size: 24.sp,
                              color: Appcolors.blackColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
    
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Capacity',
                          style: GoogleFonts.montserrat(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color:
                                Appcolors
                                    .TitleTextColor.withOpacity(
                                  0.7,
                                ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          '16 person',
                          style: GoogleFonts.montserrat(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: Appcolors.TitleTextColor,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Range',
                          style: GoogleFonts.montserrat(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color:
                                Appcolors
                                    .TitleTextColor.withOpacity(
                                  0.7,
                                ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          '7500 km',
                          style: GoogleFonts.montserrat(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: Appcolors.TitleTextColor,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Speed',
                          style: GoogleFonts.montserrat(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color:
                                Appcolors
                                    .TitleTextColor.withOpacity(
                                  0.7,
                                ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          '700 km/h',
                          style: GoogleFonts.montserrat(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: Appcolors.TitleTextColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

            
              ],
            ),
          ),
        ],
      ),
    );
  }
}
