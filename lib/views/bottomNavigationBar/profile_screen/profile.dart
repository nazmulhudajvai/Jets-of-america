import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jets_of_america/controllers/profileScreen/profile_controler.dart';
import 'package:jets_of_america/utils/appColors.dart';
import 'package:jets_of_america/views/bottomNavigationBar/homeScreen/widgets/appBar.dart';
import 'package:jets_of_america/views/bottomNavigationBar/profile_screen/editprofile/editprofile.dart';
import 'package:jets_of_america/views/bottomNavigationBar/profile_screen/paymentmethods/payment_methods.dart';
import 'package:jets_of_america/views/bottomNavigationBar/profile_screen/settings/settings.dart';

import '../../authenticaionPages/loginPages/loginScreen.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  final controler = Get.put(ProfileControler());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      body: SafeArea(
        child: Column(
          children: [


            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Appcolors.splashBackground,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Appcolors.iconColor),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 50.r,
                                backgroundColor: const Color(0xFF2A2D3A),
                                child: SvgPicture.asset(
                                  'assets/icons/single_person.svg',
                                  color: Appcolors.whiteColor,
                                  height: 45.h,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'James Anderson',
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Appcolors.whiteColor,
                                ),
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          _InfoRow(
                            icon: Icons.email,
                            text: 'james.anderson@email.com',
                          ),
                          SizedBox(height: 6),
                          _InfoRow(
                            icon: Icons.phone,
                            text: '+1 (555) 123-4567',
                          ),
                          SizedBox(height: 6),
                          _InfoRow(
                            icon: Icons.calendar_today,
                            text: '7 January 2005',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Stats
                    Row(
                      children: const [
                        Expanded(
                          child: _StatCard(value: '2', label: 'Total Flight'),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _StatCard(value: '0', label: 'Upcoming'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Menu
                    _MenuTile(icon: Icons.edit, title: 'Edit Profile',ontap: () {
                      Get.to(EditProfileScreen());
                      print('this is edit page ');
                    },),
                    const SizedBox(height: 10),
                    _MenuTile(
                      ontap: () {
                        Get.to(PaymentMethods());
                      },
                      icon: Icons.credit_card_outlined,
                      title: 'Payment Methods',
                    ),
                    const SizedBox(height: 10),
                    _MenuTile(icon: Icons.settings, title: 'Settings',ontap: () {

                      Get.to(SettingsPage());
                    },),
                    const SizedBox(height: 10),
                    _MenuTile(
                      ontap: () {Get.off(() => Loginscreen(), transition: Transition.fade);
                      },
                      icon: Icons.logout,
                      title: 'Log Out',
                      color: Colors.redAccent,
                    ),

                    const SizedBox(height: 16),

                    SizedBox(
                      child: Obx(
                        () => Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Appcolors.browsePlaneDorder,
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(color: Appcolors.iconColor),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 6,
                              ),
                              child: Row(
                                children: [
                                  _TabItem(title: 'Upcomming', index: 0),
                                  _TabItem(title: 'Jet Share', index: 1),
                                  _TabItem(title: 'Past', index: 2),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.h),
                            if (controler.selectedInd.value == 0) ...[
                              profile_tabBar(
                                'No Upcoming Flights',
                                'Start planning your next journey',
                                'assets/icons/airplan.svg',
                              ),
                            ] else if (controler.selectedInd.value == 1) ...[
                              profile_tabBar(
                                'No Jet Share',
                                'Start planning your next journey',
                                'assets/icons/book_icon.svg',
                              ),
                            ] else if (controler.selectedInd.value == 2) ...[
                              profile_tabBar(
                                'No Past History',
                                'Start planning your next journey',
                                'assets/icons/world.svg',
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _TabItem({required String title, required int index}) {
    final isSelected = controler.selectedInd.value == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => controler.changeTab(index),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? Appcolors.blackColor : Colors.transparent,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.montserrat(
                fontSize: 14.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected
                    ? Appcolors.whiteColor
                    : Appcolors.whiteColor.withOpacity(0.7),
              ),
            ),
          ),
        ),
      ),
    );
  }

  profile_tabBar(String title, String subtitle, String iconurl) {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child: SvgPicture.asset(
              iconurl,
              height: 35.h,
              color: Appcolors.TitleTextColor,
            ),
          ),
          Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 24.sp,
              color: Appcolors.whiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            subtitle,
            style: GoogleFonts.montserrat(
              fontSize: 18.sp,
              color: Appcolors.whiteColor,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 15.h),

          GestureDetector(
            onTap: () {
              Get.toNamed('home');
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
              decoration: BoxDecoration(
                color: Appcolors.whiteColor,
                borderRadius: BorderRadius.circular(10.r)
                
              ),
              child: Text('Book Flight',style: GoogleFonts.montserrat(fontSize: 20.sp,fontWeight: FontWeight.w600)),
            ),
          ),
          SizedBox(height: 15.h),

        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20.h, color: Colors.white70),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.montserrat(
              fontSize: 12,
              color: Appcolors.whiteColor.withOpacity(0.8),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  const _StatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        color: Appcolors.splashBackground,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Appcolors.profileContainerBorder),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Appcolors.whiteColor,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color? color;
  final VoidCallback ontap;
  const _MenuTile({required this.icon, required this.title, this.color,required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Appcolors.splashBackground,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Appcolors.profileContainerBorder),
      ),
      child: ListTile(
        leading: Icon(icon, color: color ?? Colors.white),
        title: Text(
          title,
          style: GoogleFonts.montserrat(color: color ?? Colors.white),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.white54),
        onTap:ontap,
      ),
    );
  }
}
