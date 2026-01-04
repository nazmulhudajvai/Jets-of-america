import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jets_of_america/utils/appColors.dart';
import 'package:jets_of_america/views/authenticaionPages/%20forget_password/forgot_password_screen.dart';
import 'package:jets_of_america/views/bottomNavigationBar/homeScreen/homeScreen.dart';

import '../../bottomNavigationBar/bottomNavBar.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {

  bool _obscurePassword = true;

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
                center: Alignment(0.0, -2.2),
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
                    Text(
                      "Email or Phone Number",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Appcolors.TitleTextColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Appcolors.whiteColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        cursorColor: Appcolors.whiteColor,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(top: 13),
                          prefixIcon: Icon(
                            Icons.email_outlined, // You can change to Icons.phone_outlined or keep email icon
                            color: Appcolors.whiteColor.withOpacity(0.4),
                          ),
                          hintText: " Enter your email or phone number ",
                          hintStyle: GoogleFonts.inter(
                            color: Appcolors.whiteColor.withOpacity(0.4),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    Text(
                      "Password",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Appcolors.TitleTextColor,
                      ),
                    ),
                    const SizedBox(height: 8),

                    Container(
                      decoration: BoxDecoration(
                        color: Appcolors.whiteColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        obscureText: _obscurePassword,
                        cursorColor: Appcolors.whiteColor,
                        style: TextStyle(color: Appcolors.whiteColor),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(top: 13),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Appcolors.whiteColor.withOpacity(0.3),
                          ),
                          suffixIcon: IconButton(
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
                          ),
                          hintText: " Enter your Password ",
                          hintStyle: GoogleFonts.inter(
                            color: Appcolors.whiteColor.withOpacity(0.4),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    InkWell(
                      onTap: () {
                        Get.to(ForgotPasswordScreen());
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          " Forgot Password ?",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Appcolors.TitleTextColor,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 45),

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
                        onPressed: () {
                          Get.off(() => Bottomnavbar(),
                              transition: Transition.fade);
                        },
                        child: Text(
                          "Log In",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 70,
                          child: Divider(
                            color: Appcolors.whiteColor.withOpacity(0.10),
                          ),
                        ),
                        Text(
                          " or continue with ",
                          style: GoogleFonts.inter(
                            color: Appcolors.whiteColor.withOpacity(0.4),
                          ),
                        ),
                        SizedBox(
                          width: 70,
                          child: Divider(
                            color: Appcolors.whiteColor.withOpacity(0.10),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    Container(
                      width: double.infinity,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Appcolors.whiteColor.withOpacity(0.1),
                      ),
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Appcolors.whiteColor.withOpacity(0.2),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/icons/apple_icon.svg",
                          height: 22,
                        ),
                        label: const Text(
                          "Continue with Apple",
                          style: TextStyle(color: Appcolors.whiteColor),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    Container(
                      width: double.infinity,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Appcolors.whiteColor.withOpacity(0.1),
                      ),
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Appcolors.whiteColor.withOpacity(0.2),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/icons/google_icon.svg",
                          height: 22,
                        ),
                        label: const Text(
                          "Continue with Google",
                          style: TextStyle(color: Appcolors.whiteColor),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Appcolors.whiteColor.withOpacity(0.7),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/signupScreen');
                          },
                          child: Text(
                            " Sign Up",
                            style: GoogleFonts.inter(
                              color: Appcolors.whiteColor,
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
}
