import 'package:flutter/material.dart';
import 'widgets/drop_down.dart';
import 'theme.dart';

class CameraSensor extends StatelessWidget {
  CameraSensor({this.onChanged, this.value, this.items});

  final Function onChanged;
  final value;
  final items;
  @override
  Widget build(BuildContext context) {
    return Row(



      children: <Widget>[
        Align(
          alignment: Alignment.bottomRight,
          child: OrangeTextFields(rowTitle: "Camera\nSensor"),
        ),
        MyDropDown(
          value: value,
          hint: '6K 3:2',
          items: items,
          onChanged: onChanged,
        )
      ],
    );
  }
}
