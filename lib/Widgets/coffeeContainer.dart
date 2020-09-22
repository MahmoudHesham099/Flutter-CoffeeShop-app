import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeContainer extends StatelessWidget {
  final String name;
  final String img;
  final double price;
  final double rate;
  final Color color;

  const CoffeeContainer(
      {Key key, this.name, this.img, this.price, this.rate, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 180,
        height: 230,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
//          boxShadow: [
//            BoxShadow(
//              color: Colors.grey.withOpacity(0.5),
//              spreadRadius: 3,
//              blurRadius: 3,
//              offset: Offset(3, 3), // changes position of shadow
//            ),
//          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                img,
                height: 200,
              ),
              Column(
//                          crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        price.toString(),
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
//                                  crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 20,
                          ),
                          Text(
                            rate.toString(),
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
