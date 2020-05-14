
import 'package:flutter/material.dart';
import 'package:kfood_vendedor/presentacion/InicioPage/NavegacionPages/model/comida.dart';
  
class ComidasLista extends StatefulWidget {
  @override
  ComidaList createState() => ComidaList();
}

  class ComidaList extends State<ComidasLista> {
  final comidaItems = <Comida>[

    Comida(
      title: "Café",
      price: "15.00",
    ),
    
    Comida(
      title: "Tacos",
      price: "7.00",
    ),
    Comida(
      title: "Migada",
      price: "25.00",
    ),
    Comida(
      title: "Hamburguesa",
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