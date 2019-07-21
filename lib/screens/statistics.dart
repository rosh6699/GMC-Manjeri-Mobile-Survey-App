import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  static const String routeName = "/statistics";
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Statistics"),
      ),
      body: new Container(
        child: new Center(
        child: new Text("Statistics",
          textDirection: TextDirection.ltr,
			    style: TextStyle(color: Colors.black, fontSize: 40.0),
        ),
      ))
    );
  }
}