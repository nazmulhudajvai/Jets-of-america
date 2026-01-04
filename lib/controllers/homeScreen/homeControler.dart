import 'package:get/get.dart';

// Helper class to store data for a single multi-city flight segment
class MultiCityFlight {
  var fromAirport = "".obs;
  var toAirport = "".obs;
  var date = "".obs;
  var passengers = 1.obs;

  MultiCityFlight({required String from, required String to, required String date, required int passengers}) {
    this.fromAirport.value = from;
    this.toAirport.value = to;
    this.date.value = date;
    this.passengers.value = passengers;
  }
}

class HomeControler extends GetxController {
    // ---------------- TABS ----------------
    var selectedTab = 0.obs; // 0: One-way, 1: Round Trip, 2: Multi-city

    void changeTab(int index) {
    selectedTab.value = index;
    // Reset Multi-city state when switching away from it
    if (index != 2) {
    // Ensure at least two flights exist on returning to Multi-city (default state)
      if (multiCityFlights.length < 2) {
        _resetMultiCityFlights();
      }
    }
  }

 
  final List<String> availableAirports = [
    " New York, USA",
    " Los Angeles, USA",
    " Chicago, USA",
    " Atlanta, USA",
    " Dallas, USA",
    " London, UK",
    " Paris, France",
    " Tokyo, Japan",
  ];

 
  var fromAirport = "".obs;
  var toAirport = "".obs;

  void setFromAirport(String airport) => fromAirport.value = airport;
  void setToAirport(String airport) => toAirport.value = airport;

 
  final int maxPassengers = 16;
  final int minPassengers = 1;

  var passengersOneWay = 1.obs;
  var passengersDeparture = 1.obs;
  var passengersReturn = 1.obs;

  void increaseOneWay() {
    if (passengersOneWay.value < maxPassengers) passengersOneWay.value++;
  }
  void decreaseOneWay() {
    if (passengersOneWay.value > minPassengers) passengersOneWay.value--;
  }

  void increaseDeparture() {
    if (passengersDeparture.value < maxPassengers) passengersDeparture.value++;
  }
  void decreaseDeparture() {
    if (passengersDeparture.value > minPassengers) passengersDeparture.value--;
  }

  void increaseReturn() {
    if (passengersReturn.value < maxPassengers) passengersReturn.value++;
  }
  void decreaseReturn() {
    if (passengersReturn.value > minPassengers) passengersReturn.value--;
  }

//  dates for one way 
  var departureDate = "".obs;
  var returnDate = "".obs;

  void setDepartureDate(String date) => departureDate.value = date;
  void setReturnDate(String date) => returnDate.value = date;


//  multi city 

  var multiCityFlights = <MultiCityFlight>[].obs;

  @override
  void onInit() {
    super.onInit();
    _resetMultiCityFlights();
  }

  void _resetMultiCityFlights() {
    multiCityFlights.clear();
    multiCityFlights.add(MultiCityFlight(from: "", to: "", date: "", passengers: 1)); // Flight 1
    multiCityFlights.add(MultiCityFlight(from: "", to: "", date: "", passengers: 1)); // Flight 2
  }

  void addFlightSegment() {
    if (multiCityFlights.length < 5) {
      multiCityFlights.add(MultiCityFlight(from: "", to: "", date: "", passengers: 1));
    }
  }

  void removeFlightSegment(int index) {
    if (multiCityFlights.length > 1) {
      multiCityFlights.removeAt(index);
    }
  }

  void increaseMultiCityPassengers(int index) {
    var count = multiCityFlights[index].passengers.value;
    if (count < maxPassengers) {
      multiCityFlights[index].passengers.value++;
    }
  }

  void decreaseMultiCityPassengers(int index) {
    var count = multiCityFlights[index].passengers.value;
    if (count > minPassengers) {
      multiCityFlights[index].passengers.value--;
    }
  }
}