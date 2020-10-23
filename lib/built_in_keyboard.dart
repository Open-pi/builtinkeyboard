library built_in_keyboard;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuiltInKeyboard extends StatefulWidget {
  // layoutType of the keyboard
  final String layoutType;

  // TextStyle of the letters in the keys (fontsize, fontface)
  final TextStyle letterStyle;

  // Border radius of the keys
  final BorderRadius borderRadius;

  // Color of the keys
  final Color color;

  // The color displayed when the key is pressed
  final Color highlightColor;
  final Color splashColor;

  // The controller connected to the InputField
  final TextEditingController controller;

  // height and width of each key
  final double height;
  final double width;
  final double spacing;

  // the additional key that can be added to the keyboard
  final bool enableSpacebar;
  final bool enableBackSpace;

  // Additional functionality for the keys
  // Makes the keyboard uppercase
  final bool enableUppercaseAll;

  // Long press to write uppercase letters
  final bool enableLongPressUppercase;
  final Icon backspaceIcon;

  BuiltInKeyboard({
    @required this.controller,
    @required this.layoutType,
    this.letterStyle = const TextStyle(fontSize: 25, color: Colors.black),
    this.borderRadius,
    this.color = Colors.deepOrange,
    this.highlightColor,
    this.splashColor,
    this.height = 46.0,
    this.width = 35.0,
    this.spacing = 8.0,
    this.enableBackSpace = true,
    this.enableUppercaseAll = false,
    this.enableLongPressUppercase = false,
    this.enableSpacebar = false,
    this.backspaceIcon = const Icon(Icons.backspace_outlined, size: 26),
  });
  @override
  BuiltInKeyboardState createState() => BuiltInKeyboardState();
}

class BuiltInKeyboardState extends State<BuiltInKeyboard> {
  @override
  Widget build(BuildContext context) {
    List<Widget> keyboardLayout = layout(widget.layoutType);
    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 5,
          runSpacing: 5,
          children: keyboardLayout.sublist(0, 10),
        ),
        SizedBox(
          height: widget.spacing,
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 5,
          runSpacing: 5,
          children: keyboardLayout.sublist(10, 19),
        ),
        SizedBox(
          height: widget.spacing,
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 5,
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
      height: widget.height,
      width: widget.width,
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
            if (widget.enableLongPressUppercase && !widget.enableUppercaseAll) {
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
      height: widget.height,
      width: widget.width + 160,
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
      height: widget.height,
      width: widget.width + 20,
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
            child: widget.backspaceIcon,
          ),
        ),
      ),
    );
  }

  List<Widget> layout(String layoutType) {
    List<String> letters = [];
    if (layoutType == 'EN') {
      if (widget.enableUppercaseAll) {
        letters = 'qwertyuiopasdfghjklzxcvbnm'.toUpperCase().split("");
      } else {
        letters = 'qwertyuiopasdfghjklzxcvbnm'.split("");
      }
    } else if (layoutType == 'FR') {
      if (widget.enableUppercaseAll) {
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
    if (widget.enableBackSpace) {
      keyboard.add(backSpace());
    }
    return keyboard;
  }
}
