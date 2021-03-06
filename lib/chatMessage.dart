import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  ChatMessage({this.messageText, this.animationController});

  final String messageText;
  final AnimationController animationController;

  static const String _senderName = "dafi";

  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
        sizeFactor: new CurvedAnimation(
            parent: animationController, curve: Curves.bounceOut),
        axisAlignment: 0.0,
        child: new Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start, // the parent is a Row widget whose main axis is horizontal, so CrossAxisAlignment.start gives it the highest position along the vertical axis
            children: <Widget>[
              new Container( // avatar
                margin: const EdgeInsets.only(left: 4.0, right: 10.0),
                child: new CircleAvatar(child: new Text(_senderName[0])),
              ),
              new Expanded(
                child: new Column( // username & message
                  crossAxisAlignment: CrossAxisAlignment.start, // For messages, the parent is a Column widget whose main axis is vertical, so CrossAxisAlignment.start aligns the text at the furthest left position along the horizontal axis
                  children: <Widget>[                           // display the sender's name on top and the text of the message below
                    new Text(_senderName, style: Theme.of(context).textTheme.subhead), // To style the sender's name and make it larger than the message text
                    new Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: new Text(messageText),
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
