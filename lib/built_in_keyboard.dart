library built_in_keyboard;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuiltInKeyboard extends StatefulWidget {
  // layoutType of the keyboard
  final String layoutType;

  // The controller connected to the InputField
  final TextEditingController controller;

  // Vertical spacing between key rows
  final double spacing;

  // Border radius of the keys
  final BorderRadius borderRadius;

  // Color of the keys
  final Color color;

  // TextStyle of the letters in the keys (fontsize, fontface)
  final TextStyle letterStyle;

  // the additional key that can be added to the keyboard
  final bool enableSpacebar;
  final bool enableBackSpace;

  // height and width of each key
  final double height;
  final double width;

  // Additional functionality for the keys //

  // Makes the keyboard uppercase
  final bool enableAllUppercase;

  // Long press to write uppercase letters
  final bool enableLongPressUppercase;

  // The color displayed when the key is pressed
  final Color highlightColor;
  final Color splashColor;

  BuiltInKeyboard({
    @required this.controller,
    @required this.layoutType,
    this.height,
    this.width,
    this.spacing = 8.0,
    this.borderRadius,
    this.color = Colors.deepOrange,
    this.letterStyle = const TextStyle(fontSize: 25, color: Colors.black),
    this.enableSpacebar = false,
    this.enableBackSpace = true,
    this.enableAllUppercase = false,
    this.enableLongPressUppercase = false,
    this.highlightColor,
    this.splashColor,
  });
  @override
  BuiltInKeyboardState createState() => BuiltInKeyboardState();
}

class BuiltInKeyboardState extends State<BuiltInKeyboard> {
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height * 0.057;
    width = screenWidth > 350 ? screenWidth * 0.084 : screenWidth * 0.082;
    List<Widget> keyboardLayout = layout(widget.layoutType);
    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 6,
          runSpacing: 5,
          children: keyboardLayout.sublist(0, 10),
        ),
        SizedBox(
          height: widget.spacing,
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 6,
          runSpacing: 5,
          children: keyboardLayout.sublist(10, 19),
        ),
        SizedBox(
          height: widget.spacing,
        ),
        widget.enableBackSpace
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: (widget.width ?? width) + 20, height: 0.0),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 6,
                    runSpacing: 5,
                    children: keyboardLayout.sublist(19),
                  ),
                  backSpace(),
                ],
              )
            : Wrap(
                alignment: WrapAlignment.center,
                spacing: 6,
                runSpacing: 5,
                children: keyboardLayout.sublist(19),
              ),
        widget.enableSpacebar
            ? Column(
                children: [
                  SizedBox(
                    height: widget.spacing,
                  ),
                  spaceBar(),
                ],
              )
            : SizedBox(),
      ],
    );
  }

  Widget buttonLetter(String letter) {
    return Container(
      height: widget.height ?? height,
      width: widget.width ?? width,
      child: Material(
        type: MaterialType.button,
        color: widget.color,
        borderRadius: widget.borderRadius,
        child: InkWell(
          highlightColor: widget.highlightColor,
          splashColor: widget.splashColor,
          onTap: () {
            widget.controller.text += letter;
            widget.controller.selection = TextSelection.fromPosition(
                TextPosition(offset: widget.controller.text.length));
          },
          onLongPress: () {
            if (widget.enableLongPressUppercase && !widget.enableAllUppercase) {
              widget.controller.text += letter.toUpperCase();
              widget.controller.selection = TextSelection.fromPosition(
                  TextPosition(offset: widget.controller.text.length));
            }
          },
          child: Center(
            child: Text(
              letter,
              style: widget.letterStyle,
            ),
          ),
        ),
      ),
    );
  }

  Widget spaceBar() {
    return Container(
      height: widget.height ?? height,
      width: (widget.width ?? width) + 160,
      child: Material(
        type: MaterialType.button,
        color: widget.color,
        borderRadius: widget.borderRadius,
        child: InkWell(
          highlightColor: widget.highlightColor,
          splashColor: widget.splashColor,
          onTap: () {
            widget.controller.text += ' ';
            widget.controller.selection = TextSelection.fromPosition(
                TextPosition(offset: widget.controller.text.length));
          },
          child: Center(
            child: Text(
              '_________',
              style: widget.letterStyle,
            ),
          ),
        ),
      ),
    );
  }

  Widget backSpace() {
    return Container(
      height: widget.height ?? height,
      width: (widget.width ?? width) + 20,
      child: Material(
        type: MaterialType.button,
        color: widget.color,
        borderRadius: widget.borderRadius,
        child: InkWell(
          highlightColor: widget.highlightColor,
          splashColor: widget.splashColor,
          onTap: () {
            if (widget.controller.text.isNotEmpty) {
              widget.controller.text = widget.controller.text
                  .substring(0, widget.controller.text.length - 1);
              widget.controller.selection = TextSelection.fromPosition(
                  TextPosition(offset: widget.controller.text.length));
            }
          },
          onLongPress: () {
            if (widget.controller.text.isNotEmpty) {
              widget.controller.text = '';
              widget.controller.selection = TextSelection.fromPosition(
                  TextPosition(offset: widget.controller.text.length));
            }
          },
          child: Center(
            child: Icon(
              Icons.backspace,
              size: widget.letterStyle.fontSize,
              color: widget.letterStyle.color,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> layout(String layoutType) {
    List<String> letters = [];
    if (layoutType == 'EN') {
      if (widget.enableAllUppercase) {
        letters = 'qwertyuiopasdfghjklzxcvbnm'.toUpperCase().split("");
      } else {
        letters = 'qwertyuiopasdfghjklzxcvbnm'.split("");
      }
    } else if (layoutType == 'FR') {
      if (widget.enableAllUppercase) {
        letters = 'azertyuiopqsdfghjklmwxcvbn'.toUpperCase().split("");
      } else {
        letters = 'azertyuiopqsdfghjklmwxcvbn'.split("");
      }
    }

    List<Widget> keyboard = [];
    letters.forEach((String letter) {
      keyboard.add(
        buttonLetter(letter),
      );
    });
    return keyboard;
  }
}
