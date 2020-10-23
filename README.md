# built_in_keyboard

A flutter package to add built-in keyboard instead of system keyboards. This implementation relies on a textInputField and interacts with it through a `TextEditingController`. 

## Usage
First of all, add the package to your dependencies and run `flutter pub get`.
```yaml
dependencies:
  built_in_keyboard:
    git:
      url: https://github.com/Open-Segmentation-Systems/BuiltInKeyboard.git
      ref: main
```

With the `builtInKeyboard` widget, you can easily change the layout of the keyboard, the look and feel of the keys, etc.

Here are some attributes that you could change. keep in mind that the controller is required to make the keyboard work correctly.
```dart
BuiltInKeyboard(
  controller: this.textController, // required
  layoutType: 'EN', // Only QWERTY and AZERTY are currently available
  enableUppercaseAll: true, // makes the keys uppercase
  borderRadius: BorderRadius.circular(8.0), // changes the border radius of the key
  letterStyle: TextStyle(fontSize: 25, color: Colors.black) // styles the text inside a key
)
```
### Additional options and flags
Option | Required | By default | Description
--- | --- | --- | ---
**controller** | yes | - | `TextEditingController`
**layoutType** | yes | - | the layout of the keyboard
**letterStyle** | no | fontSize: 25, color: black | `TextStyle` of the letters
**borderRadius** | no | - | the radius of the keys
**color** | no | deepOrange | color of the keys (keyboard color)
**highlightColor** | no | - | color when pressed
**splashColor** | no | - | color when pressed (material style)
**height** | no | - | height of keys
**width** | no | - | width of keys
**spacing** | no | - | the spacing between each row
**enableBackSpace** | no | - | adds a backspace button.
**enableUppercaseAll** | no | - | makes the keyboard uppercase
**enableLongPressUppercase** | no | - | writes an uppercase when long pressing on the keys
**enableSpacebar** | no | - | adds a spacebar
**backspaceIcon** | no | - | adds a backspace icon.
