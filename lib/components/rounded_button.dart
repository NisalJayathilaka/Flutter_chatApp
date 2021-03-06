import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String title;
  final Color colour;
  final VoidCallback onpress;
  RoundedButtonWidget(this.title, this.colour,  this.onpress);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onpress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}