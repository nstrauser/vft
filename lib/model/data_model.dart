import 'package:flutter/material.dart';
import 'package:vft/theme.dart';

class DataModel extends ChangeNotifier {

  //  ------------- CAMERA SENSOR -----------------  //
  String selectedSensor = '6K 3:2';
  String selectedLensFactor = '1.0';

  List<String> get sensorItems => _sensorItems;

//  dynamic get selected => selectedSensor;

  void updateSensor(String newValue) {
    selectedSensor = newValue;
    notifyListeners();
  }
//  ------------- LENS FACTOR -----------------  //
  void updateLensFactor(String newValue) {
    selectedLensFactor = newValue;
    calcUserFrameHV();
    drawScaleFrame();
    notifyListeners();
  }

  //  ------------- ASPECT RATIO -----------------  //
  num get sensorPxWidth => sensorModes[selectedSensor][0];
  num get sensorPxHeight => sensorModes[selectedSensor][1];

  TextEditingController userRatioWidth = TextEditingController();
  TextEditingController userRatioHeight= TextEditingController();

  void userInputRatioWidth(newValue) {
    userRatioWidth.text = newValue;
    notifyListeners();
    calcUserFrameHV();
  }

  void userInputRatioHeight(newValue) {
    userRatioHeight.text = newValue;
    notifyListeners();
    calcUserFrameHV();
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

  num get _newUserFrameHoriz => (_userFrameMaxVert * (_userFrameMaxHoriz / sensorRatioCalc * userRatio / _userFrameMaxVert)) * (double.parse(scaleInputValue.text) / 100);
  num get _newUserFrameVert => (_userFrameMaxHoriz / (userRatio / sensorRatioCalc * _userFrameMaxHoriz / _userFrameMaxVert)) * (double.parse(scaleInputValue.text) / 100);

  num get _newUserPxWidth => (sensorPxWidth * _newUserFrameHoriz / _userFrameMaxHoriz).round();
  num get _newUserPxHeight => (sensorPxHeight * _newUserFrameVert / _userFrameMaxVert).round();

  num get userRatio => double.parse(userRatioWidth.text) / double.parse(userRatioHeight.text);
  num get sensorRatio => sensorPxWidth / sensorPxHeight;
  num get sensorRatioCalc => sensorPxWidth / sensorPxHeight * double.parse(selectedLensFactor);

  //   CALCULATE USER FRAME LINE & USER FRAME LINE PIXEL RESOLUTION   //
  dynamic calcUserFrameHV() {
    //TODO: FIX FORMULA
    if (userRatioWidth.text.isEmpty || userRatioHeight.text.isEmpty) {
      showHideUserFrame = false;
      userFrameLineBorder();
      print('width or height empty');
    }
      if (scaleInputValue.text.isEmpty) {
        scaleInputValue.text = '100';
      }

      if (sensorRatioCalc < userRatio) {
          print('sensor ratio calc is less $sensorRatioCalc');
          userFramePxWidth = (sensorPxWidth * (double.parse(scaleInputValue.text) / 100)).round();
          userFramePxHeight = _newUserPxHeight.round();
          notifyListeners();
          userFrameHorizontal = (_userFrameMaxHoriz * (double.parse(scaleInputValue.text) / 100)).round();
          userFrameVertical = _newUserFrameVert.round();
          notifyListeners();

      } else if (sensorRatioCalc > userRatio) {
        userFramePxWidth = _newUserPxWidth.round();
        userFramePxHeight = (sensorPxHeight * (double.parse(scaleInputValue.text) / 100)).round();
        notifyListeners();
        userFrameHorizontal = _newUserFrameHoriz.round();
        userFrameVertical = (_userFrameMaxVert * (double.parse(scaleInputValue.text) / 100)).round();
        notifyListeners();
        print('sensor ratio calc is more $sensorRatioCalc');
      }
      showHideUserFrame = true;
      userFrameLineBorder();
      frameLineShowHide();
    }

  //  ------------- SCALE -----------------  //
//  String scaleInputValue = "100";
  final scaleInputValue = TextEditingController();

  void updateScale(newValue) {
    if (double.parse(newValue) > 100) {
      scaleInputValue.text = "100";

      notifyListeners();
      calcUserFrameHV();

    } else if (scaleInputValue.text.isEmpty) {
      scaleInputValue.value = "100" as TextEditingValue;
      notifyListeners();
      calcUserFrameHV();
    }
    else {
    scaleInputValue.text = newValue;
    notifyListeners();
    calcUserFrameHV();
    }
  }

  // TODO: Reset To Default Button
  //  ------------- RESET TO DEFAULTS -----------------  //
//  void resetToDefault() {
//    updateSensor('6K 3:2');
//    updateLensFactor('1.0');
//    userRatioWidth.text = '0';
//    userRatioHeight.text = '0';
//    scaleInputValue.text = '100';
//    userRatioInputExists();
//    drawScaleFrame();
//    notifyListeners();
//  }

//  ------------- DRAW SENSOR/FRAME LINE -----------------  //
  Color userFrameBorderColor = Colors.grey;
  void userFrameLineBorder() {
    if (userRatioWidth.text.isEmpty || userRatioHeight.text.isEmpty) {
      userFrameBorderColor = Colors.grey;
    notifyListeners();

  } else {
    userFrameBorderColor = kOrange;
    notifyListeners();
  }
}
  dynamic drawScaleFrame() {
    if (scaleInputValue.text.isEmpty) {
      return 1.0;
    } else {
      return double.parse(scaleInputValue.text) / 100;
    }
  }

  double frameBorderWidth() {
    if (scaleInputValue.text.isEmpty) {
      return 1.5;
    } else if (double.parse(scaleInputValue.text) == 100.0) {
      return 1.5;
    }
    else {
      // print((100 - double.parse(scaleInputValue)) * 0.1);
      return ((100 - double.parse(scaleInputValue.text)) * 0.1).toDouble();
    }
  }

  bool showHideUserFrame = false;
  Object frameLineShowHide() {
    if (userRatioWidth.text.isEmpty || userRatioHeight.text.isEmpty) {
      return Colors.grey[700];
    } else {
      return Color(0xffd9ceb0);
    }
  }

  double userRatioInputExists(){
    if (userRatioWidth.text.isEmpty || userRatioHeight.text.isEmpty) {
      return 1.0;
    } else {
      print('userRatioInputExists: else');
      return (double.parse(userRatioWidth.text) / double.parse(userRatioHeight.text)) / double.parse(selectedLensFactor);
    }
  }


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

