import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jets_of_america/utils/appColors.dart';
import 'package:jets_of_america/views/bottomNavigationBar/homeScreen/widgets/appBar.dart';
import 'package:jets_of_america/widgets/all_aircraft_card.dart';

class AllAircraft extends StatelessWidget {
  const AllAircraft({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            C_AppBar(showjet: true, shownotification: true),
            SizedBox(height: 15.h),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                
                      Container(
                        decoration: BoxDecoration(
                          color: Appcolors.loginForegroundColor,
                          borderRadius: BorderRadius.circular(10.r)
                      
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(10.0.r),
                          child: TextField(
                            cursorColor: Appcolors.whiteColor,
                            style: GoogleFonts.montserrat(color: Appcolors.whiteColor),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search,color: Appcolors.whiteColor,),
                              hintText: 'Search jets...',
                              hintStyle: GoogleFonts.montserrat(
                              fontSize: 20.sp,
                              color: Appcolors.whiteColor
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              suffixIcon: Icon(Icons.filter_list_rounded,color:Appcolors.whiteColor)
                            ),
                          
                            
                          ),
                        ),
                      ),
                
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(' 6 Aircarts found',style: GoogleFonts.montserrat(
                          color: Appcolors.whiteColor,
                        
                          fontSize: 14.sp
                          
                        )),
                      ),
                      SizedBox(height: 12.h),
                      AllAircraftCard(img: 'assets/images/homePage/3.png', title: 'Mark 2', price: 2050),
                      SizedBox(height:10.h),
                      AllAircraftCard(img: 'assets/images/planeDetails/6.png', title: 'Gulfstorm 230f', price: 1850),
                      SizedBox(height:10.h),
                      AllAircraftCard(img: 'assets/images/homePage/4.png', title: 'Globmaster 2500', price: 1000),
                      SizedBox(height:10.h),
                      AllAircraftCard(img: 'assets/images/homePage/5.png', title: 'Globmaster', price: 1050),
                      SizedBox(height:10.h),
                      AllAircraftCard(img: 'assets/images/homePage/3.png', title: 'Mark 5', price:1250),
                      SizedBox(height:10.h),
                      AllAircraftCard(img: 'assets/images/planeDetails/6.png', title: 'Globm', price: 1050)
                    ],
                
                    
                  ),
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
}