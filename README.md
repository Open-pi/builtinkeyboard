# built_in_keyboard

A flutter package to add built-in keyboard instead of system keyboards. This implementation rellies on a textInputField and interacts with it through a `TextEditingController`. 

## Usage
With the `builtInKeyboard` widget, you can easily select the `layoutType` of the keyboard and the look of the buttons with a `BoxDecoration`
```dart
BuiltInKeyboard(
  layoutType: 'EN',
  decoration: BoxDecoration(color: Colors.White)
)
```
