import 'package:flutter/material.dart';
import 'theme.dart';
import 'widgets/width_height.dart';

class UserFrameLine extends StatelessWidget {
  UserFrameLine({this.userFrameH, this.userFrameV, this.borderColor});

  final userFrameH;
  final userFrameV;
  final borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("*",
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.display3,
                  ),

                  Container(
                      margin: EdgeInsets.only(left: 5.0),
                      child: OrangeTextFields(rowTitle: "User\nFrame Line")),
                ],
              ),
            ),
            Container(
                child: WidthHeight(
                  borderColor: borderColor,
                  widthHeight: "Horizontal",
                  valueText: userFrameH,
                )),
            Container(
              child: WidthHeight(
                borderColor: borderColor,
                widthHeight: 'Vertical',
                valueText: userFrameV,
              ),
            )
          ],
        ));
  }
}