import 'package:flutter/material.dart';

class Ajustes extends StatefulWidget {
  Ajustes({Key key}) : super(key: key);

  @override
  _AjustesState createState() => _AjustesState();
}

class _AjustesState extends State<Ajustes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
         child: Text("Ajustes"),
       ),
    );
  }
}