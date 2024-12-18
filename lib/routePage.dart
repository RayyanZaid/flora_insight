import 'package:flutter/material.dart';
import 'package:watering_flutter_app/resultPage.dart';
import './HomePage.dart';
import './healthAnalysisPage.dart';
import './myPlantsPage.dart';
import './plantSearchPage.dart';
import 'constants.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({super.key});

  @override
  RoutePageState createState() => RoutePageState();
}

class RoutePageState extends State<RoutePage> {
  int selectedIndex = 0;
//declaration
  static List<Widget>? WidgetOptions;

  @override
  void initState() {
    super.initState();
    //defintion
    WidgetOptions = [
      ResultPage(imagePath: "../assets/plant.png"),
      const MyPlantPage(),
      PlantSearchPage()
    ];
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: WidgetOptions!.elementAt(selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primaryColor,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/plant.png"),
              color: Colors.black,
              size: 40,
            ),
            label: 'My plants',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety_outlined, color: Colors.black),
            label: 'Health Analysis',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined, color: Colors.black),
            label: 'Articles',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
        onTap: onItemTapped,
      ),
    );
  }
}
