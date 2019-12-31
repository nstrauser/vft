import 'package:flutter/material.dart';
import 'package:vft/theme.dart';

class DataModel extends ChangeNotifier {
  List<String> _sensorItems = [
    '6K 3:2',
    '6K 2.39:1',
    '6K 17:9',
    '6K 1.85:1',
    '6K 1.66:1',
    '5.7K 16:9',
    '4K 4:3',
    '4K 2.39:1',
    '4K 17:9',
    '3.8K 16:9',
  ];

  List<String> lensFactorItems = [
    '1.0',
    '1.3',
    '1.5',
    '1.8',
    '2.0',
  ];

  String selectedSensor = '6K 3:2';
  String selectedLensFactor = '1.0';

  List<String> get sensorItems => _sensorItems;

  dynamic get selected => selectedSensor;

  void updateSensor(String newValue) {
    selectedSensor = newValue;
    notifyListeners();
  }

  void updateLensFactor(String newValue) {
    selectedLensFactor = newValue;
    calcUserFrameHV();
    drawScaleFrame();
    notifyListeners();
  }

  // TODO: add lens factor with resolution and redraw frame


  num get sensorPxWidth => sensorModes[selectedSensor][0];
  num get sensorPxHeight => sensorModes[selectedSensor][1];

  dynamic userRatioWidth;
  dynamic userRatioHeight;

  void userInputRatioWidth(newValue) {
    userRatioWidth = newValue;
    notifyListeners();
    calcUserFrameHV();
  }

  void userInputRatioHeight(newValue) {
    userRatioHeight = newValue;
    notifyListeners();
    calcUserFrameHV();
  }

  void userRatioValidator(){
    print("user ratio validator");
  }

  num userPxWidth = 0;
  num userPxHeight = 0;

  num userFramePxWidth = 0;
  num userFramePxHeight = 0;

  num userFrameHorizontal = 0;
  num userFrameVertical = 0;

  // MAX HORIZONTAL VERTICAL FOR SONY VENICE USER FRAME LINE
  num _userFrameMaxHoriz = 479;
  num _userFrameMaxVert = 269;

  num get _newUserFrameHoriz => (_userFrameMaxVert * (_userFrameMaxHoriz / sensorRatioCalc) * (userRatio / _userFrameMaxVert)) * (double.parse(_scaleInputValue) / 100);
  num get _newUserFrameVert => (_userFrameMaxHoriz / (userRatio / sensorRatioCalc) * (_userFrameMaxHoriz / _userFrameMaxVert)) * (double.parse(_scaleInputValue) / 100);

  num get _newUserPxWidth => (sensorPxWidth * _newUserFrameHoriz / _userFrameMaxHoriz).round();
  num get _newUserPxHeight => (sensorPxHeight * _newUserFrameVert / _userFrameMaxVert).round();

  num get userRatio => double.parse(userRatioWidth) / double.parse(userRatioHeight);
  num get sensorRatio => sensorPxWidth / sensorPxHeight;
  num get sensorRatioCalc => sensorPxWidth / sensorPxHeight * double.parse(selectedLensFactor);

  //   CALCULATE USER FRAME LINE & USER FRAME LINE PIXEL RESOLUTION   //
  //
  dynamic calcUserFrameHV() {
    if (userRatioWidth == null || userRatioHeight == null || userRatioWidth == '' || userRatioHeight =='') {
      showHideUserFrame = false;
      userFrameLineBorder();
      print('width or height empty');
    }
      if (scaleInputValue == '') {
        scaleInputValue = '100';
      }

      if (sensorRatioCalc < userRatio) {
        print('sensor ratio calc is less $sensorRatioCalc');
        userFramePxWidth = (sensorPxWidth * (double.parse(_scaleInputValue) / 100)).round();
        userFramePxHeight = _newUserPxHeight.round();
        notifyListeners();
        userFrameHorizontal = (_userFrameMaxHoriz * (double.parse(_scaleInputValue) / 100)).round();
        userFrameVertical = _newUserFrameVert.round();
        notifyListeners();

      } else if (sensorRatioCalc > userRatio) {
        userFramePxWidth = _newUserPxWidth.round();
        userFramePxHeight = (sensorPxHeight * (double.parse(_scaleInputValue) / 100)).round();
        notifyListeners();
        userFrameHorizontal = _newUserFrameHoriz.round();
        userFrameVertical = (_userFrameMaxVert * (double.parse(_scaleInputValue) / 100)).round();
        notifyListeners();
        print('sensor ratio calc is more $sensorRatioCalc');
      }
      showHideUserFrame = true;
      userFrameLineBorder();
      frameLineShowHide();
    }

  //    SCALE FRAME LINE    //
  //
  String scaleInputValue = "100";
   String get _scaleInputValue => scaleInputValue;

  void updateScale(newValue) {
    if (double.parse(newValue) > 100) {
      print('updateScale: if');
      scaleInputValue = "100";
      notifyListeners();
      calcUserFrameHV();
      drawScaleFrame();

    } else if (newValue == '') {
      print('updateScale: if if');
      scaleInputValue = "100";
      notifyListeners();
      calcUserFrameHV();
      drawScaleFrame();
    } else {
      print('updateScale: else');
    scaleInputValue = newValue;
    notifyListeners();
    calcUserFrameHV();
    drawScaleFrame();
    }
  }

//  dynamic calcScaleFrame(value) {
//    if (scaleInputValue == null || scaleInputValue == '') {
//      print('calcScaleFrame: if');
//      calcUserFrameHV();
//      return 0;
//    } else if (userRatioWidth == null || userRatioHeight == null || userRatioWidth == '' || userRatioHeight =='') {
//      print('calcScaleFrame: else if == null');
//      return 0;
//    }
//    else if (scaleInputValue == '100') {
//      calcUserFrameHV();
//      print('calcScaleFrame: else if == 100');
//      return 0;
//    }
//    else {
//      print("scaleInputValue: $scaleInputValue");
//      return (((100 - double.parse(scaleInputValue)) * value) / 100).round();
//    }
//  }

  Color userFrameBorderColor = Colors.grey;
  void userFrameLineBorder() {
    if (userRatioWidth == null || userRatioHeight == null || userRatioWidth == '' || userRatioHeight =='') {
      userFrameBorderColor = Colors.grey;
    notifyListeners();
  } else {
    userFrameBorderColor = kOrange;
    notifyListeners();
  }
}

  //    DRAW FRAMES      //
  //
  dynamic drawScaleFrame() {
    if (scaleInputValue == null || scaleInputValue == '') {
      return 1.0;
    } else {
      return double.parse(scaleInputValue) / 100;
    }
  }

  double frameBorderWidth() {
    if (scaleInputValue == null || scaleInputValue == '') {
      return 1.5;
    } else if (double.parse(_scaleInputValue) == 100.0) {
      return 1.5;
    }
    else {
      // print((100 - double.parse(scaleInputValue)) * 0.1);
      return ((100 - double.parse(_scaleInputValue)) * 0.1).toDouble();
    }
  }

  Object frameLineShowHide() {
    if (userRatioWidth == null || userRatioHeight == null || userRatioWidth == '' || userRatioHeight =='') {
      return Colors.grey[700];
    } else {
      return Color(0xffd9ceb0);
    }
  }

  double userRatioInputExists(){
    if (userRatioWidth == null || userRatioHeight == null || userRatioWidth == '' || userRatioHeight =='') {
      return 1.0;
    } else {
      print('userRatioInputExists: else');
      return userRatio / double.parse(selectedLensFactor);
    }
  }

  num get drawSensorFrameWidth => sensorModes[selectedSensor][2];
  num get drawSensorFrameHeight => sensorModes[selectedSensor][3];

  double sensorOffsetX;
  double sensorOffsetY;

  double userDrawFrameWidth;
  double userDrawFrameHeight;
  double userDrawFrameOffsetX;
  double userDrawFrameOffsetY;
  bool showHideUserFrame = false;

}

const Map sensorModes = {
  '6K 3:2': [6048, 4032, 690.0, 460.0],
  '6K 2.39:1': [6048, 2534, 690.0, 288.0],
  '6K 17:9': [6054, 3192, 690.0, 364.0],
  '6K 1.85:1': [6054, 3272, 690.0, 374.0],
  '6K 1.66:1': [6054, 3632, 690.0, 416.0],
  '5.7K 16:9': [5674, 3192, 690.0, 388.0],
  '4K 4:3': [4096, 3024, 613.0, 460.0],
  '4K 2.39:1': [4096, 1716, 690.0, 288.0],
  '4K 17:9': [4096, 2160, 690.0, 364.0],
  '3.8K 16:9': [3840, 2160, 690.0, 388.0],
};

