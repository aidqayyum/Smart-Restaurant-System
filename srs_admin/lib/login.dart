import 'package:flutter/material.dart';
import 'package:srs_admin/mainscreen.dart';
import 'package:srs_admin/registeration.dart';

import 'dart:async';
import 'package:toast/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());
bool rememberMe = false;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
    _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  TextEditingController _emailcontroller = new TextEditingController();
  TextEditingController _passcontroller = new TextEditingController();
  String urlLogin = "http://itschizo.com/aidil_qayyum/srs/php/login_admin.php";
  
  @override
  void initState() {
    //loadpref();
   // print('Init: $_email');
    super.initState();
    this.loadPref();
  }
   @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text('Hello',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                    child: Text('Admin',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(250.0, 175.0, 0.0, 0.0),
                    child: Text('.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue[300])),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'USER ID',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent))),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent))),
                      obscureText: true,
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      child: InkWell(
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.blueAccent,
                        color: Colors.lightBlueAccent,
                        elevation: 7.0,
                        child: MaterialButton(
                          onPressed: (){},//this._userLogin,
                          child: Center(
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage()));
                            },
                            child:Center(
                                  child: Text('Go Back',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat'))),
                          ),
                        ),
                      ),
                  ],
                )),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                        value: rememberMe,
                        onChanged: (bool value) {
                          _onRememberMeChanged(value);
                        },
                      ),
                      Padding(padding: EdgeInsets.only(top: 15.0, left: 3.0),),
                      Text('Remember Me ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                             
                Text(
                  'New to SRS ?',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ));},
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            )
          ],
        ));
  }
  
  //void _userLogin() async {
  //  try {
  //    ProgressDialog pr = new ProgressDialog(context,
  //        type: ProgressDialogType.Normal, isDismissible: false);
  //    pr.style(message: "Log in...");
  //    pr.show();
  //    String _email = _emailcontroller.text;
  //    String _password = _passcontroller.text;
  //    http.post(urlLogin, body: {
  //      "email": _email,
  //      "password": _password,
  //    })
  //        //.timeout(const Duration(seconds: 4))
  //        .then((res) {
  //      print(res.body);
  //      var string = res.body;
  //      List admindata = string.split(",");
  //      if (admindata[0] == "success") {
  //        Admin _admin = new Admin(
 //            name: admindata[1],
 //             email: _email,
  //            password: _password,
  //            userid: admindata[2],
  //            phone: admindata[3],
  //        pr.dismiss();
  //        Navigator.push(
  //            context,
  //            MaterialPageRoute(
  //                builder: (BuildContext context) => HomePage(
  //                      admin: _admin,
  //                    )));
  //      } else {
  //        pr.dismiss();
  //        Toast.show("Login failed", context,
  //            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  //      }
  //    }).catchError((err) {
  //      print(err);
  ///      pr.dismiss();
  //    });
  //  } on Exception catch (_) {
  //    Toast.show("Error", context,
  //        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  //  }
  //}

  void _onRememberMeChanged(bool newValue) => setState(() {
        rememberMe = newValue;
        print(rememberMe);
        if (rememberMe) {
          savepref(true);
        } else {
          savepref(false);
        }
      }
      );

  Future<void> loadPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = (prefs.getString('email')) ?? '';
    String password = (prefs.getString('pass')) ?? '';
    if (email.length > 1) {
      setState(() {
        _emailcontroller.text = email;
        _passcontroller.text = password;
        rememberMe = true;
      });
    }
  }

  void savepref(bool value) async {
    String email = _emailcontroller.text;
    String password = _passcontroller.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value) {
      //save preference
      await prefs.setString('email', email);
      await prefs.setString('pass', password);
      Toast.show("Preferences have been saved", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    } else {
      //delete preference
      await prefs.setString('email', '');
      await prefs.setString('pass', '');
      setState(() {
        _emailcontroller.text = '';
        _passcontroller.text = '';
        rememberMe = false;
      });
      Toast.show("Preferences have removed", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }
  } 
}

  