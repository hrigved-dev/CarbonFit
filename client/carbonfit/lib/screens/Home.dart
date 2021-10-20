import 'package:fixyourprint/screens/AboutUs.dart';
import 'package:fixyourprint/screens/CarbonInfo.dart';
import 'package:fixyourprint/screens/ChatbotScreen.dart';
import 'package:fixyourprint/screens/Countdown.dart';
import 'package:fixyourprint/screens/Dashboard.dart';
import 'package:fixyourprint/screens/FAQs.dart';
import 'package:fixyourprint/screens/Solutions.dart';
import 'package:fixyourprint/widgets/DrawerTap.dart';
import 'package:fixyourprint/screens/LoginScreen.dart';
import 'package:fixyourprint/screens/ProfileInfo.dart';
import 'package:fixyourprint/screens/Questionnaire.dart';
import 'package:fixyourprint/services/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final screens = [
    Dashboard(),
    Solutions(),
    CarbonInfo(),
    ChatBotScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() => currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.lightGreen,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        iconSize: 20,
        selectedFontSize: 16,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alt_route),
            label: 'Solutions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.air),
            label: 'CO2 Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Ember',
          ),
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          child: ListView(
            children: [
              Text(
                "CarbonFit",
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 26,
                    color: Colors.green,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5),
              ),
              Divider(
                color: Colors.grey,
              ),
              SizedBox(
                height: 20,
              ),
              DrawerTap(
                text: 'Recalculate',
                child: Questionnaire(
                  isUpdate: true,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DrawerTap(
                text: 'Countdown',
                child: Countdown(),
              ),
              SizedBox(
                height: 20,
              ),
              DrawerTap(
                text: 'FAQ',
                child: FAQ(),
              ),
              SizedBox(
                height: 20,
              ),
              DrawerTap(
                text: 'About Us',
                child: AboutUs(),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text(
                        'Logout',
                        style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      content: const Text(
                        'Are You Sure you want to Log out of the app?',
                        style: TextStyle(fontFamily: 'Lato'),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            AuthService().logoutUser();
                            Navigator.of(context).pushReplacement(
                                PageTransition(
                                    child: LoginScreen(),
                                    type: PageTransitionType.fade));
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Log Out',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(PageTransition(
                        child: ProfileInfo(),
                        type: PageTransitionType.rightToLeft));
                  });
                },
                icon: Icon(Icons.person_outline)),
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: IndexedStack(index: currentIndex, children: screens),
      ),
    );
  }
}
