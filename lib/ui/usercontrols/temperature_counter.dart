import 'package:flutter/material.dart';

class TemperatureCounter extends StatelessWidget {
  final int temperature;
  final Function increment;
  final Function decrement;

  const TemperatureCounter(this.temperature, {this.increment, this.decrement});

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: new Border.all(color: Colors.grey[500], width: 0.5)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Decrement button
          InkWell(
            child: GestureDetector(
              onTap: decrement,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                constraints: BoxConstraints(minWidth: 20.0, minHeight: 10.0),
                child: Text(
                  "-",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
            alignment: Alignment.center,
            constraints: BoxConstraints(minWidth: 20.0, minHeight: 10.0),
            child: Text(
              "1165°",
              //temperature.toString() + "°",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red[700],
                fontSize: 14,
              ),
            ),
          ),
          // Increment button
          InkWell(
            child: GestureDetector(
              onTap: increment,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                alignment: Alignment.center,
                constraints: BoxConstraints(minWidth: 20.0, minHeight: 10.0),
                child: Text(
                  "+",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red[700],
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
