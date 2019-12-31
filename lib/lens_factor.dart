import 'package:flutter/material.dart';
import 'widgets/drop_down.dart';
import 'theme.dart';

class LensFactor extends StatelessWidget {
  LensFactor({this.value, this.onChanged, this.items});

  final value;
  final onChanged;
  final items;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(child: OrangeTextFields(rowTitle: "Lens Factor")),
          MyDropDown(
            value: value,
            hint: '1.0',
            items: items,
            onChanged: onChanged,
          ),
        ]);
  }
}
