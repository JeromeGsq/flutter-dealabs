import 'package:flutter/material.dart';

class TopIconFlatButton extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function pressed;
  const TopIconFlatButton(this.title, this.iconData, {this.pressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: pressed,
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Icon(
            iconData,
            color: Colors.grey[400],
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.grey[600],
                fontSize: 13,
                fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}
