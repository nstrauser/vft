import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/user_input_scale.dart';
import 'model/data_model.dart';
import 'theme.dart';

class ScaleFrame extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<DataModel>(
      builder: (context, dataModel, child) {
        return Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                OrangeTextFields(rowTitle: "Scale"),
                UserInputScale(),
                SizedBox(
                  width: 85.0,
                ),
              ]),
        );
      },
    );
  }
}
