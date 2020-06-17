

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:kfood_vendedor/datos/requests.dart';
import 'package:kfood_vendedor/presentacion/InicioPage/NavegacionPages/helper/StringFormat.dart';
import 'package:kfood_vendedor/presentacion/InicioPage/NavegacionPages/helper/getIDfromCafeterias.dart';

Future<bool> logIn(String user, String pass) async {
  bool response = await existUser();
  if(! response){
    try{
      String email = await getEmailFromMysql(user);
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: pass);
      response = await existUser();
    } catch (error) {
      print(error.message);
      switch (error.message){
        case 'The password is invalid or the user does not have a password.':
          print("Contraseña erronea");
          break;
      }
    }
  }
  return response;
}

Future<String> getEmailFromMysql(String matricula) async {
  print("Inicio la funcion getEmailFromMysql(String matricula=$matricula)");
  Map<String,String> body = {
    'usuario':'$matricula'
  };
  String response = await executeHttpRequest(urlFile: "/loginCafeteria.php", requestBody: body);
  print("el server respondio: $response");
  final decodedData = json.decode(response);
  String responseValue = decodedData['user'].toString();
  responseValue = responseValue.replaceAll("[{", "{");
  responseValue = responseValue.replaceAll("}]", "}");
  print("responseValue = $responseValue");
  final decodedData2 = json.decode(textFormarter(responseValue));
  String responseValue2 = decodedData2['correo'].toString();
  print(responseValue2);
  return responseValue2;
}

Future<bool> existUser() async {
  bool response = false;
  var user = await FirebaseAuth.instance.currentUser();
  if(user != null){
    print("Usuario existe ${user.email}");
    response = true;
  }else{
    print("No existe usuario");
  }
  return response;
}

restorePassword(String email) async {
  try{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }catch(error){
    print(error.message);
    switch (error.message){
      case 'There is no user record corresponding to this identifier. The user may have been deleted.':
        print("No existe el usuario");
        break;
    }
  }

}

updateToken() async {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String token = await _firebaseMessaging.getToken();
  String id = await getIDfromCafeteria();
  Map<String, String> body = {
    'id':'$id',
    'token':'$token'
  };
  executeHttpRequest(urlFile: "/updateToken.php", requestBody: body).then((respuesta){
    print("updateToken.php respondio: $respuesta, cuando id=$id al actualizar token:$token");
  });
}