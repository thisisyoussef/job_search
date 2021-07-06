import 'package:flutter/material.dart';

class VenueInfo extends StatelessWidget {
  const VenueInfo(
      {Key key,
      @required this.sports,
      this.name,
      this.price,
      this.area,
      this.rating,
      this.distance})
      : super(key: key);

  final List sports;
  final String name;
  final int price;
  final double rating;
  final String area;
  final int distance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: TextStyle(
            fontFamily: 'Chakra Petch',
            fontSize: 24,
            color: const Color(0xff2e2e2e),
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.left,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: price != null
              ? Row(
                  children: [
                    Text(
                      price.toString(),
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        color: const Color(0xff2e2e2e),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      " EGP/ Hour",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 17,
                        color: const Color(0xff2e2e2e),
                        letterSpacing: 0.96,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                )
              : Container(),
        ),
      ],
    );
  }
}
