import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kfood_vendedor/datos/requests.dart';
import 'package:kfood_vendedor/presentacion/InicioPage/NavegacionPages/helper/StringFormat.dart';
import 'package:kfood_vendedor/presentacion/InicioPage/NavegacionPages/helper/getIDfromCafeterias.dart';
import 'package:kfood_vendedor/presentacion/InicioPage/NavegacionPages/model/comida.dart';
  
class ComidasLista extends StatefulWidget {
  ComidaList cl = ComidaList();
  @override
  ComidaList createState() => cl;
  ComidaList getCL() {
    return cl;
  }
}

  class ComidaList extends State<ComidasLista> {
  final comidaItems = <Comida>[];
  
  @override
  void initState() {
    super.initState();
    imprimirLista();
  }

  void imprimirLista() async {
    comidaItems.clear();
    Map<String,String> body = {
      'id':'${await getIDfromCafeteria()}'
    };
    String jsonComida = await executeHttpRequest(urlFile: "/getComidas.php", requestBody: body);
    print(jsonComida);
    Map<String,dynamic> datos = json.decode(jsonComida);
    for(var comida in datos['comida']){
      String aux = await textFormarter(comida.toString());
      print(comida);
      print(aux);
      Map<String,dynamic> datoscomida = json.decode(aux);
      comidaItems.add(Comida(datoscomida['id'],datoscomida['nombre'],datoscomida['precio']));
    }
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return ListView(
       padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 30.0,
            ),
        scrollDirection: Axis.vertical,
        children: comidaItems.map<Widget>((Comida comida) {
          return GestureDetector(
            onTap: () {
            
            },
            child:  Padding(
            padding: EdgeInsets.only(  top: 15.0, bottom: 20.0),
            child: Container(
              width: 170,
              decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[300], width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(15))),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,

                children: <Widget>[
                  Container(
                    height: 20.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(10), topRight:Radius.circular(10)),
                      color: Color.fromRGBO(248, 64, 0, 1),
                      
                    ),
 
                  ),
                  SizedBox(
                    height: 10.0,
                  ),

                   Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                      comida.title,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 18.0
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Map<String,String> body = {
                        'id':'${comida.id}'
                      };
                      executeHttpRequest(urlFile: "/dropComida", requestBody: body);
                      comidaItems.clear();
                      imprimirLista();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      child:
                          Icon(Icons.close, color: Color.fromRGBO(248, 64, 0, 1)),
                    ),
                  ),
                ],
              ),
            ),


 
                 
                  Padding(
                    padding: const EdgeInsets.only(left:10.0, right: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                    Text( "\$" + comida.price, style: TextStyle(
                      fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                    ),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
          );
        }).toList());
  }


  
}