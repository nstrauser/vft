import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter(RegExp('^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$'))
          ],
        controller: controller,
        onChanged: onChanged,
        style: Theme.of(context).textTheme.display3,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[700],
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: kOrange, width: 2.0),
          borderRadius: BorderRadius.circular(3.0)),
          contentPadding: EdgeInsets.only(left: 8.0),
          labelStyle: TextStyle(),
          hintText: "$hintText",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(3.0)),
        ),
      ),
    );
  }
}

