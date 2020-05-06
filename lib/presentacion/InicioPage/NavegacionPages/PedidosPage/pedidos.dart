import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pedidos extends StatefulWidget {
  Pedidos({Key key}) : super(key: key);

  @override
  _PedidosState createState() => _PedidosState();
}

class _PedidosState extends State<Pedidos> {
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
                _itemLista(),
              ],
            ));
          },
        ),
      ),
    );
  }

  Widget _cabecera() {
    return Align(
      alignment: Alignment.topLeft,
      child: Wrap(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 15, left: 10),
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
          Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Theme(
                data:
                    Theme.of(context).copyWith(splashColor: Colors.transparent),
                child: TextField(
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
              )),
        ],
      ),
    );
  }

  Widget _itemLista() {
    return new Padding(
        padding: EdgeInsets.all(5),
        child: new Container(
            child: InkWell(
          splashColor: Colors.black45,
          onTap: () {},
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
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(7), topRight: Radius.circular(7)),
                          ),
                          child: Wrap(
                            direction: Axis.horizontal,
                            runSpacing: 50,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            spacing: 100,
                            children: <Widget>[
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 5, left: 5, bottom: 5),
                                child: Row(children: <Widget>[
                                  Icon(
                                    Icons.fastfood,
                                    color: Colors.white54,
                                    size: 15,
                                  ),
                                  Text(
                                    "  Nombre del cliente",
                                    style: new TextStyle(
                                        fontSize: 15.0,
                                        fontFamily: "SFUIDisplay",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white70
                                      ),
                                  )
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
                        const EdgeInsets.only(top: 3.0, bottom: 3.0, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "6.00",
                          style: new TextStyle(
                              fontSize: 20.0, fontFamily: "SFUIDisplay"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )));
  }

  Widget _lista() {}
}
