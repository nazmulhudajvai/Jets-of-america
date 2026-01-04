import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jets_of_america/utils/appColors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isChecked = false;
  bool _obscurePassword = true; // ✅ added

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
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
          ),

          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Center(
                      child: SvgPicture.asset(
                        "assets/icons/AppTitle.svg",
                        height: 30,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Center(
                      child: Text(
                        "Welcome back",
                        style: TextStyle(
                          color: Appcolors.whiteColor.withOpacity(.6),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    /// ---------------- FULL NAME ----------------
                    Text(
                      "Full Name ",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Appcolors.TitleTextColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _inputField(
                      icon: Icons.person_2_outlined,
                      hint: " Enter your Full Name ",
                    ),

                    const SizedBox(height: 10),

                    /// ---------------- EMAIL ----------------
                    Text(
                      "Email or Phone Number",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Appcolors.TitleTextColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _inputField(
                      icon: Icons.email_outlined, // or Icons.phone_outlined if preferred
                      hint: " Enter your email or phone number ",
                    ),
                    const SizedBox(height: 10),

                    /// ---------------- PASSWORD ----------------
                    Text(
                      "Password",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Appcolors.TitleTextColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _inputField(
                      icon: Icons.lock_outline,
                      hint: " Enter your Password ",
                      isPassword: true,
                    ),

                    const SizedBox(height: 15),

                    /// ---------------- CHECKBOX ----------------
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value ?? false;
                            });
                          },
                          side: BorderSide(
                            color: Appcolors.whiteColor.withOpacity(0.9),
                          ),
                          fillColor:
                          MaterialStateColor.resolveWith((state) {
                            if (state.contains(MaterialState.selected)) {
                              return Appcolors.whiteColor.withOpacity(0.15);
                            }
                            return Appcolors.iconColor;
                          }),
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: 'I agree with ',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                color: Appcolors.whiteColor.withOpacity(0.6),
                              ),
                              children: [
                                TextSpan(
                                  text:
                                  'Terms & Conditions and \nPrivacy Policy',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    color: Appcolors.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    /// ---------------- BUTTON ----------------
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Appcolors.whiteColor,
                          foregroundColor:
                          Appcolors.loginForegroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Create Account",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// ---------------- FOOTER ----------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: GoogleFonts.inter(
                            color:
                            Appcolors.whiteColor.withOpacity(0.7),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/loginScreen');
                          },
                          child: Text(
                            " Log In",
                            style: GoogleFonts.inter(
                              color: Appcolors.whiteColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// -------- INPUT FIELD HELPER (UI SAME) --------
  Widget _inputField({
    required IconData icon,
    required String hint,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Appcolors.whiteColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        obscureText: isPassword ? _obscurePassword : false,
        cursorColor: Appcolors.whiteColor,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 13),
          prefixIcon: Icon(
            icon,
            color: Appcolors.whiteColor.withOpacity(0.4),
          ),
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(
              _obscurePassword
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: Appcolors.whiteColor.withOpacity(0.4),
            ),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          )
              : null,
          hintText: hint,
          hintStyle: GoogleFonts.inter(
            color: Appcolors.whiteColor.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}
