import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/authentication/forget_controller/forget_controller.dart';
import '../../../utils/appColors.dart';
import 'verify_code_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final ForgotController controller = Get.put(ForgotController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          _bg(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),

                  Text(
                    "Forgot Password?",
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Appcolors.whiteColor,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Obx(() => Text(
                    controller.useEmail.value
                        ? "Don’t worry! Please enter your email."
                        : "Don’t worry! Please enter your phone number.",
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: Appcolors.whiteColor.withOpacity(.6),
                    ),
                  )),

                  const SizedBox(height: 24),

                  Obx(() => _label(
                    controller.useEmail.value
                        ? "Email"
                        : "Phone Number",
                  )),

                  Obx(() => _input(
                    controller.useEmail.value
                        ? Icons.email_outlined
                        : Icons.phone,
                    controller.useEmail.value
                        ? "Enter your email"
                        : "Enter your phone number",
                    isPhone: !controller.useEmail.value,
                  )),

                  const SizedBox(height: 8),

                  Obx(() => GestureDetector(
                    onTap: controller.toggleMethod,
                    child: Text(
                      controller.useEmail.value
                          ? "Or use phone number"
                          : "Or use email",
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: Appcolors.whiteColor.withOpacity(.7),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )),

                  const Spacer(),

                  _primaryButton("Send OTP", () {
                    Get.to(() => const VerifyCodeScreen());
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* ---------------------- WIDGETS ---------------------- */

Widget _bg() => Container(
  decoration: BoxDecoration(
    gradient: RadialGradient(
      colors: [
        Appcolors.strokeLineColor.withOpacity(0.01),
        Appcolors.splashBackground,
      ],
      radius: 2.0,
      center: const Alignment(0.0, -2.2),
    ),
  ),
);

Widget _label(String text) => Padding(
  padding: const EdgeInsets.only(bottom: 6),
  child: Text(
    text,
    style: GoogleFonts.inter(
      fontSize: 14,
      color: Appcolors.TitleTextColor,
    ),
  ),
);

Widget _input(
    IconData icon,
    String hint, {
      bool isPhone = false,
    }) =>
    Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Appcolors.whiteColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        keyboardType:
        isPhone ? TextInputType.phone : TextInputType.emailAddress,
        inputFormatters:
        isPhone ? [FilteringTextInputFormatter.digitsOnly] : [],
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(icon, color: Colors.white38),
          hintText: hint,
          hintStyle: GoogleFonts.inter(color: Colors.white38),
        ),
      ),
    );

Widget _primaryButton(String text, VoidCallback onTap) => SizedBox(
  width: double.infinity,
  height: 48,
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Appcolors.whiteColor,
      foregroundColor: Appcolors.loginForegroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    onPressed: onTap,
    child: Text(
      text,
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w700,
        fontSize: 16,
      ),
    ),
  ),
);
