import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  Row alphaMessage(context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Container(
        margin: const EdgeInsets.only(right: 16.0),
        child: CircleAvatar(
          radius: 18,
          backgroundImage: AssetImage('assets/robot.png'),
          backgroundColor: Colors.white,
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              this.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(text),
            ),
          ],
        ),
      ),
    ]);
  }

  Row myMessage(context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                this.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(text),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
              child: Text(
            this.name[0],
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: this.type ? myMessage(context) : alphaMessage(context));
  }
}
