import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:kfood_vendedor/datos/requests.dart';

Future<String> getIDfromCafeteria() async {
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  Map<String,String> correo = {
    'correo':'${user.email}'
  };
  String jsonCafeteriaId = await executeHttpRequest(urlFile: "/getCafeteriaID.php", requestBody: correo);
  print(jsonCafeteriaId);
  Map<String,dynamic> id = json.decode(jsonCafeteriaId);
  return id['id'];
}