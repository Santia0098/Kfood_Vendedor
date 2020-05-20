import 'dart:convert';
import 'dart:ui';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../presentacion/InicioPage/NavegacionPages/helper/StringFormat.dart';

Future<dynamic> bh(Map<String, dynamic> message) async {
  print("EL MEnsaje: $message");
  String formatedMessage = await textFormarter(message.toString());
  print("FORMATEADO: $formatedMessage");
  Map<String,dynamic> notification = json.decode(formatedMessage);
  Map<String,dynamic> notificationData = notification['data'];
  Iterable<dynamic> datos = notificationData.values;
  List<dynamic> ldatos = datos.toList();
  print("titulo:${ldatos[0]} body:${ldatos[1]}");
  FlutterLocalNotificationsPlugin flnp = FlutterLocalNotificationsPlugin();
  var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      'your other channel id',
      'your other channel name',
      'your other channel description',
      icon: 'mipmap/ic_launcher',
      color: const Color.fromARGB(255, 255, 0, 0));
  var iOSPlatformChannelSpecifics =
  new IOSNotificationDetails(sound: "slow_spring_board.aiff");
  var platformChannelSpecifics = new NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  await flnp.show(
      0,
      '${ldatos[0]}',
      '${ldatos[1]}',
      platformChannelSpecifics);
  return Future<void>.value();

}