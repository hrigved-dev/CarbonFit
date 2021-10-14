import 'package:fixyourprint/screens/AlternativesScreen.dart';
import 'package:fixyourprint/screens/OffsetScreen.dart';
import 'package:flutter/material.dart';

class Solutions extends StatefulWidget {
  const Solutions({Key? key}) : super(key: key);

  @override
  _SolutionsState createState() => _SolutionsState();
}

class _SolutionsState extends State<Solutions> {
  bool _isOffsetSelected = true;
  bool _isAlternativesSelected = false;
  Widget child = OffsetScreen();

  Widget showAlternatives() {
    child = AlternativesScreen();
    print("Alternatives button");
    _isAlternativesSelected = true;
    _isOffsetSelected = false;
    return child;
  }

  Widget showOffsetScreen() {
    child = OffsetScreen();
    _isOffsetSelected = true;
    _isAlternativesSelected = false;
    return child;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isOffsetSelected = true;
                          _isAlternativesSelected = false;
                          showOffsetScreen();
                        });
                      },
                      child: Chip(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          elevation: 1,
                          backgroundColor:
                              _isOffsetSelected ? Colors.green : Colors.black12,
                          label: Text(
                            'Offset',
                            style: TextStyle(
                                fontSize: _isOffsetSelected ? 18 : 16,
                                fontFamily: 'Lato',
                                color: _isOffsetSelected
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: _isOffsetSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isOffsetSelected = true;
                          _isAlternativesSelected = false;
                          showAlternatives();
                        });
                      },
                      child: Chip(
                          elevation: 1,
                          backgroundColor: _isAlternativesSelected
                              ? Colors.green
                              : Colors.black12,
                          label: Text(
                            'Alternatives',
                            style: TextStyle(
                                fontWeight: _isAlternativesSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                fontSize: _isAlternativesSelected ? 18 : 16,
                                fontFamily: 'Lato',
                                color: _isAlternativesSelected
                                    ? Colors.white
                                    : Colors.black),
                          )),
                    ),
                  ]),
            ),
            Expanded(
              child: Container(
                height: 400,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
