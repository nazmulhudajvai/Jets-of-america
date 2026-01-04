import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jets_of_america/utils/appColors.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _profileHeader(context),
              const SizedBox(height: 20),
              _sectionTitle("Personal Information"),
              _sectionName('Full Name '),
              _inputField(
                icon: Icons.person_outline,
                hint: "Enter your full name",
              ),
              _sectionName('Email'),
              _inputField(
                icon: Icons.email_outlined,
                hint: "Enter your email",
              ),
              _sectionName('Phone'),
              _inputField(
                icon: Icons.phone_outlined,
                hint: "Enter your phone number",
              ),
              _sectionName('Date of Birth'),
              _inputField(
                icon: Icons.calendar_month_outlined,
                hint: "dd/mm/yyyy",
              ),
              const SizedBox(height: 20),
              _sectionTitle("Additional Information"),
              _sectionName('Address'),
              _inputField(
                icon: Icons.location_on_outlined,
                hint: "Enter your home address",
              ),
              _sectionName('Phone Number'),
              _inputField(
                icon: Icons.phone_in_talk_outlined,
                hint: "Enter your phone number",
              ),
              const SizedBox(height: 30),
              _actionButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileHeader(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          /// 🔙 BACK BUTTON (TOP LEFT)
          Positioned(
            top: 0,
            left: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context); // or Get.back();
              },
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.yellow.withOpacity(.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          /// MAIN CONTENT (CENTERED)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: 64.h,
                    width: 64.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6D7A3).withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/single_person.svg',
                        height: 28.sp,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Edit Profile",
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: Appcolors.whiteColor,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "Update your personal information",
                  style: GoogleFonts.montserrat(
                    fontSize: 14.sp,
                    color: Appcolors.whiteColor.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _sectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style:GoogleFonts.montserrat(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: Appcolors.whiteColor.withOpacity(0.5),
        ),
      ),
    );
  }
  Widget _sectionName(String name) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        name,
        style:GoogleFonts.montserrat(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: Appcolors.whiteColor.withOpacity(0.5),
        ),
      ),
    );
  }

  Widget _inputField({
    required IconData icon,
    required String hint,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: TextField(
        style:   GoogleFonts.montserrat(fontSize: 14.sp, color: Colors.white),
        decoration: InputDecoration(
          icon: Icon(icon, color: Colors.white54),
          hintText: hint,
          hintStyle:  TextStyle(color: Colors.white38),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _actionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: const BorderSide(color: Colors.white24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text("Save Changes"),
          ),
        ),
      ],
    );
  }
}
