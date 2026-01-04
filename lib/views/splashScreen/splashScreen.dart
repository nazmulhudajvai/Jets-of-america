import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jets_of_america/controllers/splashScreen/splashControler.dart';
import 'package:jets_of_america/utils/appColors.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashControler controller = Get.put(SplashControler());

    return Scaffold(
      backgroundColor: Appcolors.splashBackground,
      body: Obx(() => AnimatedSlide(
        offset: controller.slideUp.value
            ? const Offset(0, -1) // ⬆ splash goes up
            : Offset.zero,
        duration: const Duration(milliseconds:2000),
        curve: Curves.easeInOut,
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: controller.rectWidth * 0.8,
                height: controller.rectHeight * 0.8,
                child: SvgPicture.asset(
                  'assets/icons/AppTitle.svg',
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class BorderProgressPainter extends CustomPainter {
  final double animationValue;
  final double rectWidth;
  final double rectHeight;
  final double strokeWidth;
  final Color progressColor;

  BorderProgressPainter({
    required this.animationValue,
    required this.rectWidth,
    required this.rectHeight,
    required this.strokeWidth,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.square;

    final double totalPerimeter = (rectWidth * 2) + (rectHeight * 2);
    final double lengthCovered = totalPerimeter * animationValue;

    final double corner1 = rectWidth;
    final double corner2 = rectWidth + rectHeight;
    final double corner3 = (rectWidth * 2) + rectHeight;

    Offset start = Offset(rectWidth, 0.0);
    Path path = Path()..moveTo(start.dx, start.dy);

    if (lengthCovered <= corner1) {
      path.lineTo(rectWidth - lengthCovered, 0.0);
    } else {
      path.lineTo(0.0, 0.0);

      if (lengthCovered <= corner2) {
        path.lineTo(0.0, lengthCovered - corner1);
      } else {
        path.lineTo(0.0, rectHeight);

        if (lengthCovered <= corner3) {
          path.lineTo(lengthCovered - corner2, rectHeight);
        } else {
          path.lineTo(rectWidth, rectHeight);
          path.lineTo(
            rectWidth,
            rectHeight - (lengthCovered - corner3),
          );
        }
      }
    }

    canvas.save();
    canvas.translate(strokeWidth / 2, strokeWidth / 2);
    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant BorderProgressPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
