import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:srs_restaurant/pages/homepage.dart';
import 'package:srs_restaurant/core/user.dart';

String _email, _password;
String urlLogin = "http://itschizo.com/aidil_qayyum/srs2/php/login_user.php";
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        textTheme: GoogleFonts.reemKufiTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.yellow[300],
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/srs3.png",
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
void loadpref(BuildContext ctx) async {
  print('Inside loadpref()');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  _email = (prefs.getString('email')??'');
  _password = (prefs.getString('pass')??'');
  print("Splash:Preference");
  print(_email);
  print(_password);
  if (_isEmailValid(_email??"no email")) {
    //try to login if got email;
    _onLogin(_email, _password, ctx);
  } else {
    //login as unregistered user
    User user = new User(
        name: "not register",
        email: "user@noregister",
        phone: "not register");
    Navigator.push(
        ctx, MaterialPageRoute(builder: (context) => HomePage(user: user)));
  }
}

bool _isEmailValid(String email) {
  return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
}

void _onLogin(String email, String pass, BuildContext ctx) {
  http.post(urlLogin, body: {
    "email": _email,
    "password": _password,
  }).then((res) {
    print(res.statusCode);
    var string = res.body;
    List dres = string.split(",");
    print("SPLASH:loading");
    print(dres);
    if (dres[0] == "success") {
      User user = new User(
          name: dres[1],
          email: dres[2],
          phone: dres[3]);
      Navigator.push(
          ctx, MaterialPageRoute(builder: (context) => HomePage(user: user)));
    } else {
      //allow login as unregistered user
      User user = new User(
          name: "not register",
          email: "user@noregister",
          phone: "not register");
      Navigator.push(
          ctx, MaterialPageRoute(builder: (context) => HomePage(user: user)));
    }
  }).catchError((err) {
    print(err);
  });
}

