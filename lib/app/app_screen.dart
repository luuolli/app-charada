import 'package:charadas/shared/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Charadas',
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent[600],
        buttonTheme: ButtonThemeData(
          padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        ),
      ),
      routes: routes(context),
    );
  }
}
