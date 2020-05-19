import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kfood_vendedor/datos/requests.dart';
import 'package:kfood_vendedor/presentacion/InicioPage/NavegacionPages/helper/StringFormat.dart';
import 'package:kfood_vendedor/presentacion/InicioPage/NavegacionPages/model/platillo.dart';




class PlatillosLista extends StatefulWidget {
  @override
  PlatilloList createState() => PlatilloList();
}


  class PlatilloList extends State<PlatillosLista> {
  final platilloItems = <Platillo>[];

  @override
  void initState(){
    super.initState();
    imprimirLista();
  }

  void imprimirLista() async {
    String jsonPlatillo = await executeHttpRequest(urlFile: "/getPlatillos.php", requestBody: null);
    print(jsonPlatillo);
    Map<String,dynamic> datos = json.decode(jsonPlatillo);
    for(var platillo in datos['platillo']){
      String aux = await textFormarter(platillo.toString());
      print(platillo);
      print(aux);
      Map<String,dynamic> datosplatillo = json.decode(aux);
      platilloItems.add(Platillo(datosplatillo['id'],datosplatillo['nombre'],datosplatillo['precio']));
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
        children: platilloItems.map<Widget>((Platillo platillos) {
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
                      platillos.title,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 18.0
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Map<String,String> body = {
                        'id':'${platillos.id}'
                      };
                      executeHttpRequest(urlFile: "/dropPlatillo", requestBody: body);
                      platilloItems.clear();
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
                    Text( "\$" + platillos.price, style: TextStyle(
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
