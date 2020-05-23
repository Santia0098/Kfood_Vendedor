import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:kfood_vendedor/datos/requests.dart';

Future<String> signIn(String email, String nombre, String apellidos, String cafeteria, String usuario, String contrasena) async {
  String response = "exito";
  //Crear usuario en firebase
  try{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.replaceAll(" ", ""), password: contrasena);

  }catch(error){
    print(error.message);
    switch(error.message){
      case 'The email address is already in use by another account.':
        print("El correo ya esta en uso");
        response = "existente";
        break;
      case 'The email address is badly formatted.':
        print("Error de formato");
        response = "mal formato";
        break;
      default:
        response = "error";
        break;

    }
  }

  if(response == "exito"){
    response = await uploadToMysql(email, nombre, apellidos, cafeteria, usuario, contrasena);
  }
  return response;
}

Future<String> uploadToMysql(String email, String nombre, String apellidos, String cafeteria, String usuario, String contrasena) async{
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String token = await _firebaseMessaging.getToken();
  Map<String,String> body = {
    'usuario':'${usuario.replaceAll(" ", "")}',
    'nombre':'$nombre',
    'apellidos':'$apellidos',
    'nom_cafeteria':'$cafeteria',
    'correo':'${email.replaceAll(" ", "")}',
    'pass':'$contrasena',
    'token':'$token'
  };

  String response = await executeHttpRequest(urlFile: "/registroCafeteria.php", requestBody: body);
  return response;
}

logOut() {
  FirebaseAuth.instance.signOut();
}

