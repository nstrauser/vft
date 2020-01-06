import 'package:flutter/material.dart';
class AppTitle extends StatelessWidget {
  const AppTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      padding: EdgeInsets.all(5.0),
      color: Colors.black38,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: Image.asset(
              'images/vft_logo.png',
              width: 45.0,
              height: 45.0,
            ),
          ),
          Text('Sony Venice',
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
      ),
    );
  }
}
