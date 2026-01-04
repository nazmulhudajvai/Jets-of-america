import 'package:flutter/material.dart';
import 'package:jets_of_america/views/bottomNavigationBar/homeScreen/inside_jets/f3.dart';
 

class StepTwoPage extends StatelessWidget {
  final String fromTo;
  final String date;
  final String passenger;
  final String travelerType;

  StepTwoPage({
    required this.fromTo,
    required this.date,
    required this.passenger,
    required this.travelerType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 60),
          Text("Step 2", style: TextStyle(color: Colors.white, fontSize: 22)),

          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("From: $fromTo", style: TextStyle(color: Colors.white)),
                  Text("Date: $date", style: TextStyle(color: Colors.white)),
                  Text("Passenger: $passenger", style: TextStyle(color: Colors.white)),
                  Text("Type: $travelerType", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => StepThreePage(
                      fromTo: fromTo,
                      date: date,
                      passenger: passenger,
                      travelerType: travelerType,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                minimumSize: Size(double.infinity, 55),
              ),
              child: Text("Continue"),
            ),
          ),
        ],
      ),
    );
  }
}
