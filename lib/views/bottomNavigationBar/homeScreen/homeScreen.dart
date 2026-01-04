import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jets_of_america/utils/appColors.dart';
import 'package:jets_of_america/views/bottomNavigationBar/homeScreen/widgets/SearchAndDiscount.dart';
import 'package:jets_of_america/views/bottomNavigationBar/homeScreen/widgets/appBar.dart';
import 'package:jets_of_america/views/bottomNavigationBar/homeScreen/widgets/titleAndView.dart';
import 'package:jets_of_america/views/bottomNavigationBar/homeScreen/widgets/whyUsSection.dart';
import 'package:jets_of_america/widgets/aircarft_card.dart';
import 'package:jets_of_america/widgets/homeTabBar.dart';
import 'package:url_launcher/url_launcher.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

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
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Opacity(
                          opacity: 0.15,
                          child: Image.asset(
                            'assets/images/homePage/homehero.png',
                          ),
                        ),
                        Positioned(
                          top: 45.h,
                          left: 16.w,
                          child: Text(
                            'Luxury Travel for \nEveryone',
                            style: TextStyle(
                              fontFamily: 'AvenirNextLTPro',
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w700,
                              color: Appcolors.TitleTextColor,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 16.w,
                          bottom: 100.h,
                          child: Text(
                            'The World Without Borders',
                            style: GoogleFonts.montserrat(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Appcolors.TitleTextColor,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 16.w,
                          top: 10.h,
                          child: Container(
                            padding: EdgeInsets.all(10.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              color: Appcolors.TitleTextColor,
                            ),
                            child: GestureDetector(
                              onTap: () async {
                                final Uri uri =Uri(scheme: 'tel',path: '0123542222'
                                                                  );
                                try{
                                 await launchUrl(uri,mode: LaunchMode.externalApplication);
                                }catch(e){
                                  debugPrint('The error is : $e');
                                }
                              },
                              child: SvgPicture.asset(
                                'assets/icons/phone_logo.svg',
                                height: 35.h,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Transform.translate(
                      offset: Offset(0, -60.h),
                      child: Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 30.w,
                          child: HomeTabBar(),
                        ),
                      ),
                    ),
                    
                    SearchAndDiscountPart(),
                    SizedBox(height: 20.h),
                    TitleAndView(),
                    SizedBox(height: 25.h),
                    Aircarft_Card(),
                    SizedBox(height: 20.h),
                    Aircarft_Card(
                      aircarftImage: 'assets/images/planeDetails/6.png',
                      deal: false,
                    ),
                    SizedBox(height: 20.h),
                    Aircarft_Card(
                      aircarftImage: 'assets/images/homePage/4.png',
                    ),
                    SizedBox(height: 20.h),
                    Aircarft_Card(
                      aircarftImage: 'assets/images/planeDetails/6.png',
                      deal: false,
                    ),
                    SizedBox(height: 30.h),
                    whyChooseUs_section(),
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
