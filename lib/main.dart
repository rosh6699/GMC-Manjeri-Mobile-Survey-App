import 'package:flutter/material.dart';
import 'package:gmcmanjeri_flutter/screens/edit_surveys.dart';
import 'package:gmcmanjeri_flutter/screens/export.dart';
import 'package:gmcmanjeri_flutter/screens/home.dart';
import 'package:gmcmanjeri_flutter/screens/statistics.dart';

void main() => runApp(new GMCManjeri());

class GMCManjeri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "GMC Manjeri",
        color: Colors.white,
        theme: ThemeData(
            primaryColor: Colors.black,
            appBarTheme:
                AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            )),
            iconTheme: IconThemeData(color: Colors.black)),
        home: new HomeScreen(),
        routes: <String, WidgetBuilder>{
          EditSurvey.routeName: (BuildContext context) => new EditSurvey(),
          Export.routeName: (BuildContext context) => new Export(),
      });
  }
}
