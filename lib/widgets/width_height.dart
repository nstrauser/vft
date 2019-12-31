import 'package:flutter/material.dart';

class WidthHeight extends StatelessWidget {
  WidthHeight({
    this.widthHeight,
    this.valueText,
    this.rowTitle,
    this.borderColor,
  });
  final widthHeight;
  final valueText;
  final rowTitle;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
          color: Colors.grey[700],
              border: Border.all(
                  color: borderColor,
                  width: 1.0)),
          margin: EdgeInsets.only(right: 10.0, top: 10.0,),
//          color: Colors.grey[700],
          padding: EdgeInsets.all(5.0),
          width: 62.0,
          height: 25.0,
          child: Text(
            valueText,
            style: Theme.of(context).textTheme.display3,
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 5.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                widthHeight,
                //textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.overline,
              ),
            )),
        SizedBox(height: 5.0),
      ],
    );
  }
}

