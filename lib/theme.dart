import "package:flutter/material.dart";

const kOrange = Color(0xfff15a24);
const kOffWhite =Color(0xffd9ceb0);
const kLightBlue = Color(0xff85a2a6);
const kBlack = Color(0xff1A1F61);
const kBackground = Colors.black87;

ThemeData basicTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
      headline: base.headline.copyWith(
        // orange
        fontFamily: 'Roboto',
        fontSize: 24.0,
        color: Color(0xfff15a24),
      ),
      title: base.title.copyWith(
        // orange
        fontFamily: 'Roboto',
        fontSize: 20.0,
        color: Color(0xfff15a24),
      ),
      body1: base.body1.copyWith(
        // orange
        fontFamily: 'Roboto',
        fontSize: 13.0,
        color: Color(0xfff15a24),
      ),
      body2: base.body2.copyWith(
        // black
        fontSize: 13.0,
        color: Colors.black,
      ),
      overline: base.overline.copyWith(
        // light blue
        fontFamily: 'Roboto',
        fontSize: 11.0,
        color: Color(0xff85a2a6),
      ),
      subtitle: base.subtitle.copyWith(
        // Off White
        fontFamily: 'Roboto',
        fontSize: 20,
        color: Color(0xffd9ceb0),
      ),
      display2: base.display2.copyWith(
        // Off White
        fontFamily: 'Roboto',

        fontSize: 12.0,
        color: Color(0xffd9ceb0),
      ),
      display3: base.display3.copyWith(
        // Off White
        fontFamily: 'Roboto',
        fontSize: 13.0,
        color: Color(0xffd9ceb0),
      ),
      display4: base.display4.copyWith(
        // light blue
        fontFamily: 'Roboto',
        fontSize: 24.0,
        color: Color(0xff85a2a6),
      ),
    );
  }

  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    textTheme: _basicTextTheme(base.textTheme),
    primaryColor: Color(0xff85a2a6),
  );
}

class OrangeTextFields extends StatelessWidget {
  OrangeTextFields({this.rowTitle});

  final rowTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 10.0),
          child: Text(
            rowTitle,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.body1,
          ),
        ),
      ],
    );
  }
}

//
//

