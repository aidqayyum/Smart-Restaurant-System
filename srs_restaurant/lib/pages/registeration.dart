
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:srs_restaurant/core/consts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srs_restaurant/pages/login.dart';
import 'package:srs_restaurant/pages/mainscreen.dart';
import 'package:srs_restaurant/pages/profile.dart';

File _image;
class RegisterScreen extends StatefulWidget {
  @override 
  _RegisterUserState createState() => _RegisterUserState();
  const RegisterScreen({Key key, File image}) : super (key: key);
}

class _RegisterUserState extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, 
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'Signup',
                    style:
                        TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                  child: Text(
                    '.',
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.yellowLightColor),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: _choose,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                          "assets/profile.jpg"),
                    //: _image == null
                        //? AssetImage(pathAsset)
                        //: FileImage(_image),
                    fit: BoxFit.fill,
                  )),
            )),
        Text('Click on image above to take profile picture'),
          Container(
              padding: EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'NAME',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.yellowColor))),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'PASSWORD ',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.yellowColor))),
                    obscureText: true,
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.yellowColor))),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    //controller: _phcontroller,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: 'PHONE NUMBER',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.yellowColor))),
                  ),
                  SizedBox(height: 40.0),
                  Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: AppColors.yellowColor,
                        color: AppColors.yellowLightColor,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {},
                          child: Center(
                            child: Text(
                              'REGISTER',
                              style: TextStyle(
                                  color: Colors.black,
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
                                builder: (context) => ProfilePage()));
                            },
                            child: Center(
                                  child: Text('Go Back',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat'))),
                          ),
                        ),
                      ),
                    ],
                  )),
                SizedBox(height: 20.0),
            ])));
      }
      void _choose() async {
    _image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {});
    //_image = await ImagePicker.pickImage(source: ImageSource.gallery);
  }
    }