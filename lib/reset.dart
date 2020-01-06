import 'package:flutter/material.dart';
import 'theme.dart';

class Reset extends StatelessWidget {
  Reset({this.onPressed});

  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(right: 10.0, top: 15.0, bottom: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          color: kLightBlue,
        ),
        width: 70.0,
        height: 25.0,
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            'Reset',
            style: Theme.of(context).textTheme.body2,
          ),
        ),
      ),
    );
  }
}
