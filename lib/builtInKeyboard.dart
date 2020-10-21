library builtInKeyboard;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuiltInKeyboard extends StatefulWidget {
  final String layoutType;
  final BoxDecoration decoration;
  final TextEditingController controller;
  BuiltInKeyboard({this.controller, this.layoutType, this.decoration});
  @override
  BuiltInKeyboardState createState() => BuiltInKeyboardState();
}

class BuiltInKeyboardState extends State<BuiltInKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 5,
      runSpacing: 5,
      children: layout(widget.layoutType),
    );
  }

  Widget buttonLetter(String letter) {
    return InkWell(
      onTap: () => widget.controller.text += letter,
      child: Container(
          decoration: widget.decoration,
          height: 30,
          width: 30,
          child: Center(
            child: Text(letter,
                style: TextStyle(fontSize: 25, color: Colors.black)),
          )),
    );
  }

  List<Widget> layout(String layoutType) {
    List<String> letters = [];
    if (layoutType == 'EN') {
      letters = 'QWERTYUIOPASDFGHJKLZXCVBNM'.split("");
    } else if (layoutType == 'FR') {
      letters = 'azertyuiopqsdfghjklmwxcvbn'.split("");
    }

    List<Widget> keyboard = [];
    letters.forEach((String letter) {
      keyboard.add(buttonLetter(letter));
    });
    return keyboard;
  }
}
