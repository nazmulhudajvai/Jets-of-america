import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jets_of_america/utils/appColors.dart';
import 'package:jets_of_america/views/bottomNavigationBar/homeScreen/inside_jets/jet_details.dart';

class Aircarft_Card extends StatelessWidget {


  final String ?aircarftName;
  final String ?aircarftImage;
  final String ?aircarftRange;
  final int ?aircarftPrice;
  final bool deal;
  const Aircarft_Card({
    super.key,   this.aircarftName ='Gulfstream G650',  this.aircarftImage ='assets/images/homePage/5.png',  this.aircarftRange='Ultra Long Range',  this.aircarftPrice=1700, this.deal=true
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: Container(
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Appcolors.iconColor),
        ),
        child: GestureDetector(
          onTap:() {
            Get.to(()=>JetDetails());
          },
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 150.h,
                      width: 200.w,
                      child: ClipRRect(
                        borderRadius:
                            BorderRadiusGeometry.circular(10.r),
                        child: Image.asset(
                          '$aircarftImage',
                          height: 130.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                   deal? Positioned(
                      top: 5.h,
                      right: 5.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.r,
                          vertical: 3.r,
                        ),
                        decoration: BoxDecoration(
                          color: Appcolors.TitleTextColor,
                          borderRadius: BorderRadius.circular(
                            5.r,
                          ),
                        ),
                        child:Text(
                           'Deal',
                          style: GoogleFonts.montserrat(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ):SizedBox(),
                  ],
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10.0.r,
                    left: 15.0.r,
                    right: 5.r
                  ),
                  child: Column(
                   
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$aircarftName',
                        style: GoogleFonts.montserrat(
                          fontSize: 18.sp,
                          color: Appcolors.TitleTextColor,
                          fontWeight: FontWeight.w700,
                        ),
                        overflow: TextOverflow.ellipsis,
                       
                      ),
                      SizedBox(height: 5.h), 
                      Text(
                        '$aircarftRange',
                        style: GoogleFonts.montserrat(
                          fontSize: 16.sp,
                          color: Appcolors.TitleTextColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 8.h), 
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        
                        children: [
                         
                        Text(
                        'From',
                        style: GoogleFonts.montserrat(
                          fontSize: 16.sp,
                          color: Appcolors.TitleTextColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                       
                          SizedBox(height: 15, child: Icon(Icons.arrow_forward,color: Appcolors.whiteColor.withOpacity(0.8),))
                        ],
                      ),
                     
                      SizedBox(height: 5.h), 
                      Text(
                        '\$${aircarftPrice}/hr ',
                        style: GoogleFonts.montserrat(
                          fontSize: 18.sp,
                          color: Appcolors.TitleTextColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          
            
            ],
          ),
        ),
      ),
    );
  }
}
