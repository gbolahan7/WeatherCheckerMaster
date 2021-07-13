import 'package:flutter/material.dart';

import 'screens/login_page.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Map<int, Color> color = {
    50: Color.fromRGBO(20, 47, 78, .1),
    100: Color.fromRGBO(20, 47, 78, .2),
    200: Color.fromRGBO(20, 47, 78, .3),
    300: Color.fromRGBO(20, 47, 78, .4),
    400: Color.fromRGBO(20, 47, 78, .5),
    500: Color.fromRGBO(20, 47, 78, .6),
    600: Color.fromRGBO(20, 47, 78, .7),
    700: Color.fromRGBO(20, 47, 78, .8),
    800: Color.fromRGBO(20, 47, 78, .9),
    900: Color.fromRGBO(20, 47, 78, 1),
  };

  @override
  Widget build(BuildContext context) {
    MaterialColor colorCustom = MaterialColor(0xFF142F4E, color);
    return MaterialApp(
      title: 'Flutter Authentication',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: colorCustom,
        accentColor: Colors.indigoAccent,
        fontFamily: "Montserrat",
        brightness: Brightness.light,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
              fontSize: 24.0,
            ),
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          ),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 46.0,
            color: Colors.blue.shade700,
            fontWeight: FontWeight.w500,
          ),
          bodyText1: TextStyle(fontSize: 18.0),
        ),
      ),
      // home: LoginPage(),
      home: MainScreen(),
    );
  }
}
