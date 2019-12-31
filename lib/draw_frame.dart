import 'package:flutter/material.dart';

class DrawFrames extends StatelessWidget {
  DrawFrames(
      {this.aspectRatio,
      this.aspectRatioFrame,
      this.scale,
      this.color,
      this.width});

  final aspectRatio;
  final aspectRatioFrame;
  final scale;
  final color;
  final width;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Stack(children: <Widget>[
          Container(color: Colors.grey[700]),
          FrameLine(
            aspectRatioFrame: aspectRatioFrame,
            scale: scale,
            color: color,
            width: width,
          ),
        ]),
      ),
    );
  }
}

class FrameLine extends StatelessWidget {
  FrameLine({this.aspectRatioFrame, this.scale, this.color, this.width});

  final aspectRatioFrame;
  final scale;
  final color;
  final width;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: aspectRatioFrame,
        child: Transform.scale(
          scale: scale,
          child: Container(
              decoration: BoxDecoration(
            border: Border.all(color: color, width: width),
            //child: Text("My Awesome Border"),
          )),
        ),
      ),
    );
  }
}
