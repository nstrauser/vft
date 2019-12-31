import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'camera_sensor.dart';
import 'draw_frame.dart';
import 'lens_factor.dart';
import 'scale.dart';
import 'sensor_res.dart';
import 'user_frame_line_output.dart';
import 'user_frame_line_res.dart';
import 'aspect_ratio_input.dart';
import 'widgets/spacer.dart';
import 'widgets/app_title.dart';
import 'model/data_model.dart';

class Vft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataModel>(builder: (context, dataModel, child) {
      return Scaffold(
          appBar: AppBar(
            title: AppTitle(),
            backgroundColor: Colors.black87,
            elevation: 8.0,
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Row(children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    CameraSensor(
                        value: dataModel.selectedSensor,
                        items: dataModel.sensorItems,
                        onChanged: (String newValue) {
                          dataModel.updateSensor(newValue);
                          dataModel.calcUserFrameHV();
                        }),
                    UserRatio(
                      onChangedWidth: (newText) {
                        dataModel.userInputRatioWidth(newText);
                      },
                      onChangedHeight: (newText) {
                        dataModel.userInputRatioHeight(newText);
                      },
                    ),
                    LensFactor(
                        items: dataModel.lensFactorItems,
                        value: dataModel.selectedLensFactor,
                        onChanged: (newValue) {
                          dataModel.updateLensFactor(newValue);
                        }),
                    ScaleFrame(
//                        controller: dataModel.scaleInputValue,
//                        validator: (value) {
//                          if (double.parse(value) > 0 &&
//                              double.parse(value) < 101) {
//                            value = value;
//                          } else {
//                            value = "100";
//                          }
//                        },
                        onChanged: (newValue) {
                          dataModel.updateScale(newValue);
                        }),
                    MySpacer(),
                    SensorReso(
                      sensorWidth: "${dataModel.sensorPxWidth}",
                      sensorHeight: "${dataModel.sensorPxHeight}",
                    ),
                    UserFrameReso(
                      userRatioInputH: "${dataModel.userFramePxWidth}",
                      userRatioInputV: "${dataModel.userFramePxHeight}",
                    ),
                    UserFrameLine(
                      borderColor: dataModel.userFrameBorderColor,
                      userFrameH: "${dataModel.userFrameHorizontal}",
                      userFrameV: "${dataModel.userFrameVertical}",
                    ),
                    MyComment(),
                  ],
                ),
                Expanded(
                  child: DrawFrames(
                    aspectRatio: dataModel.sensorRatio,
                    aspectRatioFrame: dataModel.userRatioInputExists(),
                    scale: dataModel.drawScaleFrame(),
                    color: dataModel.frameLineShowHide(),
                    width: dataModel.frameBorderWidth(),
                  ),
                ),
              ]),
            ),
          ));
    });
  }
}

//
class MyComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10.0, right: 10.0),
        child: Text(
          "* Use these horizontal vertical values\nto create a custom user frame line.",
          style: Theme.of(context).textTheme.display2,
        ));
  }
}
