import 'package:flutter/material.dart';
import 'package:vft/theme.dart';
import 'package:vft/model/data_model.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class UserInputScale extends StatelessWidget {
  UserInputScale({this.validator, this.controller, this.scaleKey});
  final Function validator;

  final controller;
  final scaleKey;

  @override
  Widget build(BuildContext context) {
    return Consumer<DataModel>(builder: (context, dataModel, child) {
      return Container(
        width: 60.0,
        height: 25.0,
        child: TextFormField(
          inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter(RegExp(r'^[1-9][0-9]?$|^100$')),
      ],
          controller: dataModel.scaleInputValue,
          onChanged: (newValue) {
            dataModel.updateScale(newValue);
          },
          style: Theme.of(context).textTheme.display3,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 8.0),
            labelStyle: TextStyle(),
            hintText: "100%",
            filled: true,
            fillColor: Colors.grey[700],
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kOrange, width: 2.0),
                borderRadius: BorderRadius.circular(3.0)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(3.0)),
          ),
        ),
      );
    });
  }
}

