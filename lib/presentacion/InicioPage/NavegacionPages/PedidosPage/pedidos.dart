import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kfood_vendedor/datos/requests.dart';
import 'package:kfood_vendedor/negocios/class/pedido.dart';
import 'package:kfood_vendedor/presentacion/InicioPage/NavegacionPages/helper/StringFormat.dart';

class Pedidos extends StatefulWidget {
  Pedidos({Key key}) : super(key: key);

  @override
  _PedidosState createState() => _PedidosState();
}

class _PedidosState extends State<Pedidos> {

  final pedidosItems = <Pedido>[];

  @override
  void initState() {
    super.initState();
    imprimirLista();
  }

  void imprimirLista() async {
    pedidosItems.clear();
    String jsonPedidos = await executeHttpRequest(urlFile: "/getPedidos.php", requestBody: null);
    print(jsonPedidos);
    Map<String,dynamic> datos = json.decode(jsonPedidos);
    for (var pedido in datos['pedido']){
      String aux = await textFormarter(pedido.toString());
      print(aux);
      Map<String,dynamic> datosPedido = json.decode(aux);
      pedidosItems.add(Pedido(datosPedido['idpedidos'],datosPedido['idusuarios'],datosPedido['nombreUsuario'],datosPedido['apePat'],datosPedido['apeMat'],datosPedido['estado'],datosPedido['total'],datosPedido['hora']));
    }
    setState(() {});
  }

  void imprimirListaForFinder(String text) async {
    pedidosItems.clear();
    Map<String,String> body = {
      'termino':'$text'
    };
    String jsonPedidos = await executeHttpRequest(urlFile: "/getPedidosFinder.php", requestBody: body);
    print(jsonPedidos);
    Map<String,dynamic> datos = json.decode(jsonPedidos);
    for (var pedido in datos['pedido']){
      String aux = await textFormarter(pedido.toString());
      print(aux);
      Map<String,dynamic> datosPedido = json.decode(aux);
      pedidosItems.add(Pedido(datosPedido['idpedidos'],datosPedido['idusuarios'],datosPedido['nombreUsuario'],datosPedido['apePat'],datosPedido['apeMat'],datosPedido['estado'],datosPedido['total'],datosPedido['hora']));
    }
    setState(() {});
  }

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
                _cabecera(),
                _lista(),
              ],
            ));
          },
        ),
      ),
    );
  }

  Widget _cabecera() {
    return Container(
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
      ),
      child: Wrap(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 5, left: 10),
            child: Text(
              "Pedidos",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'SFUIDisplay',
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                CupertinoIcons.forward,
                                size: 12,
                              ),
                              Text(
                                " Hora de pedido",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black87,
                                    fontFamily: "SFUIDisplay"),
                              ),
                            ],
                          ),
                        ),
                        HorasDropDown()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 15),
            child: TextField(
              onChanged: (text) {imprimirListaForFinder(text);},
              autofocus: false,
              style: TextStyle(fontSize: 15.0, color: Colors.black54),
              decoration: InputDecoration(
                prefixIcon:
                    Icon(CupertinoIcons.search, color: Colors.redAccent),
                filled: true,
                fillColor: Color.fromRGBO(223, 230, 233, 0.5),
                hintText: 'Nombre o contenido del pedido',
                hintStyle: TextStyle(color: Colors.black38),
                contentPadding: const EdgeInsets.only(
                    left: 14.0, bottom: 9.0, top: 9.0, right: 14.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(15.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(15.7),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemLista(Pedido pedidosItem) {
    return new Container(
        padding: EdgeInsets.all(5),
        child: new Container(
            child: InkWell(
          splashColor: Colors.black45,
          onTap: () {
            _detallesdelPedido(pedidosItem.idPedido);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
            color: Colors.white,
            borderOnForeground: true,
            child: Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0.0),
                    child: Row(children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(248, 64, 0, 1),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(7),
                                topRight: Radius.circular(7)),
                          ),
                          child: Wrap(
                            direction: Axis.horizontal,
                            runSpacing: 50,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            spacing: 100,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    right: 5, left: 5, top: 5, bottom: 3),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.fastfood,
                                              color: Colors.white54,
                                              size: 15,
                                            ),
                                            Text(
                                              "  ${pedidosItem.nombreUsuario} ${pedidosItem.apePat} ${pedidosItem.apeMat}",
                                              style: new TextStyle(
                                                  fontSize: 15.0,
                                                  fontFamily: "SFUIDisplay",
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white70),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // MaterialButton(
                                      //   onPressed: () {},
                                      //   child: Text(
                                      //     "Preparar",
                                      //     style: new TextStyle(
                                      //       fontSize: 10,
                                      //       fontFamily: "SFUIDisplay",
                                      //       fontWeight: FontWeight.w600,
                                      //       color: Colors.greenAccent),
                                      //     ))
                                    ]),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Row(children: <Widget>[
                              Icon(
                                CupertinoIcons.play_arrow,
                                color: Colors.black54,
                                size: 15,
                              ),
                              Text(
                                "  Hora de entrega.",
                                style: new TextStyle(
                                    fontSize: 13,
                                    fontFamily: "SFUIDisplay",
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54),
                              )
                            ]),
                          ),
                          Text(
                            "${pedidosItem.hora.replaceAll("-", ":")}",
                            style: new TextStyle(
                                fontSize: 13,
                                fontFamily: "SFUIDisplay",
                                fontWeight: FontWeight.w700,
                                color: Colors.black54),
                          )
                        ]),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 3.0, bottom: 3.0, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "${pedidosItem.total}",
                          style: new TextStyle(
                              fontSize: 20.0, fontFamily: "SFUIDisplay"),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 5,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.redAccent,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 3.0, bottom: 3.0, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Toque para ver detalles",
                          style: new TextStyle(
                              fontSize: 11,
                              fontFamily: "SFUIDisplay",
                              fontWeight: FontWeight.w600,
                              color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )));
  }

  Widget _detallesPedido(String mensaje) {
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
            Expanded(
              flex: 1,
              child: new SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.only(top: 15, bottom: 10),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    CupertinoIcons.info,
                                    size: 20,
                                  ),
                                  Text(
                                    "Detalles del pedido.",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'SFUIDisplay',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              )),
                          new Text(
                            "$mensaje",
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

  void _detallesdelPedido(String idPedido) async {
    Map<String,String> body = {
      'idPedido':'$idPedido'
    };
    String jsonDetalles = await executeHttpRequest(urlFile: "/getPedidoDetalles.php", requestBody: body);
    print(jsonDetalles);
    Map<String,dynamic> datos = json.decode(jsonDetalles);
    String mensaje = "";
    for (var detalle in datos['plato']){
      String aux = await textFormarter(detalle.toString());
      print(aux);
      Map<String,dynamic> datosDetalles = json.decode(aux);

      print("${datosDetalles['cantidad']} ${datosDetalles['nombre_comida']} de ${datosDetalles['nombre_guiso']}");
      if(datosDetalles['nombre_guiso']!="null"){
        mensaje += "${datosDetalles['cantidad']} ${datosDetalles['nombre_comida']} de ${datosDetalles['nombre_guiso']}\n";
      }else{
        mensaje += "${datosDetalles['cantidad']} ${datosDetalles['nombre_comida']}\n";
      }

    }
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
                top: (MediaQuery.of(context).size.height / 2) - 50),
            child: Column(
              children: <Widget>[
                _detallesPedido(mensaje)
              ],
            ),
          );
        });
  }

  void pedidoTerminado(String idPedido) async {
    Map<String,String> body = {
      'idPedido':'$idPedido'
    };
    String respuestaDelServer = await executeHttpRequest(urlFile: "/pedidoTerminado.php", requestBody: body);
    print(respuestaDelServer);
    imprimirLista();
  }

  Widget _lista() {
    //final List<String> items = new List<String>.generate(10, (i) => "item  ${i + 1}");
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: pedidosItems.length,
          itemBuilder: (context, int index) {
            return Slidable(
              actions: <Widget>[
                IconSlideAction(
                    icon: Icons.check,
                    caption: 'Preparado',
                    color: Colors.greenAccent,
                    onTap: () {
                      pedidoTerminado(pedidosItems[index].idPedido);
                      print("ID Item ${pedidosItems[index].idPedido} fue Clickeado");
                    }),
              ],
              child: _itemLista(pedidosItems[index]),
              actionPane: SlidableDrawerActionPane(),
            );
          }),
    );
  }
}

class HorasDropDown extends StatefulWidget {
  HorasDropDown() : super();

  @override
  HorasDropDownState createState() => HorasDropDownState();

  static String horas = '';
}

class Horas {
  int id;
  String hora;

  Horas(this.id, this.hora);
  static List<Horas> getHoras() {
    return <Horas>[
      Horas(1, 'Todo'),
      Horas(2, '07:55'),
      Horas(3, '08:50'),
      Horas(4, '09:45'),
      Horas(5, '10:40'),
      Horas(6, '11:35'),
      Horas(7, '12:30'),
      Horas(8, '13:25'),
      Horas(9, '14:20'),
      Horas(10, '15:15'),
    ];
  }
}

class HorasDropDownState extends State<HorasDropDown> {
  List<Horas> _horarios = Horas.getHoras();
  List<DropdownMenuItem<Horas>> _dropdownMenuItems;
  Horas _selectedHoras;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_horarios);
    _selectedHoras = _dropdownMenuItems[0].value;
    HorasDropDown.horas = _selectedHoras.hora;
    super.initState();
  }

  List<DropdownMenuItem<Horas>> buildDropdownMenuItems(List horariosKfood) {
    List<DropdownMenuItem<Horas>> items = List();
    for (Horas horario in horariosKfood) {
      items.add(
        DropdownMenuItem(
          value: horario,
          child: Text(horario.hora),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Horas selectedHrs) {
    setState(() {
      _selectedHoras = selectedHrs;
    });
    HorasDropDown.horas = _selectedHoras.hora;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DropdownButton(
            value: _selectedHoras,
            items: _dropdownMenuItems,
            onChanged: onChangeDropdownItem,
          ),
        ],
      ),
    );
  }
}
