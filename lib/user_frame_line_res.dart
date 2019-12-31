import 'package:flutter/material.dart';
import 'theme.dart';
import 'widgets/width_height.dart';

class UserFrameReso extends StatelessWidget {
  final userRatioInputH;
  final userRatioInputV;

  UserFrameReso({this.userRatioInputH, this.userRatioInputV});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(

                padding: EdgeInsets.only(top: 20.0),
                child: OrangeTextFields(rowTitle: "Frame Line Resolution")),
            WidthHeight(
              borderColor: Colors.grey,
              widthHeight: 'Width',
              valueText: userRatioInputH,
            ),
            WidthHeight(
              borderColor: Colors.grey,
              widthHeight: 'Height',
              valueText: userRatioInputV,
            ),
          ],
        ));
  }
}
