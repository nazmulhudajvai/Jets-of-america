import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jets_of_america/utils/appColors.dart';

class jetShareAllFlightCard extends StatelessWidget {
  const jetShareAllFlightCard({
    super.key,
    required this.title,
    required this.img,
    required this.price,
    required this.seat,
  });
  final String title;
  final String img;
  final int price;
  final int seat;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Appcolors.whiteColor.withOpacity(0.15)),
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
                  child: Image.asset(img, fit: BoxFit.cover),
                ),
              ),
              Positioned(
                top: 10.h,
                right: 10.w,
                child: Container(
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Appcolors.green,
                  ),
                  child: Text(
                    'Save 38%',
                    style: GoogleFonts.montserrat(
                      fontSize: 12.sp,
                      color: Appcolors.whiteColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10.h,
                left: 10.w,
                child: Container(
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Appcolors.whiteColor,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/person_icon.svg',
                        height: 16.h,
                      ),
                      Text(
                        ' $seat Seat',
                        style: GoogleFonts.montserrat(
                          fontSize: 14.sp,
                          color: Appcolors.blackColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 10.h,
                bottom: 10.h,
                child: Container(
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.montserrat(
                          fontSize: 22.sp,
                          color: Appcolors.whiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Light Weight',
                        style: GoogleFonts.montserrat(
                          fontSize: 14.sp,
                          color: Appcolors.whiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
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
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Appcolors.whiteColor,
                      size: 20.h,
                    ),

                    Text(
                      ' New York (TEB)',
                      style: GoogleFonts.montserrat(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Appcolors.TitleTextColor,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    SvgPicture.asset(
                      'assets/icons/airplan.svg',
                      color: Appcolors.whiteColor,
                      height: 20.h,
                    ),
                    Text(
                      ' London (LHR)',
                      style: GoogleFonts.montserrat(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Appcolors.TitleTextColor,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 15.h),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: Appcolors.TitleTextColor,
                      size: 20.sp,
                    ),
                    Text(
                      ' Oct 25, 2025',
                      style: GoogleFonts.montserrat(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Appcolors.TitleTextColor,
                      ),
                    ),
                    SizedBox(width: 15.h),
                    Icon(
                      Icons.watch_later_outlined,
                      color: Appcolors.TitleTextColor,
                      size: 20.sp,
                    ),
                    Text(
                      ' 02.00 PM ',
                      style: GoogleFonts.montserrat(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Appcolors.TitleTextColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' 6/$seat Seats avilable',
                      style: GoogleFonts.montserrat(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Appcolors.TitleTextColor,
                      ),
                    ),
                    Text(
                      ' 30% Booking',
                      style: GoogleFonts.montserrat(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Appcolors.TitleTextColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                LinearProgressIndicator(
                  value: 0.3,
                  backgroundColor: Appcolors.iconColor,
                  valueColor: AlwaysStoppedAnimation(Appcolors.whiteColor),
                  borderRadius: BorderRadius.circular(10.r),
                  minHeight: 10.h,
                ),
                SizedBox(height: 15.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price per person',
                          style: GoogleFonts.montserrat(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Appcolors.TitleTextColor,
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
                          '\$40,000',
                          style: GoogleFonts.montserrat(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Appcolors.TitleTextColor,
                            color: Appcolors.TitleTextColor.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: Appcolors.whiteColor,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Book Flight',
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
