import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kfood_vendedor/presentacion/LoginPage/widgets/cabeceraRegistro.dart';
import 'package:kfood_vendedor/presentacion/LoginPage/widgets/registroLogic.dart';

class RegistroSheet extends StatefulWidget {
  RegistroSheet({Key key}) : super(key: key);

  @override
  _RegistroSheetState createState() => _RegistroSheetState();
}

class _RegistroSheetState extends State<RegistroSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25, left: 45, right: 45, bottom: 55),
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        onPressed: () {
          _onPressed();
        },
        textColor: Colors.white,
        height: 45,
        highlightColor: Colors.white54,
        splashColor: Colors.red,
        colorBrightness: Brightness.dark,
        textTheme: ButtonTextTheme.accent,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white70)),
        child: Text("Registrate ahora" ),
      ),
    );
  }

  void _onPressed() {
    final usuarioController = TextEditingController();
    final nombreController = TextEditingController();
    final apellidosController = TextEditingController();
    final cafeteriaController = TextEditingController();
    final correoController = TextEditingController();
    final contrasenaController = TextEditingController();

    showBottomSheet(
        context: context,
        builder: (context) {
          return Container(

            alignment: Alignment.topLeft,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 40,
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: const Radius.circular(10),
              )
            ),
          child: SingleChildScrollView(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CabeceraReg(),
                Divider(
                  thickness: 2,
                ),
                Padding(

                    padding: EdgeInsets.only(top: 20, left: 25, right: 25),
                    child: TextFormField(
                      controller: usuarioController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person_outline),
                        labelText: "Usuario ",
                        hintText: "Ingrese un usuario.",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.redAccent, width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 20, left: 25, right: 25),
                    child: TextFormField(
                      controller: nombreController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.perm_contact_calendar),
                        labelText: "Nombre",
                        hintText: "Nombre.",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.redAccent, width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 20, left: 25, right: 25),
                    child: TextFormField(
                      controller: apellidosController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.perm_contact_calendar),
                        labelText: "Apellidos",
                        hintText: "Apellidos",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.redAccent, width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 20, left: 25, right: 25),
                    child: TextFormField(
                      controller: cafeteriaController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.restaurant),
                        labelText: "Cafeteria",
                        hintText: "Nombre de cafeteria",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.redAccent, width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 20, left: 25, right: 25),
                    child: TextFormField(
                      controller: correoController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.alternate_email),
                        labelText: "Correo",
                        hintText: "Correo de cuenta",
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.redAccent, width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 20, left: 25, right: 25),
                    child: TextFormField(
                      controller: contrasenaController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.vpn_key),
                        labelText: "Contraseña",
                        hintText: "Cree una contraseña",
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
                  padding:
                      EdgeInsets.only(top: 25, right: 25, bottom: 5),
                  child: MaterialButton(
                    onPressed: () async {
                      if("exito" == await signIn(correoController.text, nombreController.text, apellidosController.text, cafeteriaController.text, usuarioController.text, contrasenaController.text)){
                        logOut();
                        Navigator.pop(context);
                      }else{
                        Fluttertoast.showToast(
                          msg: "El correo no es del itsmante",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                        );
                      }
                    },
                    textColor: Colors.black54,
                    height: 35,
                    highlightColor: Colors.red,
                    splashColor: Colors.red,
                    colorBrightness: Brightness.dark,
                    textTheme: ButtonTextTheme.accent,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.redAccent)),
                    child: Text("Crear cuenta"),
                  ),
                )
              ],
            ),
          ),
          );
        });
  }
}
