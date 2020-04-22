import 'package:flutter/material.dart';

class Guisos extends StatefulWidget {
  Guisos({Key key}) : super(key: key);

  @override
  _GuisosState createState() => _GuisosState();
}

class _GuisosState extends State<Guisos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: Container(
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/guisos.png'),
                    fit: BoxFit.fill)),
        ),
      )
    );
  }
}