import 'package:flutter/material.dart';
import 'widgets/width_height.dart';
import 'package:provider/provider.dart';
import 'model/data_model.dart';
import 'theme.dart';

class SensorReso extends StatelessWidget {
  SensorReso({this.sensorWidth, this.sensorHeight});

  final sensorWidth;
  final sensorHeight;

  @override
  Widget build(BuildContext context) {
    return Consumer<DataModel>(
      builder: (context, dataModel, child) {
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  OrangeTextFields(rowTitle: "Sensor Resolution"),
                ],
              ),
              WidthHeight(
                borderColor: Colors.grey,
                widthHeight: 'Width',
                valueText: dataModel.sensorPxWidth.toString(),
              ),
              WidthHeight(
                borderColor: Colors.grey,
                widthHeight: 'Height',
                valueText: dataModel.sensorPxHeight.toString(),
              ),
            ],
          ),
        );
      },
    );
  }
}
