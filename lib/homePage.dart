import 'package:flutter/material.dart';
import 'constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor.withOpacity(0.15),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Image.asset("assets/logo.png"),
        ),
        title: Text("Home"),
        backgroundColor: primaryColor,
      ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          // We want the column to be scrollable
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Image.asset(
                'assets/logo.png',
                height: 100,
                width: 100,
              )),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Welcome to my app!",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Discover the perfect balance of plant care with our intelligent plant monitoring app! Whether you’re a beginner or an experienced gardener, our app helps you ensure your plants thrive. Using advanced image classification, the app analyzes photos of your plants to determine if they are underwatered, overwatered, or perfectly healthy.\n\n'
                'You can easily access detailed plant information, personalized care tips, and growth tracking. The app also integrates geolocation data to provide plant care recommendations based on your local climate. With a sleek, user-friendly interface, it’s never been easier to maintain a healthy, vibrant garden.',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
              )
            ],
          ))),
    );
  }
}

/* Column
  children
    1. Center Widget with the Logo Picture
    2. Text that says "Welcome to my app"
    3. Text that says - Discover the perfect balance of plant care with our intelligent plant monitoring app! Whether you’re a beginner or an experienced gardener, our app helps you ensure your plants thrive. Using advanced image classification, the app analyzes photos of your plants to determine if they are underwatered, overwatered, or perfectly healthy.\n\n'
                    You can easily access detailed plant information, personalized care tips, and growth tracking. The app also integrates geolocation data to provide plant care recommendations based on your local climate. With a sleek, user-friendly interface, it’s never been easier to maintain a healthy, vibrant garden.
*/