import 'package:flutter/material.dart';

class Cabecera extends StatelessWidget {
  const Cabecera({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, top: 25),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Inicia Sesión",
                style: TextStyle(
                  fontSize: 38,
                  fontFamily: 'SFUIDisplay',
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(234, 100, 86,1.0)
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 2),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Vamos vender!",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'SFUIDisplay',
                      color: Colors.black45),
                )),
          )
        ],
      ),
    );
  }
}