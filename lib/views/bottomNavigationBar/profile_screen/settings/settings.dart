import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool pushNotifications = true;
  bool emailNotifications = false;
  bool bookingReminders = true;
  bool promotionalEmails = false;

  bool darkMode = true;
  bool biometricAuth = true;
  bool shareUsageData = false;

  String selectedCurrency = "USD – US Dollar";
  String selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16.w),
          children: [

            _header(context),
            SizedBox(height: 20.h),

            /// 🔔 NOTIFICATIONS
            _sectionContainer(
              icon: 'assets/icons/bell.svg',
              title: "Notifications",
              children: [
                _switchRow(
                  "Push Notifications",
                  "Receive alerts about your bookings",
                  pushNotifications,
                      (v) => setState(() => pushNotifications = v),
                ),
                _divider(),
                _switchRow(
                  "Email Notifications",
                  "Get notified via email",
                  emailNotifications,
                      (v) => setState(() => emailNotifications = v),
                ),
                _divider(),
                _switchRow(
                  "Booking Reminders",
                  "Reminders before your flight",
                  bookingReminders,
                      (v) => setState(() => bookingReminders = v),
                ),
                _divider(),
                _switchRow(
                  "Promotional Emails",
                  "Deals and special offers",
                  promotionalEmails,
                      (v) => setState(() => promotionalEmails = v),
                ),
              ],
            ),

            SizedBox(height: 18.h),

            /// ⚙️ PREFERENCES
            _sectionContainer(
              icon: 'assets/icons/global.svg',
              title: "Preferences",
              children: [
                _optionRow(
                  "Currency",
                  selectedCurrency,
                      () => _showCurrencySheet(),
                ),
                _divider(),
                _optionRow(
                  "Language",
                  selectedLanguage,
                      () => _showLanguageSheet(),
                ),
                _divider(),

                /// 🌙 DARK MODE (WITH SVG ICON)
                _switchRowWithIcon(
                  icon: 'assets/icons/night.svg',
                  title: "Dark Mode",
                  subtitle: "Use dark theme",
                  value: darkMode,
                  onChanged: (v) => setState(() => darkMode = v),
                ),
              ],
            ),

            SizedBox(height: 18.h),

            /// 🔐 PRIVACY
            _sectionContainer(
              icon: 'assets/icons/guard.svg',
              title: "Privacy & Security",
              children: [
                _switchRow(
                  "Biometric Authentication",
                  "Use Face ID or fingerprint",
                  biometricAuth,
                      (v) => setState(() => biometricAuth = v),
                ),
                _divider(),
                _switchRow(
                  "Share Usage Data",
                  "Help improve our service",
                  shareUsageData,
                      (v) => setState(() => shareUsageData = v),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ================= HEADER =================
  Widget _header(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 22.h),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white10),
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
          Column(
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
                      'assets/icons/settings.svg',
                      height: 28.sp,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Settings",
                style: GoogleFonts.playfairDisplay(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                "Customize your app experience",
                style: GoogleFonts.montserrat(
                  fontSize: 12.sp,
                  color: Colors.white54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  // ================= SECTION =================
  Widget _sectionContainer({
    required String icon,
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF121212),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 10.h),
            child: Row(
              children: [
                SvgPicture.asset(
                  icon,
                  height: 18.sp,
                  colorFilter: const ColorFilter.mode(
                      Colors.white, BlendMode.srcIn),
                ),
                SizedBox(width: 10.w),
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          _divider(),
          ...children,
        ],
      ),
    );
  }

  // ================= ROWS =================
  Widget _switchRow(
      String title,
      String subtitle,
      bool value,
      ValueChanged<bool> onChanged,
      ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: GoogleFonts.montserrat(
                        fontSize: 14.sp, color: Colors.white)),
                SizedBox(height: 3.h),
                Text(subtitle,
                    style: GoogleFonts.montserrat(
                        fontSize: 11.5.sp, color: Colors.white54)),
              ],
            ),
          ),
          Transform.scale(
            scale: 0.75,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeColor:  Colors.white70,
              inactiveTrackColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  /// 🔥 SWITCH WITH SVG ICON (ONLY USED FOR DARK MODE)
  Widget _switchRowWithIcon({
    required String icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            height: 18.sp,
            colorFilter:
            const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: GoogleFonts.montserrat(
                        fontSize: 14.sp, color: Colors.white)),
                SizedBox(height: 3.h),
                Text(subtitle,
                    style: GoogleFonts.montserrat(
                        fontSize: 11.5.sp, color: Colors.white54)),
              ],
            ),
          ),
          Transform.scale(
            scale: 0.75,
            child: Switch(
              value: value,
              onChanged: onChanged,inactiveTrackColor: Colors.white,
              activeColor:  Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _optionRow(String title, String value, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          children: [
            Text(title,
                style: GoogleFonts.montserrat(
                    fontSize: 14.sp, color: Colors.white)),
            const Spacer(),
            Text(value,
                style: GoogleFonts.montserrat(
                    fontSize: 12.5.sp, color: Colors.white54)),
            SizedBox(width: 6.w),
            Icon(Icons.chevron_right,
                size: 18.sp, color: Colors.white38),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return Divider(
      height: 1,
      color: Colors.white12,
      indent: 16.w,
      endIndent: 16.w,
    );
  }

  // ================= BOTTOM SHEETS =================
  void _showCurrencySheet() {
    _showSelectionSheet(
      title: "Select Currency",
      items: [
        "USD – US Dollar",
        "EUR – Euro",
        "GBP – British Pound",
        "INR – Indian Rupee",
        "AED – UAE Dirham",
      ],
      onSelected: (v) => setState(() => selectedCurrency = v),
    );
  }

  void _showLanguageSheet() {
    _showSelectionSheet(
      title: "Select Language",
      items: [
        "English",
        "Spanish",
        "French",
        "German",
        "Arabic",
      ],
      onSelected: (v) => setState(() => selectedLanguage = v),
    );
  }

  void _showSelectionSheet({
    required String title,
    required List<String> items,
    required ValueChanged<String> onSelected,
  }) {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          color: Color(0xFF121212),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Text(
                title,
                style: GoogleFonts.montserrat(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ...items.map(
                  (e) => ListTile(
                title: Text(e,
                    style: GoogleFonts.montserrat(color: Colors.white)),
                onTap: () {
                  onSelected(e);
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
