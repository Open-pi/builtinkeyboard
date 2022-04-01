# built_in_keyboard

A flutter package to add built-in keyboard instead of system keyboards. This implementation relies on a textInputField and interacts with it through a `TextEditingController`. 

<p align="center">
  <img src="https://raw.githubusercontent.com/Open-Segmentation-Systems/BuiltInKeyboard/main/BIKST.png" width="55%">
</p>

## Usage
First of all, add the package to your dependencies and run `flutter pub get`.
```yaml
dependencies:
  built_in_keyboard:
    git:
      url: https://github.com/Open-pi/builtinkeyboard.git
      ref: main
```

With the `BuiltInKeyboard` widget, you can easily change the layout of the keyboard, the look and feel of the keys, etc.

Here are some attributes that you could change. keep in mind that the controller is required to make the keyboard work correctly.
```dart
BuiltInKeyboard(
  controller: this.textController, // required
  layoutType: 'EN', // required, Only QWERTY and AZERTY are currently available
  enableSpaceBar: true, // optional, add a spacebar
  enableBackSpace: true, // optional, add a backspace button
  enableCapsLock: true, // optional, add a Caps Lock button
  borderRadius: BorderRadius.circular(8.0), // changes the border radius of the keys
  letterStyle: TextStyle(fontSize: 25, color: Colors.black) // styles the text inside the keys
)
```
### Additional options and flags
Option | Required | By default | Description
--- | --- | --- | ---
**controller** | yes | - | `TextEditingController`
**layoutType** | yes | - | the layout of the keyboard
**height** | no | - | height of keys
**width** | no | - | width of keys
**spacing** | no | 8.0 | the spacing between each row
**borderRadius** | no | - | the radius of the keys
**letterStyle** | no | fontSize: 25, color: black | `TextStyle` of the letters
**color** | no | deepOrange | color of the keys (keyboard color)
**enableSpacebar** | no | false | adds a spacebar
**enableBackSpace** | no | true | adds a backspace button
**enableCapsLock** | no | false | adds a Caps Lock button
**enableAllUppercase** | no | false | makes the keyboard uppercase
**enableLongPressUppercase** | no | false | writes an uppercase when long pressing on the keys
**highlightColor** | no | - | color when pressed
**splashColor** | no | - | color when pressed (material style)
