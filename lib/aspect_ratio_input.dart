import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme.dart';
import 'model/data_model.dart';
import 'widgets/user_input_ratio.dart';

class UserRatio extends StatelessWidget {
  UserRatio({this.onChangedWidth,
    this.onChangedHeight,
    this.controllerWidth,
    this.controllerHeight,
  });

  final Function onChangedWidth;
  final Function onChangedHeight;
  final controllerWidth;
  final controllerHeight;
  @override
  Widget build(BuildContext context) {
    return Consumer<DataModel>(builder: (context, dataModel, child) {
      return Container(
        margin: EdgeInsets.all(10.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              OrangeTextFields(rowTitle: "User Aspect Ratio"),
              UserInputRatio(
                controller: controllerWidth,
                hintText: '0',
                onChanged: onChangedWidth,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(':', style: Theme.of(context).textTheme.display4),
              ),
              UserInputRatio(
                controller: controllerHeight,
                hintText: '0',
                onChanged: onChangedHeight,
              )
            ]),
      );
    });
  }
}

//typedef String Validator(String m);
//
//first(List<Validator> validators) => (Object o) => validators
//    .fold<String>(null, (String m, Validator v) => m ?? v(o));
//
//required(String m) => (Object o) => o == null ? m : null;
//
//equals(Object other, String m) => (Object o) => o != other ? m : null;
//
//notEquals(Object other, String m) => (Object o) => o == other ? m : null;
//
//minLength(String m, int l) => (String o) => o.length < l ? m : null;
//
//maxLength(String m, int l) => (String o) => o.length > l ? m : null;
//
//length(String m, int l) => (String o) => o.length > l ? m : null;
//
//isIn<T>(String m, List<T> l) => (T o) => !l.contains(o) ? m : null;
//
//isNotIn<T>(String m, List<T> l) => (T o) => l.contains(o) ? m : null;
