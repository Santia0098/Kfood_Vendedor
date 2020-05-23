import 'package:flutter/material.dart';
import 'package:kfood_vendedor/datos/requests.dart';
import 'package:kfood_vendedor/presentacion/InicioPage/NavegacionPages/widgets/comidas_list.dart';
  
class ComidasScreen extends StatefulWidget {
  @override
  _ComidasScreenState createState() => _ComidasScreenState();
}

class _ComidasScreenState extends State<ComidasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Tus Comidas",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      color: Color.fromRGBO(248, 64, 0, 1),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Administra el menú del día",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                      color: Color.fromRGBO(248, 64, 0, 1),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),


            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Agregar una comida",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color.fromRGBO(248, 64, 0, 1),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                     _abrirActualizar();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(),
                      ),
                      child:
                          Icon(Icons.add, color: Color.fromRGBO(248, 64, 0, 1)),
                    ),
                  ),
                ],
              ),
            ),

 
            
            
            Container(
              height: 500,
              child: ComidasLista(),
            ),
            
           
           ],
        ),
      ),
    );
  }

  

  void _abrirActualizar() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            alignment: Alignment.topLeft,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 100,
            padding: EdgeInsets.symmetric(
              horizontal: 35.0,
              vertical: 30.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 35, bottom: 20),
                    child: Container(
                      child: Text(
                        "Agregar Comida",
                        style: TextStyle(
                          color: Color.fromRGBO(248, 64, 0, 1),
                          letterSpacing: 1.0,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  _nombreComida(),
                  SizedBox(
                    width: 20,
                  ),
                  _precioComida(),
                  SizedBox(
                    width: 20,
                  ),
                  _guardar(context),               
                ],
              ),
            ),
          );
        });
  }



  final comidaController = TextEditingController();
  final precioController = TextEditingController();

  Widget _nombreComida() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Nombre de la comida:',
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 50.0,
          child: TextField(
            controller: comidaController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
             prefixIcon: Icon(
               Icons.fastfood,
                color: Colors.black,
              ),
          
              hintText: 'Comida',
            ),
          ),
        ),
      ],
    );
  }




  
  Widget _precioComida() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Precio:',
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          height: 50.0,
          child: TextField(
            controller: precioController,
            obscureText: true,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
               Icons.local_atm,
                color: Colors.black,
              ),
              hintText: 'Precio',
            ),
          ),
        ),
      ],
    );
  }





  Widget _guardar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          if (RegExp("^[0-9]+(\.[0-9][0-9]?)?").hasMatch(precioController.text) &&
              comidaController.text.isNotEmpty) {
            String price = RegExp("^[0-9]+(\.[0-9][0-9]?)?").stringMatch(precioController.text);
            Map<String,String> body = {
              'nombre':'${comidaController.text}',
              'precio':'$price'
            };
            executeHttpRequest(urlFile: "/addComida.php", requestBody: body);
            Navigator.of(context).pop();
          }else{
            //TODO: poner un toast
            print("un error");
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Color.fromRGBO(248, 64, 0, 1),
        child: Text(
          'Registrar',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }



    Widget _cancelar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
         
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Color.fromRGBO(248, 64, 0, 1),
        child: Text(
          'Cancelar',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }



}

