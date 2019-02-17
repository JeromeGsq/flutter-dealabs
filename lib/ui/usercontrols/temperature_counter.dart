import 'package:flutter/material.dart';

class TemperatureCounter extends StatelessWidget {
  final int temperature;
  final Function increment;
  final Function decrement;

  const TemperatureCounter(this.temperature, {this.increment, this.decrement});

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(border: new Border.all(color: Colors.grey)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Decrement button
          ButtonTheme(
            minWidth: 22,
            height: 10,
            child: FlatButton(
              onPressed: decrement,
              child: Text(
                "-",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          Text(
            temperature.toString() + "°",
            style: TextStyle(
              color: Colors.red,
              fontSize: 13,
            ),
          ),
          // Increment button
          ButtonTheme(
            minWidth: 22,
            height: 10,
            child: FlatButton(
              onPressed: increment,
              child: Text(
                "+",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
