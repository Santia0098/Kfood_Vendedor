import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kfood_vendedor/presentacion/CargaPage/loadPage.dart';

import 'notificaciones/BackgroundHandler.dart';
 
void main(){
  runApp(MyApp());

  print("INICIANDO CONFIGURACION DE FIREBASE MESSAGING");
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  _firebaseMessaging.requestNotificationPermissions();
  _firebaseMessaging.configure(
      onMessage: bh
      ,onBackgroundMessage: bh
  );
  _firebaseMessaging.getToken().then((String token){
    print("TOKEN: $token");5
  });

}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return MaterialApp(
      title: 'KFood',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Splash(),
      ),
    );
  }
}