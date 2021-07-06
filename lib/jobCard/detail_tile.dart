import 'package:flutter/material.dart';

class DetailTile extends StatelessWidget {
  //const AmenityTile({Key key, this.amentiy}) : super(key: key);
  const DetailTile(this.detail, this.fontSize);
  final String detail;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: fontSize > 16 ? 120 : 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            children: [
              Container(
                //width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color(0x65d1eacc),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 7.0),
                        child: Text(
                          detail == "full_time"
                              ? "Full-time"
                              : detail == "part_time"
                                  ? "Part-time"
                                  : detail == "contract"
                                      ? "Contract"
                                      : detail,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: fontSize,
                            color: const Color(0xff2b8116),
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
