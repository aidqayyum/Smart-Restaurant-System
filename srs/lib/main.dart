import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:srs/Login.dart';
import 'package:srs/mainscreen.dart';
import 'package:srs/registeration.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.lightBlue[300]));
    return MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.lightBlue[300],
        primarySwatch: Colors.pink,
        accentColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.cyan[300],
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/srs3.png",
                  scale: 5,
                ),
                SizedBox(
                  height: 100,
                ),
                ProgressIndicator(),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProgressIndicator extends StatefulWidget {
  @override
  _ProgressIndicatorState createState() => new _ProgressIndicatorState();
}

class _ProgressIndicatorState extends State<ProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          if (animation.value > 0.99) {
            Navigator.push(this.context,
                MaterialPageRoute(builder: (context) => HomePage()));
          }
        });
      });
    controller.repeat();
  }

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Container(
      child: CircularProgressIndicator(),
    ));
  }
}
