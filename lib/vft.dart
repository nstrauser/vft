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
backgroundColor: Color(0xff2d2d2d),
          body: SingleChildScrollView(
        child: SizedBox(
          width: 860.0,
          height: 490.0,
          child: Column(
            children: <Widget>[
              AppTitle(),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Row(children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
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
                      ScaleFrame(),
                      MySpacer(),
//                    Reset(onPressed: dataModel.resetToDefault),
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
                      SizedBox(height: 20.0,),
                    ],
                  ),
//                DrawFrames(
//                  aspectRatio: dataModel.sensorRatio,
//                  aspectRatioFrame: dataModel.userRatioInputExists(),
//                  scale: dataModel.drawScaleFrame(),
//                  color: dataModel.frameLineShowHide(),
//                  width: dataModel.frameBorderWidth(),
//                ),
                ]),
              ),
            ],
          ),
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
        margin: EdgeInsets.only(bottom: 10.0, right: 10.0),
        child: Text(
          "* Values to set on the camera.",
          style: Theme.of(context).textTheme.display2,
        ));
  }
}
