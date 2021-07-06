import 'package:flutter/material.dart';

class UserInputField extends StatefulWidget {
  const UserInputField({
    Key key,
    this.callback,
  }) : super(key: key);
  final Function callback;
  @override
  _UserInputFieldState createState() => _UserInputFieldState();
}

class _UserInputFieldState extends State<UserInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18, bottom: 8, top: 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Search for Job",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 15,
                color: const Color(0xffffffff),
                letterSpacing: 0.8,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Container(
          width: 327,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: const Color(0x34ffffff),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
            style: TextStyle(color: Colors.white),
            cursorColor: Color(0xFF50B184),
            textAlign: TextAlign.center,
            onChanged: (value) {
              widget.callback(value);
            },
          ),
        ),
      ],
    );
  }
}
