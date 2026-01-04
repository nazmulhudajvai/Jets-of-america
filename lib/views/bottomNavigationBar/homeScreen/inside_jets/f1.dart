import 'package:flutter/material.dart';
import 'package:jets_of_america/views/bottomNavigationBar/homeScreen/inside_jets/f2.dart';


class StepOnePage extends StatelessWidget {
  final fromTo = "Lahore - Karachi";
  final date = "07 Nov 22 - 13 Nov 22";
  final passenger = "1 Passenger";
  final travelerType = "Corporate";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 60),
          Text("Step 1", style: TextStyle(color: Colors.white, fontSize: 22)),

          Expanded(
            child: Center(
              child: Text(
                "Flight Details Page",
                style: TextStyle(color: Colors.white),
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
                    builder: (_) => StepTwoPage(
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
