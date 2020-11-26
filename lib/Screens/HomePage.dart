import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterchatbot/Data/coffeePackages.dart';
import 'package:flutterchatbot/Screens/ChatPage.dart';
import 'package:flutterchatbot/Widgets/coffeeContainer.dart';
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
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      'Our Coffee Shop',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: AvatarGlow(
                  endRadius: 20,
                  glowColor: Colors.black,
                  duration: Duration(milliseconds: 2000),
                  repeat: true,
                  child: GestureDetector(
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white30,
                      backgroundImage: AssetImage(
                        'assets/order.png',
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatPage()),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Container(
                height: 130,
//                width: 330,
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 130,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/promo.gif"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Daily Promo',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'BAJA LATTE',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 20,
                              color: Color(0xff322e2f),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'from Drive Coffee',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 15,
                              color: Color(0xff322e2f),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '\$ 8.00',
                          textAlign: TextAlign.end,
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 20,
                              color: Color(0xff322e2f),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Popular Products',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 280.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: packages.length,
                itemBuilder: (context, index) {
                  var package = packages[index];
                  return CoffeeContainer(
                    name: package["name"],
                    img: package['img'],
                    price: package['price'],
                    rate: package['rate'],
                    color: package['color'],
                  );
                }),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Newest Products',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 280.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: packages.length,
                itemBuilder: (context, index) {
                  var package = packages[packages.length - (index + 1)];
                  return CoffeeContainer(
                    name: package["name"],
                    img: package['img'],
                    price: package['price'],
                    rate: package['rate'],
                    color: package['color'],
                  );
                }),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
