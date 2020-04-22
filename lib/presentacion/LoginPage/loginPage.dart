import 'package:flutter/material.dart';
import 'package:kfood_vendedor/presentacion/LoginPage/widgets/cabecera.dart';
import 'package:kfood_vendedor/presentacion/LoginPage/widgets/registro.dart';
import 'package:kfood_vendedor/presentacion/LoginPage/widgets/cuerpoLogin.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/backLogin.png'),
                    fit: BoxFit.fill)),
            child: SafeArea(
                bottom: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 55),
                      child: Cabecera(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 45, left: 15, right: 15),
                      child: EntradasTexto(),
                    ),
                    RegistroSheet(),
                    ],
                )),
          )
        ]))));
  }
}


