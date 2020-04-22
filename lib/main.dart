import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kfood_vendedor/presentacion/CargaPage/loadPage.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return MaterialApp(
      title: 'KFood',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Splash(),
      ),
    );
  }
}