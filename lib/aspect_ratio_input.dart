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
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              OrangeTextFields(rowTitle: "User\n  Aspect Ratio"),
              UserInputRatio(
                controller: controllerWidth,
                hintText: '0',
                onChanged: onChangedWidth,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(':', style: Theme.of(context).textTheme.display1),
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
