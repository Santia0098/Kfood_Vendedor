import 'package:flutter/material.dart';

class CabeceraReg extends StatelessWidget {
  const CabeceraReg({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width - 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 50, left: 10),
                    child: Text(
                      "Crea una cuenta",
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'SFUIDisplay',
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(234, 100, 86, 1.0)),
                    ),
                  ),
                ],
              )),
          IconButton(
              icon: Icon(Icons.person_add),
              color: Colors.redAccent,
              onPressed: () {}),
        ],
      ),
    );
  }
}
