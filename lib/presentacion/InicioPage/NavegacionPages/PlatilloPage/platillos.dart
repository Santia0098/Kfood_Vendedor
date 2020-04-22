import 'package:flutter/material.dart';

class Platillos extends StatefulWidget {
  Platillos({Key key}) : super(key: key);

  @override
  _PlatillosState createState() => _PlatillosState();
}

class _PlatillosState extends State<Platillos> {
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
                    image: AssetImage('assets/images/platillos.png'),
                    fit: BoxFit.fill)),
        ),
      )
    );
  }
}