import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Mas extends StatefulWidget {
  Mas({Key key}) : super(key: key);

  @override
  _MasState createState() => _MasState();
}

class _MasState extends State<Mas> {
  var _diaseleccionado = "Dia de venta";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pedidos",
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Builder(
          builder: (context) {
            return SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(16), child: _cabecera()),
                _dashTotal(),
                _dashCantidad()
              ],
            ));
          },
        ),
      ),
    );
  }

  Widget _cabecera() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Estado de Ventas",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'SFUIDisplay',
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Todas tus ventas del día",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'SFUIDisplay',
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                  icon: Icon(
                    CupertinoIcons.info,
                    color: Colors.black54,
                  ),
                  onPressed: () {})
            ],
          )),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(top: 15),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          CupertinoIcons.play_arrow,
                          size: 15,
                        ),
                        Text(
                          "Fecha:",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'SFUIDisplay',
                            fontWeight: FontWeight.w500,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    )),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        child: Text(_diaseleccionado,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Color(0xFF000000))),
                        onTap: () {
                          _selectDate(context);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.calendar_today,
                          size: 15,
                          color: Colors.black45,
                        ),
                        tooltip: 'Tap to open date picker',
                        onPressed: () {
                          _selectDate(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _dashTotal() {
    return Container(
      width: (MediaQuery.of(context).size.width)- 30,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Color.fromRGBO(248, 64, 0, 1),
        elevation: 5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.insert_chart,
                size: 40,
                color: Colors.white54,
              ),
              title: Text(
                "\$${890.00}",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'SFUIDisplay',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                "Total vendido",
                style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'SFUIDisplay',
                    color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dashCantidad() {
    return Container(
      width: (MediaQuery.of(context).size.width)- 30,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.blueAccent,
        elevation: 5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.insert_chart,
                size: 40,
                color: Colors.white54,
              ),
              title: Text(
                "85",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'SFUIDisplay',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                "Cantidad de pedidos",
                style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'SFUIDisplay',
                    color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<void> _selectDate(BuildContext context) async {
    final DateTime d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (d != null) //if the user has selected a date
      setState(() {
        // we format the selected date and assign it to the state variable
        _diaseleccionado = new DateFormat.yMMMMd("en_US").format(d);
      });
  }
}
