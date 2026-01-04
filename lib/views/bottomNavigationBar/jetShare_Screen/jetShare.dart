import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jets_of_america/controllers/jetShare/jetshare_controler.dart';
import 'package:jets_of_america/utils/appColors.dart';
import 'package:jets_of_america/views/bottomNavigationBar/homeScreen/widgets/appBar.dart';
import 'package:jets_of_america/views/bottomNavigationBar/jetShare_Screen/widgets/jetShare_allFlight.dart';
import 'package:jets_of_america/views/bottomNavigationBar/special_jets_access/widgets/smart_jet_access_card.dart';

class Jetshare extends StatelessWidget {
  final controler = Get.put(JetshareControler());

  Jetshare({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx(
        () => SafeArea(
          child: Column(
            children: [
              C_AppBar(showjet: true, shownotification: true),
              SizedBox(height: 20.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Appcolors.iconColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildTabbutton('All Flight', 0),
                      buildTabbutton('High Saving', 1),
                      buildTabbutton('Departing Soon', 2),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),


              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    child: Column(
                      children: [

              Padding(
                padding: const EdgeInsets.symmetric( horizontal: 0.0),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 6.w),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Appcolors.whiteColor),
                    color: Appcolors.iconColor,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/down.svg', height: 30.sp),
                      SizedBox(width: 15.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'How Jet Share Works',
                            style: GoogleFonts.montserrat(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: Appcolors.whiteColor,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          SizedBox(
                            width: 350.w,
                            child: Text(
                              'The more passengers, the less you pay.Join other travelers on empty leg flights. The more passengers, the less you pay.',
                              style: GoogleFonts.montserrat(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Appcolors.whiteColor,
                              ),
                              maxLines: 3,
                              
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.h),


                        if (controler.selectedInd.value == 0) ...[
                          allFlight(),
                        ] else if (controler.selectedInd.value == 1) ...[
                          allFlight1(),
                        ] else if (controler.selectedInd.value == 2) ...[
                          allFlight2(),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabbutton(String text, int index) {
    bool isSelected = controler.selectedInd.value == index;
    return GestureDetector(
      onTap: () => controler.changeTab(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: isSelected ? Colors.white : Colors.transparent,
        ),
        child: Text(
          text,
          style: GoogleFonts.montserrat(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }

  allFlight() {
    return Column(
      children: [
        jetShareAllFlightCard(
          img: 'assets/images/homePage/4.png',
          title: 'Delta 2',
          price: 1500,
          seat: 5,
        ),
        jetShareAllFlightCard(
          img: 'assets/images/homePage/5.png',
          title: 'Delta 3',
          price: 1500,
          seat: 10,
        ),
        jetShareAllFlightCard(
          img: 'assets/images/homePage/3.png',
          title: 'Gulfstrem 500',
          price: 1500,
          seat: 15,
        ),
      ],
    );
  }
  allFlight1() {
    return Column(
      children: [
        jetShareAllFlightCard(
          img: 'assets/images/homePage/3.png',
          title: 'Delta 2',
          price: 1500,
          seat: 5,
        ),
        jetShareAllFlightCard(
          img: 'assets/images/homePage/4.png',
          title: 'Delta 3',
          price: 1500,
          seat: 10,
        ),
        jetShareAllFlightCard(
          img: 'assets/images/homePage/5.png',
          title: 'Gulfstrem 500',
          price: 1500,
          seat: 15,
        ),
      ],
    );
  }
  allFlight2() {
    return Column(
      children: [
        jetShareAllFlightCard(
          img: 'assets/images/homePage/4.png',
          title: 'Delta 2',
          price: 1500,
          seat: 5,
        ),
        jetShareAllFlightCard(
          img: 'assets/images/homePage/5.png',
          title: 'Delta 3',
          price: 1500,
          seat: 10,
        ),
        jetShareAllFlightCard(
          img: 'assets/images/homePage/3.png',
          title: 'Gulfstrem 500',
          price: 1500,
          seat: 15,
        ),
      ],
    );
  }

  // highSaving() {
  //   return Column(
  //     children: [
  //       Text('this is high saving tab 1 '),
  //       Text('this is high saving tab 2 '),
  //       Text('this is high saving tab 3 '),
  //     ],
  //   );
  // }

  // departingSoon() {
  //   return Column(
  //     children: [
  //       Text('this is departing soon tab 1 '),
  //       Text('this is departing soon tab 2 '),
  //       Text('this is departing soon tab 3 '),
  //     ],
  //   );
  // }
}
