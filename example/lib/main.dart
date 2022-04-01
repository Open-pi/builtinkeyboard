import 'package:built_in_keyboard/language.dart';
import 'package:flutter/material.dart';
import 'package:built_in_keyboard/built_in_keyboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Built In Keyboard Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Built In Keyboard Test Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    TextEditingController textController = new TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Built In Keyboard'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: TextFormField(
              controller: textController,
              readOnly: true,
              keyboardType: TextInputType.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.indigo[900],
                fontSize: 22.0,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(21.0, 0.0, 0.0, 0.0),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(width: 3.0, color: Colors.deepOrange),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(width: 3.0, color: Colors.deepOrange),
                ),
                hintText: 'try it...',
                hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 3),
            child: BuiltInKeyboard(
              language: Language.EN,
              layout: Layout.QWERTY,
              borderRadius: BorderRadius.circular(8),
              controller: textController,
              enableLongPressUppercase: true,
              enableSpaceBar: true,
              enableBackSpace: true,
              enableCapsLock: true,
            ),
          ),
        ],
      ),
    );
  }
}
