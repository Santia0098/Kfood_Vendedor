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
                _olvidasteContraSheet();
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
              progressWidget: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              color: Colors.redAccent,
              borderRadius: 15,
              onPressed: () async {
                int score = await Future.delayed(
                    const Duration(milliseconds: 3000), () => 42);
                return () {
                  Navigator.pushReplacement(
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

  void _olvidasteContraSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Recupera tu cuenta",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'SFUIDisplay',
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(234, 100, 86, 1.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 2, bottom: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Enviaremos un mensaje al siguiente correo",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'SFUIDisplay',
                            color: Colors.black45),
                      )),
                ),
                Divider(
                  thickness: 2,
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20, left: 25, right: 25),
                    child: TextFormField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        labelText: "Email de cuenta",
                        hintText: "Email",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.redAccent, width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    )),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(top: 25, right: 25, bottom: 5),
                  child: MaterialButton(
                    onPressed: () {},
                    textColor: Colors.black54,
                    height: 35,
                    highlightColor: Colors.red,
                    splashColor: Colors.red,
                    colorBrightness: Brightness.dark,
                    textTheme: ButtonTextTheme.accent,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.redAccent)),
                    child: Text("Recuperar"),
                  ),
                )
              ],
            ),
          );
        });
  }
}
