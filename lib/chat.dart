import 'package:flutter/material.dart';

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

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = new TextEditingController();

  Widget _buildStateComposer() {
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new TextField(
        controller: _textController,
        onSubmitted: _handleSubmitted,
        decoration: new InputDecoration.collapsed(
            hintText: "Send a message"),
      ),
    );
  }

  void _handleSubmitted(String value) {
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    // Implements the basic material design visual layout structure
    return new Scaffold(
      appBar: new AppBar(title: new Text("Friendly Chat")),
      body: _buildStateComposer()
          /*new GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20.0),
        crossAxisSpacing: 10.0,
        crossAxisCount: 2,
        children: <Widget>[
          const Text('He\'d have you all unravel at the'),
          const Text('Heed not the rabble'),
          const Text('Sound of screams but the'),
          const Text('Who scream'),
          const Text('Revolution is coming...'),
          const Text('Revolution, they...'),
        ],
      )*/
    );
  }
}