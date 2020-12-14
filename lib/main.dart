import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testovoe_app/pages/first_screen.dart';
import 'package:testovoe_app/pages/home.dart';

void main() {
  Paint.enableDithering = true;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent,));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        barBackgroundColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.transparent,
        textTheme: CupertinoTextThemeData(
          primaryColor: CupertinoColors.white,
        )
      ),
      home: Home(),
      routes: {
        '/screen1': (context) => FirstScreen(),
      },
    );
  }
}
