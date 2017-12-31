import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'chatScreenState.dart';

// https://material.io/guidelines/style/color.html#color-usability
final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light
);

final ThemeData kDefaultTheme = new ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400]
);

void main() {
  runApp(new FriendlyChatApp());
}

// A stateless widget is a widget that describes part of the user interface by building
// a constellation of other widgets that describe the user interface more concretely
class FriendlyChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "FriendlyChat",
      theme: defaultTargetPlatform == TargetPlatform.iOS
        ? kIOSTheme
        : kDefaultTheme,
      home: new ChatScreen(),
    );
  }
}

// A widget that has mutable state.
class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}
