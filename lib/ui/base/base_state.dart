import 'package:flutter/material.dart';

class BaseState<T> extends State {
  // Top navigation bar
  Widget header(String title) => Container(
        width: double.infinity,
        color: Colors.grey[850],
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              Padding(
                padding: EdgeInsets.only(left: 32.0),
                child: new Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return null;
  }
}
