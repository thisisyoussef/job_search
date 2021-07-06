import 'package:flutter/material.dart';

class VenuePageHeader extends StatelessWidget {
  const VenuePageHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 227,
            child: Container(
              color: Colors.red,
              height: 200,
              width: 300,
            )),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.black.withOpacity(0.8),
                Color(0xFF707070).withOpacity(0.6),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            height: 88,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ],
    );
  }
}
