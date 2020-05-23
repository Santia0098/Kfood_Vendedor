import 'dart:convert';
import 'package:kfood_vendedor/negocios/providers/pedidos.dart';
import 'package:kfood_vendedor/datos/requests.dart';
import 'package:kfood_vendedor/presentacion/InicioPage/NavegacionPages/PedidosPage/pedidos.dart';

Future<String> solicitarComida() async{
  return await executeHttpRequest(urlFile: '/.php', requestBody: null);
}

Future<void> traerComida(PedidosP innerPedidos) async{

  return solicitarComida().then((value){
    final decodedData = json.decode(value);
    innerPedidos.fromJsonList(decodedData['pedido']);

  });

}