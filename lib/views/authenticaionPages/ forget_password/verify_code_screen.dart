import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jets_of_america/utils/appColors.dart';
import 'set_new_password_screen.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final List<TextEditingController> _controllers =
  List.generate(4, (_) => TextEditingController());

  final List<FocusNode> _focusNodes =
  List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

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
                    "Check your email",
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Appcolors.whiteColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "We sent a verification code to ",
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Appcolors.whiteColor.withOpacity(.6),
                          ),
                          children: [
                            TextSpan(
                              text: "user@email.com",
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Appcolors.whiteColor, // ✅ brighter
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Enter the code below.",
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: Appcolors.whiteColor.withOpacity(.6),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  /// OTP INPUT
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      4,
                          (index) => _otpBox(index),
                    ),
                  ),

                  const SizedBox(height: 30),

                  _primaryButton("Verify Code", () {
                    Get.to(() => const SetNewPasswordScreen());
                  }),

                  const SizedBox(height: 16),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Didn’t receive the email? ",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Appcolors.whiteColor.withOpacity(.6),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // TODO: resend OTP logic
                            debugPrint("Resend clicked");
                          },
                          child: Text(
                            "Click to resend",
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Appcolors.whiteColor, // brighter
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _otpBox(int index) {
    return SizedBox(
      height: 56,
      width: 56,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: GoogleFonts.inter(
          color: Appcolors.whiteColor,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          counterText: "",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
            BorderSide(color: Colors.white.withOpacity(0.3)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
            BorderSide(color: Appcolors.whiteColor),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            _focusNodes[index + 1].requestFocus();
          }
          if (value.isEmpty && index > 0) {
            _focusNodes[index - 1].requestFocus();
          }
        },
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

Widget _primaryButton(String text, VoidCallback onTap) =>
    SizedBox(
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
