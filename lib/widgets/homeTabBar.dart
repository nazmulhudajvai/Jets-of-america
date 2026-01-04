import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jets_of_america/controllers/homeScreen/homeControler.dart';
import 'package:jets_of_america/utils/appColors.dart';

class HomeTabBar extends StatelessWidget {
  final flightController = Get.put(HomeControler());

  HomeTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: Appcolors.homeTabBG,
          borderRadius: BorderRadius.circular(22.r),
        ),
        child: Column(
          children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildTab("One-way", 0),
                buildTab("Round Trip", 1),
                buildTab("Multi-city", 2),
              ],
            ),
            SizedBox(height: 20.h),
      
           
            if (flightController.selectedTab.value == 0) ...[
            
              _buildOneWayUI(context),
            ] else if (flightController.selectedTab.value == 1) ...[
              
              _buildRoundTripUI(context),
            ] else if (flightController.selectedTab.value == 2) ...[
              
              _buildMultiCityUI(context),
            ],
      
            SizedBox(height: 20.h),
      
            
            Container(
              height: 58.h,
              decoration: BoxDecoration(
                color: Appcolors.whiteColor,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search, color: Colors.black, size: 22),
                  SizedBox(width: 10.w),
                  Text(
                    "Search Flights",
                    style: GoogleFonts.montserrat(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

 
  Widget _buildMultiCityUI(BuildContext context) {
    return Column(
      children: [
      
        Obx(() => Column(
              children: List.generate(
                flightController.multiCityFlights.length,
                (index) {
                  final segment = flightController.multiCityFlights[index];
                  final isLastSegment = index == flightController.multiCityFlights.length - 1;

                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Flight ${index + 1}",
                              style: GoogleFonts.montserrat(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Appcolors.homeTabBar,
                              ),
                            ),
                            if (flightController.multiCityFlights.length > 1)
                              GestureDetector(
                                onTap: () =>
                                    flightController.removeFlightSegment(index),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 4.h),
                                  decoration: BoxDecoration(
                                    color: Appcolors.whiteColor,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Text(
                                    "Remove",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Appcolors.blackColor,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 12.h),

                        // FROM
                        GestureDetector(
                          onTap: () =>
                              _openAirportSheet(isDeparture: true, flightIndex: index),
                          child: buildInput(
                            Icons.location_on_outlined,
                            segment.fromAirport.value.isEmpty
                                ? "From"
                                : segment.fromAirport.value,
                          ),
                        ),
                        SizedBox(height: 12.h),

                        GestureDetector(
                          onTap: () => _openAirportSheet(
                              isDeparture: false, flightIndex: index),
                          child: buildInput(
                            Icons.location_on_outlined,
                            segment.toAirport.value.isEmpty
                                ? "To"
                                : segment.toAirport.value,
                          ),
                        ),
                        SizedBox(height: 12.h),

                        Row(
                          children: [
                            // DATE & TIME
                            Expanded(
                              child: GestureDetector(
                                onTap: () => _openCalendarScreen(
                                    isDeparture: true,
                                    isOneWay: false, // Doesn't matter for multi-city, but keeps the signature
                                    context: context,
                                    flightIndex: index),
                                child: buildInput(
                                  Icons.calendar_month_outlined,
                                  segment.date.value.isEmpty
                                      ? "Date & Time"
                                      : segment.date.value,
                                ),
                              ),
                            ),
                            SizedBox(width: 12.w),

                            // PASSENGERS
                            Expanded(
                              child: buildInputWithDrop(
                               
                                title: "${segment.passengers.value} Passengers",
                                subtitle: "",
                                onTap: () => _openPassengerSheet(
                                  isOneWay: false,
                                  isDeparture: true, // Doesn't matter
                                  context: context,
                                  flightIndex: index,
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (index < flightController.multiCityFlights.length - 1)
                          SizedBox(height: 20.h),
                      ],
                    ),
                  );
                },
              ),
            )),

        SizedBox(height: 20.h),

       
        if (flightController.multiCityFlights.length < 5)
          GestureDetector(
            onTap: flightController.addFlightSegment,
            child: Container(
              height: 48.h,
              decoration: BoxDecoration(
                color:Appcolors.homeTabBar, 
                borderRadius:BorderRadius.circular(16.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: Colors.black, size: 22),
                  SizedBox(width: 10.w),
                  Text(
                    "Add Flight Segment",
                    style: GoogleFonts.montserrat(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildOneWayUI(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => _openAirportSheet(isDeparture: true),
          child: buildInput(
            Icons.location_on_outlined,
            flightController.fromAirport.value.isEmpty
                ? "From"
                : flightController.fromAirport.value,
          ),
        ),
        SizedBox(height: 12.h),
        GestureDetector(
          onTap: () => _openAirportSheet(isDeparture: false),
          child: buildInput(
            Icons.location_on_outlined,
            flightController.toAirport.value.isEmpty
                ? "To"
                : flightController.toAirport.value,
          ),
        ),
        SizedBox(height: 12.h),
        buildInputWithDrop(
          
          title: "${flightController.passengersOneWay.value} Passengers",
          subtitle: "",
          onTap: () => _openPassengerSheet(
            isOneWay: true,
            isDeparture: true,
            context: context,
          ),
        ),
        SizedBox(height: 12.h),
        GestureDetector(
          onTap: () => _openCalendarScreen(
              isDeparture: true, isOneWay: true, context: context),
          child: buildInput(
            Icons.calendar_month_outlined,
            flightController.departureDate.value.isEmpty
                ? "Date & Time"
                : flightController.departureDate.value,
          ),
        ),
      ],
    );
  }

  Widget _buildRoundTripUI(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => _openAirportSheet(isDeparture: true),
          child: buildInput(
            Icons.location_on_outlined,
            flightController.fromAirport.value.isEmpty
                ? "From"
                : flightController.fromAirport.value,
          ),
        ),
        SizedBox(height: 12.h),
        GestureDetector(
          onTap: () => _openAirportSheet(isDeparture: false),
          child: buildInput(
            Icons.location_on_outlined,
            flightController.toAirport.value.isEmpty
                ? "To"
                : flightController.toAirport.value,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: buildInputWithDrop(
               
                title: "${flightController.passengersDeparture.value} Passengers",
                subtitle: "Departure",
                onTap: () => _openPassengerSheet(
                  isDeparture: true,
                  isOneWay: false,
                  context: context,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: buildInputWithDrop(
               
                title: "${flightController.passengersReturn.value} Passengers",
                subtitle: "Return",
                onTap: () => _openPassengerSheet(
                  isDeparture: false,
                  isOneWay: false,
                  context: context,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => _openCalendarScreen(
                    isDeparture: true, isOneWay: false, context: context),
                child: buildInput(
                  Icons.calendar_month_outlined,
                  flightController.departureDate.value.isEmpty
                      ? "Date & Time"
                      : flightController.departureDate.value,
                  subtitle: "Departure",
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: GestureDetector(
                onTap: () => _openCalendarScreen(
                    isDeparture: false, isOneWay: false, context: context),
                child: buildInput(
                  Icons.calendar_month_outlined,
                  flightController.returnDate.value.isEmpty
                      ? "Date & Time"
                      : flightController.returnDate.value,
                  subtitle: "Return",
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildTab(String text, int index) {
    bool active = flightController.selectedTab.value == index;

    return GestureDetector(
      onTap: () => flightController.changeTab(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: active ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          text,
          style: GoogleFonts.montserrat(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: active ? Appcolors.blackColor : Appcolors.homeTabBar,
          ),
        ),
      ),
    );
  }

  Widget buildInput(IconData ? icon, String title, {String? subtitle}) {
    return Container(
      padding: EdgeInsets.only(top:14.r,left: 12.r,bottom: 14.r),
      decoration: BoxDecoration(
        color: Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [

             Icon(icon, color: Appcolors.homeTabBar, size: 22), 
              SizedBox(width: 10.w),
              Text(
                title,
                style: GoogleFonts.montserrat(
                  color: Appcolors.homeTabBar,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
          if (subtitle != null) ...[
            SizedBox(height: 4.h),
            Row(
              children: [
                SizedBox(width: 35.w),
                Text(
                  subtitle,
                  style: GoogleFonts.montserrat(
                    color: Appcolors.homeTabBar,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget buildInputWithDrop({
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/icons/person_icon.svg',height: 18,color:Appcolors.homeTabBar),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    title,
                    style: GoogleFonts.montserrat(
                      color: Appcolors.homeTabBar,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(width: 2.w),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Appcolors.homeTabBar,
                ),
              ],
            ),
            if (subtitle.isNotEmpty) ...[
              SizedBox(height: 4.h),
              Row(
                children: [
                  SizedBox(width: 32.w),
                  Text(
                    subtitle,
                    style: GoogleFonts.montserrat(
                      color:Appcolors.homeTabBar,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _openPassengerSheet({
    required bool isDeparture,
    required bool isOneWay,
    required BuildContext context,
    int? flightIndex, 
  }) {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(22.r),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: Obx(() {
          int value;
          if (flightController.selectedTab.value == 2 && flightIndex != null) {
            value = flightController.multiCityFlights[flightIndex].passengers.value;
          } else {
            value = isOneWay
                ? flightController.passengersOneWay.value
                : (isDeparture
                    ? flightController.passengersDeparture.value
                    : flightController.passengersReturn.value);
          }

          void handleDecrease() {
            if (flightController.selectedTab.value == 2 && flightIndex != null) {
              flightController.decreaseMultiCityPassengers(flightIndex);
            } else if (isOneWay) {
              flightController.decreaseOneWay();
            } else if (isDeparture) {
              flightController.decreaseDeparture();
            } else {
              flightController.decreaseReturn();
            }
          }

          void handleIncrease() {
            if (flightController.selectedTab.value == 2 && flightIndex != null) {
              flightController.increaseMultiCityPassengers(flightIndex);
            } else if (isOneWay) {
              flightController.increaseOneWay();
            } else if (isDeparture) {
              flightController.increaseDeparture();
            } else {
              flightController.increaseReturn();
            }
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Passengers (Up to ${flightController.maxPassengers})",
                style: GoogleFonts.montserrat(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: handleDecrease,
                    icon: Icon(
                      Icons.remove_circle_outline,
                      color: value > flightController.minPassengers
                          ? Colors.white
                          : Colors.white30,
                    ),
                  ),
                  Text(
                    "$value",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  IconButton(
                    onPressed: handleIncrease,
                    icon: Icon(
                      Icons.add_circle_outline,
                      color: value < flightController.maxPassengers
                          ? Appcolors.whiteColor
                          : Appcolors.homeTabBar,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25.h),
            ],
          );
        }),
      ),
    );
  }

  void _openAirportSheet({required bool isDeparture, int? flightIndex}) {
    Get.bottomSheet(
      Container(
        height: Get.height * 0.6,
        padding: EdgeInsets.all(22.r),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: Column(
          children: [
            Text(
              isDeparture ? "Select Departure Airport" : "Select Arrival Airport",
              style: GoogleFonts.montserrat(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                itemCount: flightController.availableAirports.length,
                itemBuilder: (context, index) {
                  String airport = flightController.availableAirports[index];
                  return ListTile(
                    leading: Icon(Icons.flight_takeoff,
                        color: Appcolors.homeTabBar),
                    title: Text(airport,
                        style: GoogleFonts.montserrat(color: Colors.white)),
                    onTap: () {
                      if (flightController.selectedTab.value == 2 && flightIndex != null) {
                        if (isDeparture) {
                          flightController.multiCityFlights[flightIndex].fromAirport.value = airport;
                        } else {
                          flightController.multiCityFlights[flightIndex].toAirport.value = airport;
                        }
                      } else {
                        if (isDeparture) {
                          flightController.setFromAirport(airport);
                        } else {
                          flightController.setToAirport(airport);
                        }
                      }
                      Get.back();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openCalendarScreen(
      {required bool isDeparture,
      required bool isOneWay,
      required BuildContext context,
      int? flightIndex 
      }) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.light(
              primary: Appcolors.whiteColor, // Header background color
              onPrimary: Colors.black, // Header text color
              onSurface: Colors.white, // Calendar text color
              surface: Colors.black, // Background color for the dialog
            ),
            dialogBackgroundColor: const Color(0xFF1E1E1E),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, // OK/Cancel buttons color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      String formattedDate =
          "${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}";

      if (flightController.selectedTab.value == 2 && flightIndex != null) {
        flightController.multiCityFlights[flightIndex].date.value = formattedDate;
      } else if (isDeparture) {
        flightController.setDepartureDate(formattedDate);
      } else {
        flightController.setReturnDate(formattedDate);
      }
    }
  }
}