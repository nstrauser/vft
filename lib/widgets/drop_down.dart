import 'package:flutter/material.dart';

class MyDropDown extends StatelessWidget {
  MyDropDown({this.hint, this.value, this.items, this.onChanged});

  final hint;
  final value;
  final items;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      padding: EdgeInsets.only(left: 5.0, right: 1.0),
      width: 135.0,
      height: 30.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        color: Color(0xff85a2a6),
        border: Border.all(),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(

          icon: Icon(Icons.arrow_drop_down),
          iconSize: 22,
          style: Theme.of(context).textTheme.body2,
          hint: Text(
            hint,
            style: Theme.of(context).textTheme.body2,
          ),
          value: value,
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(

                value: value,
                child: Text(
                  value,
                  style: TextStyle(color: Colors.black),
                ));
          }).toList(),
        ),
      ),
    );
  }
}
