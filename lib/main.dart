import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:jets_of_america/views/bottomNavigationBar/homeScreen/homeScreen.dart';
import 'package:jets_of_america/views/bottomNavigationBar/homeScreen/inside_jets/all_aircraft.dart';
import 'package:jets_of_america/services/bindings/bindings.dart';
import 'package:jets_of_america/views/authenticaionPages/loginPages/loginScreen.dart';
import 'package:jets_of_america/views/authenticaionPages/signupPages/signupScreen.dart';
import 'package:jets_of_america/views/bottomNavigationBar/bottomNavBar.dart';
import 'package:jets_of_america/views/bottomNavigationBar/homeScreen/inside_jets/f1.dart';
import 'package:jets_of_america/views/bottomNavigationBar/homeScreen/inside_jets/jet_details.dart';
import 'package:jets_of_america/views/bottomNavigationBar/homeScreen/widgets/notification.dart';
import 'package:jets_of_america/views/bottomNavigationBar/jetShare_Screen/jetShare.dart';
import 'package:jets_of_america/views/bottomNavigationBar/profile_screen/editprofile/editprofile.dart';
import 'package:jets_of_america/views/bottomNavigationBar/profile_screen/paymentmethods/payment_methods.dart';
import 'package:jets_of_america/views/bottomNavigationBar/profile_screen/profile.dart';
import 'package:jets_of_america/views/splashScreen/splashScreen.dart';
 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:   Size( 430, 932) ,
      child: GetMaterialApp(
       debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        // home:  LoginScreen(),
        initialRoute: '/splashScreen',
        getPages: [
          GetPage(name: '/splashScreen' , page: ()=>const Splashscreen()),
          GetPage(name: '/home' , page: ()=>const Homescreen()),
          GetPage(name: '/loginScreen' , page: ()=> Loginscreen(),binding: AllBinding()),
          GetPage(name: '/signupScreen' , page: ()=>const SignupScreen(),binding: AllBinding()),
          GetPage(name: '/homeScreen' , page: ()=>const Bottomnavbar(),binding: AllBinding()),
          GetPage(name: '/jetDetails', page: ()=> JetDetails()),
          GetPage(name: '/notification', page: ()=>  NotificationPage()),
          GetPage(name: '/stepOne', page: ()=>  StepOnePage()),
          GetPage(name: '/allAircraft', page: ()=>  AllAircraft()),
          GetPage(name: '/jetShare', page: ()=>  Jetshare()),
          GetPage(name: '/profile', page: ()=>  Profile()),
          GetPage(name: '/EditProfileScreen', page: ()=>  EditProfileScreen()),
          GetPage(name: '/bnb', page: ()=>  Bottomnavbar()),
        ],
      ),
    );
  }
}

