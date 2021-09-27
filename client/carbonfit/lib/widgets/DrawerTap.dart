import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class DrawerTap extends StatelessWidget {
  final Widget child;
  final String text;
  DrawerTap({Key? key, required this.text, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(PageTransition(child: child, type: PageTransitionType.fade));
      },
      child: Text(
        text,
        style:
            TextStyle(fontFamily: 'Lato', color: Colors.black87, fontSize: 22),
      ),
    );
  }
}
