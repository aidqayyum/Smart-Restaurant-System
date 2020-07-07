
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:srs_admin/login.dart';
import 'package:srs_admin/mainscreen.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  @override 
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterScreen> {
  bool _isChecked = false;
  String urlRegister = "http://itschizo.com/aidil_qayyum/srs/php/register_admin.php";

  TextEditingController _namecontroller = new TextEditingController();
  TextEditingController _useridcontroller = new TextEditingController();
  TextEditingController _emailcontroller = new TextEditingController();
  TextEditingController _passcontroller = new TextEditingController();
  TextEditingController _phonecontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 90.0, 0.0, 0.0),
                  child: Text(
                    'Signup',
                    style:
                        TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16.0, 160.0, 0.0, 0.0),
                  child: Text(
                    'Admin',
                    style:
                        TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(200.0, 160.0, 0.0, 0.0),
                  child: Text(
                    '.',
                    style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue[300]),
                  ),
                )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 10.0, left: 25.0, right: 25.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _namecontroller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'NAME',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent))),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: _useridcontroller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'USER ID',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent))),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: _passcontroller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'PASSWORD ',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent))),
                    obscureText: true,
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: _emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent))),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: _phonecontroller,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: 'PHONE NUMBER',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent))),
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
                          onPressed: _onRegister,
                          child: Center(
                            child: Text(
                              'REGISTER',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      )),
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
                            child: Center(
                                  child: Text('Go Back',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat'))),
                          ),
                        ),
                      ),
                      Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Checkbox(
                        value: _isChecked,
                        onChanged: (bool value) {
                          //_onChange(value);
                        },
                      ),
                    ],
                  ),
                    ],
                  )),
              // SizedBox(height: 15.0),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Text(
              //       'New to Spotify?',
              //       style: TextStyle(
              //         fontFamily: 'Montserrat',
              //       ),
              //     ),
              //     SizedBox(width: 5.0),
              //     InkWell(
              //       child: Text('Register',
              //           style: TextStyle(
              //               color: Colors.green,
              //               fontFamily: 'Montserrat',
              //               fontWeight: FontWeight.bold,
              //               decoration: TextDecoration.underline)),
              //     )
              //   ],
              // )
            ]));
      }
    void _onRegister() {
    String name = _namecontroller.text;
    String userid = _useridcontroller.text;
    String email = _emailcontroller.text;
    String phone = _phonecontroller.text;
    String password = _passcontroller.text;

    http.post(urlRegister, body: {
      "name": name,
      "userid" : userid,
      "email": email,
      "password": password,
      "phone": phone,
    }).then((res) {
      if (res.body == "success") {
        Navigator.pop(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => LoginPage()));
        Toast.show("Registration success", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      } else {
        Toast.show("Registration failed", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      }
    }).catchError((err) {
      print(err);
    });
  }

  //void _onChange(bool value) {
  //  setState(() {
  //    _isChecked = value;
  //    //savepref(value);
  //  });
  //}
}