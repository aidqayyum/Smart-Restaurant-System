import 'package:flutter/material.dart';
import 'package:srs_restaurant/core/consts.dart';

class SmallButton extends StatelessWidget {

  final String btnText;

  SmallButton({this.btnText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.0,
      width: 60.0,
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.yellowColor,
          ),
          borderRadius: BorderRadius.circular(20.0)),
      child: Center(
        child: Text(
          "$btnText",
          style: TextStyle(color: AppColors.blackColor, fontSize: 16.0),
        ),
      ),
    );
  }
}
