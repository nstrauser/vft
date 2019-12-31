import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme.dart';
import 'model/data_model.dart';
import 'vft.dart';


void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Data Calculator",
        theme: basicTheme(),
        home: Vft(),
      ),
    );
  }
}

