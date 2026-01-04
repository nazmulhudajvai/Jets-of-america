import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:jets_of_america/utils/appColors.dart';

class C_AppBar extends StatelessWidget {
  const C_AppBar({
    super.key, required this.showjet, required this.shownotification,
  });
final bool showjet;
final bool shownotification;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      padding: EdgeInsets.only(top: 1.h, left: 16.w, right: 16.w),
      decoration: BoxDecoration(color: Appcolors.splashBackground),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
           onTap: () {
             Get.back();
           },
            child:showjet? SvgPicture.asset('assets/icons/AppTitle.svg'):Icon(Icons.arrow_back_ios,color: Appcolors.whiteColor)
          ),
         shownotification? GestureDetector(
            onTap: () {
                Get.toNamed('/notification');
              debugPrint('This is notification icon');
            },
            child: Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: Appcolors.strokeLineColor.withOpacity(0.05),
              ),
              child: SvgPicture.asset(
                'assets/icons/notification_logo.svg',
                height: 25.h,
                width: 13.w,
              ),
            ),
          ):SizedBox(),
        ],
      ),
    );
  }
}

