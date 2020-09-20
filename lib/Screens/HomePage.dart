import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutterchatbot/Screens/ChatPage.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
//                boxShadow: [
//                  BoxShadow(
//                    color: Colors.grey.withOpacity(0.4),
//                    spreadRadius: 5,
//                    blurRadius: 7,
//                    offset: Offset(0, 3), // changes position of shadow
//                  ),
//                ],
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Order Now',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          color: Color(0xffE64C3C),
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                        ),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  AvatarGlow(
                    endRadius: 40,
                    glowColor: Colors.red,
                    duration: Duration(milliseconds: 2000),
                    repeat: true,
                    child: GestureDetector(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white30,
                        backgroundImage: AssetImage('assets/chat&order.png'),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChatPage()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
