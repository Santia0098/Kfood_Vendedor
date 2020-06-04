import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kfood_vendedor/complements/fadeAnimation/FadeAnimation.dart';
import 'package:kfood_vendedor/presentacion/InicioPage/inicio.dart';
import 'package:kfood_vendedor/presentacion/LoginPage/loginPage.dart';
import 'package:kfood_vendedor/presentacion/LoginPage/widgets/loginLogic.dart';

class LoadPage extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () async {
        if (await existUser()){
          Navigator.pushReplacement(
            this.context,
            MaterialPageRoute(
              builder: (context) => InicioPage(),
            ),
          );
        }else{
          Navigator.pushReplacement(
            this.context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  height: 200,
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 120.0,
                      child: FadeAnimation(
                          .1,
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image:
                                  AssetImage('assets/images/logoLoadPage.png'),
                            )
                            ),
                          )
                          ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                  ],
                )),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  LoadPage createState() => LoadPage();
}
