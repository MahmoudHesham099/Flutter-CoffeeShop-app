import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage({this.message, this.name, this.type, this.imageUri});

  final String message;
  final String name;
  final bool type;
  final String imageUri;

  Row alphaMessage(context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Container(
        margin: const EdgeInsets.only(right: 10.0),
        child: CircleAvatar(
          radius: 18,
//          backgroundImage: AssetImage('assets/robot.png'),
          backgroundColor: Color(0xffFF5722),
          child: Icon(
            Icons.computer,
            color: Colors.white,
          ),
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 50),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                  topLeft: Radius.circular(5.0),
                ),
                color: Colors.black54,
              ),
              child: Column(
                children: [
                  Text(
                    message,
                    style: TextStyle(color: Colors.white),
                  ),
                  imageUri == null
                      ? Container()
                      : CachedNetworkImage(
                          imageUrl: imageUri,
                        ),
                ],
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
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0),
                    bottomLeft: Radius.circular(5.0),
                  ),
                  color: Color(0xffFF5722),
                ),
                child: Text(
                  message,
                  style: TextStyle(color: Colors.white),
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
