import 'package:flutter/material.dart';
import 'package:kfood_vendedor/negocios/class/pedido.dart';

class PedidosP with ChangeNotifier{

  //separa las pedidos del json y las almacena en una lista
  List<Pedido> _pedidos = new List<Pedido>();
  fromJsonList(List<dynamic> jsonList){
    if(jsonList == null )return;
    for(var item in jsonList){
      final pedido = new Pedido.fromJsonMap(item);
      _pedidos.add(pedido);
    }
    notifyListeners();
  }

  void limpiarLista(){
    _pedidos.clear();
    notifyListeners();
  }

  get pedidos {
    return _pedidos;
  }

  set pedidos(List<Pedido> pedidos){
    this._pedidos = pedidos;
    notifyListeners();
  }

}