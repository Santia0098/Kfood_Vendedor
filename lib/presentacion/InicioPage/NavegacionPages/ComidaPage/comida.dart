import 'package:flutter/material.dart';

class Comida extends StatefulWidget {
  Comida({Key key}) : super(key: key);

  @override
  _ComidaState createState() => _ComidaState();
}

class _ComidaState extends State<Comida> {
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
                    image: AssetImage('assets/images/comidas.png'),
                    fit: BoxFit.fill)),
        ),
      )
    );
  }
}