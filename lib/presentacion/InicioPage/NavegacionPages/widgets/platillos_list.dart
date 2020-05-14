import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:kfood_vendedor/presentacion/InicioPage/NavegacionPages/model/platillo.dart';




class PlatillosLista extends StatefulWidget {
  @override
  PlatilloList createState() => PlatilloList();
}


  class PlatilloList extends State<PlatillosLista> {
  final platilloItems = <Platillo>[

    Platillo(
      title: "Chiles rellenos",
      price: "15.00",
    ),
    
    Platillo(
      title: "Rollo de carne",
      price: "7.00",
    ),
    Platillo(
      title: "Filete con arroz",
      price: "25.00",
    ),
   
  ];
  



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
