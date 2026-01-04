import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jets_of_america/utils/appColors.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() =>
      _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

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
                    "Set new password",
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Appcolors.whiteColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Your new password must be different from previously used passwords.",
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: Appcolors.whiteColor.withOpacity(.6),
                    ),
                  ),
                  const SizedBox(height: 24),

                  _label("Create New Password"),
                  _passwordInput(
                    hint: "Enter your password",
                    visible: isPasswordVisible,
                    onToggle: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),

                  const SizedBox(height: 16),

                  _label("Confirm Password"),
                  _passwordInput(
                    hint: "Confirm your password",
                    visible: isConfirmPasswordVisible,
                    onToggle: () {
                      setState(() {
                        isConfirmPasswordVisible =
                        !isConfirmPasswordVisible;
                      });
                    },
                  ),

                  const Spacer(),

                  _primaryButton("Reset Password", () {
                    Get.offAllNamed('/loginScreen');
                  }),

                  const SizedBox(height: 12),


                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _passwordInput({
    required String hint,
    required bool visible,
    required VoidCallback onToggle,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Appcolors.whiteColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        obscureText: !visible,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Colors.white38,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              visible ? Icons.visibility : Icons.visibility_off,
              color: Colors.white38,
            ),
            onPressed: onToggle,
          ),
          hintText: hint,
          hintStyle:
          GoogleFonts.inter(color: Colors.white38),
        ),
      ),
    );
  }
}

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

Widget _input(IconData icon, String hint) => Container(
  margin: const EdgeInsets.only(bottom: 12),
  decoration: BoxDecoration(
    color: Appcolors.whiteColor.withOpacity(0.1),
    borderRadius: BorderRadius.circular(10),
  ),
  child: TextField(
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      border: InputBorder.none,
      prefixIcon: Icon(icon, color: Colors.white38),
      hintText: hint,
      hintStyle: GoogleFonts.inter(
        color: Colors.white38,
      ),
    ),
  ),
);

Widget _otpBox() => Container(
  height: 56,
  width: 56,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: Colors.white24),
  ),
  alignment: Alignment.center,
  child: Text(
    "",
    style: GoogleFonts.inter(color: Colors.white, fontSize: 18),
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
