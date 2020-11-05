import 'package:flutter/material.dart';
import 'package:srs_restaurant/core/consts.dart';

class CustomListTile extends StatelessWidget {
  
  final IconData icon;
  final String text;

  CustomListTile({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: AppColors.yellowColor,
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            "$text",
            style: TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}
