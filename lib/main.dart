import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:rxdart/rxdart.dart';
void main() => runApp(MyApp());
class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _direction;

  @override
  void initState() {

    super.initState();
    FlutterCompass.events.listen((double direction) {
      setState(() {
        _direction = direction;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
  debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    return new MaterialApp(
      debugShowCheckedModeBanner: false,

      home: new Scaffold(

        appBar: new AppBar(

          title: const Text('Flutter Compass'),
        ),
        body: new Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: new Transform.rotate(
            angle: ((_direction ?? 0) * (math.pi / 180) * -1),
            child: new Image.asset('assets/compass.png'),
          ),
        ),
      ),
    );
  }
}