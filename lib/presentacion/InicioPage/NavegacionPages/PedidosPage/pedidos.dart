import 'package:flutter/material.dart';

class Pedidos extends StatefulWidget {
  Pedidos({Key key}) : super(key: key);

  @override
  _PedidosState createState() => _PedidosState();
}

class _PedidosState extends State<Pedidos> {
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
                    image: AssetImage('assets/images/pedidos.png'),
                    fit: BoxFit.fill)),
        ),
      )
    );
  }
}