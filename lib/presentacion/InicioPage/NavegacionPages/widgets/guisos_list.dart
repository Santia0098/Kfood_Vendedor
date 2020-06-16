
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kfood_vendedor/datos/requests.dart';
import 'package:kfood_vendedor/presentacion/InicioPage/NavegacionPages/helper/StringFormat.dart';
import 'package:kfood_vendedor/presentacion/InicioPage/NavegacionPages/helper/getIDfromCafeterias.dart';
import 'package:kfood_vendedor/presentacion/InicioPage/NavegacionPages/model/guiso.dart';




class GuisosLista extends StatefulWidget {
  GuisoList gl = GuisoList();
  @override
  GuisoList createState() => gl;
  GuisoList getGL(){
    return gl;
  }
}


  class GuisoList extends State<GuisosLista> {
  final guisoItems = <Guiso>[];

  @override
  void initState() {
    super.initState();
    imprimirLista();
  }

  imprimirLista() async{
    guisoItems.clear();
    Map<String,String> body = {
      'id':'${await getIDfromCafeteria()}'
    };
    String jsonGuiso = await executeHttpRequest(urlFile: "/getGuisos.php", requestBody: body);
    print(jsonGuiso);
    Map<String,dynamic> datos = json.decode(jsonGuiso);
    for(var guiso in datos['guiso']){
      String aux = await textFormarter(guiso.toString());
      print("guiso=$guiso");
      print("aux=$aux");
      Map<String,dynamic> datosguiso = json.decode(aux);
      guisoItems.add(Guiso(datosguiso['id'],datosguiso['nombre']));
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
        children: guisoItems.map<Widget>((Guiso guiso) {
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
                    height: 10.0,
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
                      guiso.title,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 18.0
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Map<String,String> body = {
                        'id':'${guiso.id}'
                      };
                      executeHttpRequest(urlFile: "/dropGuiso.php", requestBody: body);
                      guisoItems.clear();
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

 
                 
                ],
              ),
            ),
          )
          );
        }).toList());
  }


  
}
