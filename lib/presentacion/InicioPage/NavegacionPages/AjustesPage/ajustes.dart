import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:kfood_vendedor/datos/requests.dart';
import 'package:kfood_vendedor/presentacion/InicioPage/NavegacionPages/helper/getIDfromCafeterias.dart';
import 'package:kfood_vendedor/presentacion/LoginPage/widgets/registroLogic.dart';
import 'package:progress_dialog/progress_dialog.dart';

class Mas extends StatefulWidget {
  Mas({Key key}) : super(key: key);

  @override
  _MasState createState() => _MasState();
}

class _MasState extends State<Mas> {

  @override
  void initState() {
    super.initState();
    getDataFromServer("");
  }

  List<String> valores = List(3);
  void getDataFromServer(String fecha) async {
    String idCafetria = await getIDfromCafeteria();
    print("idCafeteria:$idCafetria");
    Map<String,String> id;
    if(fecha==""){
      id = {
        'id':'$idCafetria'
      };
    }else{
      id = {
        'id':'$idCafetria',
        'fecha':'$fecha'
      };
    }

    //getTotalVendido.php getMasVendido.php getNumeroPedidos.php
    String data = await executeHttpRequest(urlFile: "/getTotalVendido.php", requestBody: id);
    valores[0] = json.decode(data)['total'];
    data = await executeHttpRequest(urlFile: "/getNumeroPedidos.php", requestBody: id);
    valores[1] = json.decode(data)['suma'];
    data = await executeHttpRequest(urlFile: "/getMasVendido.php", requestBody: id);
    valores[2] = json.decode(data)['nombre_comida'];
    print("${valores[0]} ${valores[1]} ${valores[2]}");
    print("vendido: $data");
    setState(() {});
  }

  var _diaseleccionado = "Dia de venta";
  ProgressDialog pr;
  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context);
    pr.style(
        message: 'Por favor espere... :D',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.redAccent),
        ),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 13.0, /*fontWeight: FontWeight.w400*/
        ),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w600));
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
                Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[_dashTotal(), _dashCantidad()],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: _dashComida(),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: ((MediaQuery.of(context).size.width) / 2)),
                  child: FlatButton(
                    onPressed: () {
                      pr.show();
                      Future.delayed(Duration(seconds: 2)).then((value) {
                        pr.hide();
                        Navigator.pop(context);
                      });
                      logOut();
                    },
                    padding: EdgeInsets.only(right: 0.0),
                    child: Text(
                      'S A L I R',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'SFUIDisplay',
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
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
                padding: EdgeInsets.only(bottom: 5),
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
                  onPressed: () {
                    _pressDetalles();
                  })
            ],
          )),
          Divider(
            height: 5,
            endIndent: 10,
            color: Colors.redAccent,
          ),
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
      width: ((MediaQuery.of(context).size.width) / 2) - 5,
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
                Icons.monetization_on,
                size: 40,
                color: Colors.white54,
              ),
              title: Text(
                "\$${valores[0]}",
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
      width: ((MediaQuery.of(context).size.width) / 2) - 5,
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
                "${valores[1]}",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'SFUIDisplay',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                "No. de Pedidos",
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

  Widget _dashComida() {
    return Container(
      width: (MediaQuery.of(context).size.width) - 5,
      height: 90,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.lightGreen,
        elevation: 5,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.fastfood,
                size: 50,
                color: Colors.white54,
              ),
              title: Text(
                "${valores[2]}",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'SFUIDisplay',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                "Comida del dia",
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

  Widget _detallesInfo() {
    return Container(
      width: (MediaQuery.of(context).size.width) - 30,
      height: (MediaQuery.of(context).size.height / 2) - 80,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        elevation: 5,
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 15, bottom: 5),
                child: Container(
                  height: (MediaQuery.of(context).size.height / 8 - 20),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/logoLoadPage.png'),
                  )),
                )),
            Text(
              "Versión. 1.0.0 ALPHA",
              style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'SFUIDisplay',
                  color: Colors.black54),
            ),
            Expanded(
              flex: 1,
              child: new SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.only(top: 15),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    CupertinoIcons.person_solid,
                                    size: 15,
                                  ),
                                  Text(
                                    "Colaboradores",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'SFUIDisplay',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black45,
                                    ),
                                  ),
                                ],
                              )),
                          new Text(
                            "Miguel Edgardo Santiago Hernandez, " +
                                "Jesus Emmanuel De León Lerma, " +
                                "Raúl Alberto Hernández Argüelles, " +
                                "José de Jesus Vázquez Charles, " +
                                "Alma Guadalupe Salinas Buenrostro, " +
                                "José Melitón Medellín González, " +
                                "Uriel Castro Hernández, " +
                                "Ana Cristina De Los Angeles Dominguez, " +
                                "",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'SFUIDisplay',
                                color: Colors.black45),
                          ),
                        ],
                      ))),
            ),
          ],
        ),
      ),
    );
  }

  void _pressDetalles() {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
                top: (MediaQuery.of(context).size.height / 2) - 50),
            child: Column(
              children: <Widget>[_detallesInfo()],
            ),
          );
        });
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
    print("fecha seleccionada: ${d.toString().substring(0,10)}");
    getDataFromServer(d.toString().substring(0,10));
  }
}
