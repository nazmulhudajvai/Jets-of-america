import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jets_of_america/utils/appColors.dart';

/// =======================
/// MODEL
/// =======================
class PaymentCardModel {
  final String cardLabel;
  final String expiry;

  PaymentCardModel({required this.cardLabel, required this.expiry});
}

/// =======================
/// SCREEN
/// =======================
class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  final List<PaymentCardModel> cards = [
    PaymentCardModel(
      cardLabel: "Mastercard •••• 8888",
      expiry: "Expires 09/26",
    ),
    PaymentCardModel(cardLabel: "Visa •••• 4242", expiry: "Expires 12/25"),
  ];

  int? pendingDeleteIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16.w),
          children: [
            _profileHeader(context),
            SizedBox(height: 24.h),

            ...List.generate(cards.length, (index) {
              final card = cards[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: PaymentCardTile(
                  cardLabel: card.cardLabel,
                  expiry: card.expiry,
                  showCheck: pendingDeleteIndex == index,
                  onDelete: () {
                    setState(() {
                      pendingDeleteIndex = pendingDeleteIndex == index
                          ? null
                          : index;
                    });
                  },
                  onSelect: () {
                    setState(() {
                      cards.removeAt(index);
                      pendingDeleteIndex = null;
                    });
                  },
                ),
              );
            }),

            SizedBox(height: 12.h),

            _CardTile(
              icon: Icons.add,
              title: "Add New Card",
              ontap: _showAddCardDialog,
            ),

            SizedBox(height: 12.h),

            _paymentInfoCard(),
          ],
        ),
      ),
    );
  }

  /// =======================
  /// INFO CARD
  /// =======================
  Widget _paymentInfoCard() {
    return Container(
      height: 95.h,
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Color(0xFFE6D7A3).withOpacity(0.15),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(width: 2, color: Color(0xFFE6D7A3).withOpacity(0.5)),
      ),
      child: Center(
        child: Text(
          "All payment information is encrypted and securely stored. "
          "We support major credit cards and digital wallets for your convenience.",
          style: GoogleFonts.montserrat(
            fontSize: 12.sp,
            height: 1.5,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  /// =======================
  /// HEADER
  /// =======================
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
                        'assets/icons/card.svg',
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
                  "Payment Method",
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: Appcolors.whiteColor,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "Manage your payment options",
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


  /// =======================
  /// ADD CARD DIALOG
  /// =======================
  void _showAddCardDialog() {
    final cardNumber = TextEditingController();
    final cardHolder = TextEditingController();
    final expiry = TextEditingController();
    final cvv = TextEditingController();

    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            gradient: const LinearGradient(
              colors: [Color(0xFF1A1A1A), Color(0xFF0F0F0F)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Spacer(),
                  Text(
                    "Add New Card",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.close,
                      color: Colors.white70,
                      size: 20.sp,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              _dialogLabel("Card Number"),
              _dialogField(
                controller: cardNumber,
                hint: "1234 5678 9012 3456",
                keyboardType: TextInputType.number,
              ),

              SizedBox(height: 14.h),

              _dialogLabel("Card Holder Name"),
              _dialogField(controller: cardHolder, hint: "Jhon Doe"),

              SizedBox(height: 14.h),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _dialogLabel("Expiry Date"),
                        _dialogField(
                          controller: expiry,
                          hint: "MM/YY",
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _dialogLabel("CVV"),
                        _dialogField(
                          controller: cvv,
                          hint: "123",
                          keyboardType: TextInputType.number,
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 22.h),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      onPressed: () => Get.back(),
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.montserrat(
                          color: Colors.white70,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      onPressed: () {
                        if (cardNumber.text.length < 4) return;
                        setState(() {
                          cards.add(
                            PaymentCardModel(
                              cardLabel:
                                  "Card •••• ${cardNumber.text.substring(cardNumber.text.length - 4)}",
                              expiry: "Expires ${expiry.text}",
                            ),
                          );
                        });
                        Get.back();
                      },
                      child: Text(
                        "Add Card",
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dialogLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Text(
        text,
        style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 12.sp),
      ),
    );
  }

  Widget _dialogField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 14.sp),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.montserrat(
          color: Colors.white38,
          fontSize: 13.sp,
        ),
        filled: true,
        fillColor: const Color(0xFF1E1E1E),
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

/// =======================
/// PAYMENT CARD TILE
/// =======================
class PaymentCardTile extends StatelessWidget {
  final String cardLabel;
  final String expiry;
  final bool showCheck;
  final VoidCallback onDelete;
  final VoidCallback onSelect;

  const PaymentCardTile({
    super.key,
    required this.cardLabel,
    required this.expiry,
    required this.showCheck,
    required this.onDelete,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF121212),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.blueGrey.withOpacity(0.35)),
      ),
      child: Row(
        children: [
          Container(
            height: 48.h,
            width: 48.h,
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0.sp),
              child: SvgPicture.asset(
                'assets/icons/card.svg', // your svg path
                width: 24.w,
                height: 24.h,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardLabel,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  expiry,
                  style: GoogleFonts.montserrat(
                    color: Colors.white54,
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          ),
          if (showCheck)
            GestureDetector(
              onTap: onSelect,
              child: Container(
                height: 40.h,
                width: 40.h,
                margin: EdgeInsets.only(right: 8.w),
                decoration: BoxDecoration(
                  color: Color(0xFFEAB308).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(Icons.check, color: Colors.white, size: 20.sp),
              ),
            ),
          GestureDetector(
            onTap: onDelete,
            child: Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.10),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0.r),
                child: SvgPicture.asset(
                  'assets/icons/delete.svg', // your svg path
                  width: 16.w,
                  height: 16.h,
                  colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// =======================
/// ADD PAYMENT TILE
/// =======================
class _CardTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback ontap;

  const _CardTile({
    required this.icon,
    required this.title,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8.r),
      onTap: ontap,
      child: Container(
        height: 56.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Appcolors.splashBackground,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Appcolors.profileContainerBorder),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 20.sp),
            SizedBox(width: 8.w),
            Text(
              title,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
