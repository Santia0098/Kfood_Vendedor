import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:kfood_vendedor/presentacion/InicioPage/inicio.dart';

class EntradasTexto extends StatefulWidget {
  @override
  _EntradasTextoState createState() => _EntradasTextoState();
}

class _EntradasTextoState extends State<EntradasTexto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(135, 135, 135, .3),
                blurRadius: 20,
                offset: Offset(0, 10))
          ]),
      child: Column(
        children: <Widget>[
          Container(
              width: 300,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Usuario",
                  hintText: "Nombre de usuario",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.redAccent, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              )),
          Container(
              padding: EdgeInsets.only(top: 30),
              width: 300,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Contraseña",
                  hintText: "Contraseña de cuenta",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.redAccent, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              )),
          Container(
            alignment: Alignment.centerRight,
            child: FlatButton(
              onPressed: () {
                //forgot password screen
              },
              textColor: Colors.red,
              child: Text('¿Olvidaste tu contraseña?'),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 45, left: 15, right: 15, bottom: 25),
            child: ProgressButton(
              height: 45,
              defaultWidget: const Text(
                'INICIAR SESIÓN',
                style: TextStyle(color: Colors.white),
              ),
              progressWidget: const CircularProgressIndicator(),
              color: Colors.redAccent,
              borderRadius: 15,
              onPressed: () async {
                int score = await Future.delayed(
                    const Duration(milliseconds: 3000), () => 42);
                return () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InicioPage(),
                      ));
                };
              },
            ),
          ),
        ],
      ),
    );
  }
}
