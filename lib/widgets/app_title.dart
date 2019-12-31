import 'package:flutter/material.dart';
class AppTitle extends StatelessWidget {
  const AppTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 10.0),
          child: Image.asset(
            'images/vft_logo.png',
            width: 40.0,
            height: 40.0,
          ),
        ),
        Text('Sony Venice ',
            style: Theme.of(context).textTheme.headline,
            textAlign: TextAlign.center),
        Text(
          ' |',
          style: Theme.of(context).textTheme.display4,
        ),
        Text(' User Frame Line Tool',
            style: Theme.of(context).textTheme.headline,
            textAlign: TextAlign.center),
      ],
    );
  }
}
