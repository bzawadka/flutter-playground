import 'package:flutter/material.dart';

import 'chatMessage.dart';
import 'chatScreenState.dart';

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
      theme: new ThemeData(
          primarySwatch: Colors.blue
      ),
      home: new ChatScreen(),
    );
  }
}

// A widget that has mutable state.
class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}
