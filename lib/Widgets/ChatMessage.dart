import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  Row alphaMessage(context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Container(
        margin: const EdgeInsets.only(right: 10.0),
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
//            Text(
//              this.name,
//              style: TextStyle(fontWeight: FontWeight.bold),
//            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0, right: 50),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
                color: Colors.black54,
              ),
              child: Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
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
//              Text(
//                this.name,
//                style: TextStyle(fontWeight: FontWeight.bold),
//              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0, left: 50, right: 10),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                  color: Color(0xff38ef7d),
                ),
                child: Text(
                  text,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        Container(
//          margin: const EdgeInsets.only(left: 10.0),
//          child: CircleAvatar(
//            backgroundColor: Colors.black,
//            backgroundImage: AssetImage('assets/person.png'),
////              child: Text(
////                this.name[0],
////                style:
////                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
////              )
//          ),
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
