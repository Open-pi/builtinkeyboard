library builtInKeyboard;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuiltInKeyboard extends StatefulWidget {
  final String layoutType;
  BuiltInKeyboard(this.layoutType);
  @override
  BuiltInKeyboardState createState() => BuiltInKeyboardState();
}

class BuiltInKeyboardState extends State<BuiltInKeyboard> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.only(left: 5, right: 5),
      crossAxisCount: 10,
      crossAxisSpacing: 3,
      mainAxisSpacing: 10,
      children: layout(widget.layoutType),
    );
  }

  Widget buttonLetter(String letter) {
    return ButtonTheme(
      height: 100,
      child: RaisedButton(
          onPressed: () => letter,
          child: Text(letter,
              style: TextStyle(fontSize: 20, color: Colors.black))),
    );
  }

  List<Widget> layout(String layoutType) {
    List<String> letters = [];
    if (layoutType == 'EN') {
      letters = 'qwertyuiopasdfghjklzxcvbnm'.split("");
    } else if (layoutType == 'FR') {
      letters = 'azertyuiopqsdfghjklmwxcvbn'.split("");
    }

    List<Widget> keyboard = [];
    letters.forEach((String letter) {
      keyboard.add(buttonLetter(letter));
    });
    keyboard.add(buttonLetter('Done =>'));
    return keyboard;
  }
}
