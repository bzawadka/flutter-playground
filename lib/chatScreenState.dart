import 'package:flutter/material.dart';
import 'chat.dart';
import 'chatMessage.dart';

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isComposing = false;

  Widget _buildTextComposer() {
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        children: <Widget>[
          new Flexible(
              child: new TextField(
                  controller: _textController,
                  onChanged: (String text) {
                    setState(() {
                      _isComposing = text.length > 0;
                    });
                  },
                  onSubmitted: _handleMessageSubmitted,
                  decoration: new InputDecoration.collapsed(
                      hintText: "Send a message")
              )
          ),
          new Container(
            margin: new EdgeInsets.symmetric(horizontal: 4.0),
            child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: _isComposing
                    ? () => _handleMessageSubmitted(_textController.text)
                    : null,
            ),
          )
        ],
      ),
    );
  }

  void _handleMessageSubmitted(String text) {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
    ChatMessage chatMessage = new ChatMessage(
        messageText: text,
        animationController: new AnimationController(
            duration: new Duration(milliseconds: 200),
            vsync: this
        )
    );
    setState(() {
      _messages.insert(0, chatMessage);
    });
    chatMessage.animationController.forward();
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Implements the basic material design visual layout structure
    return new Scaffold(
        appBar: new AppBar(title: new Text("Friendly Chat")),
        body: new Column(
          children: <Widget>[
            new Flexible(
                child: new ListView.builder(
                  padding: new EdgeInsets.all(8.0),
                  reverse: true, // start from the bottom of the screen
                  itemBuilder: (_, int index) => _messages[index], // a function that builds each widget, Naming the first argument (build context) _ (underscore) is a convention to indicate that it won't be used
                  itemCount: _messages.length,
                )
            ),
            new Divider(height: 1.0), // a horizontal rule
            new Container( // as a parent of the text composer, which is useful for defining background images, padding, margins, and other common layout details
              decoration: new BoxDecoration(color: Theme.of(context).cardColor), // different background from the messages list
              child: _buildTextComposer(),
            )
          ],
        )

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