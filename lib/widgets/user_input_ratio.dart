import 'package:flutter/material.dart';
import 'package:vft/theme.dart';

class UserInputRatio extends StatelessWidget {
  UserInputRatio(
      {this.onChanged, this.validator, this.hintText, this.controller});
  final Function onChanged;
  final Function validator;
  final hintText;
  final controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 25.0,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        style: Theme.of(context).textTheme.display3,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[700],
          focusColor: kOrange,
          contentPadding: EdgeInsets.only(left: 8.0),
          labelStyle: TextStyle(),
          hintText: "$hintText",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(3.0)),
        ),
      ),
    );
  }
}
