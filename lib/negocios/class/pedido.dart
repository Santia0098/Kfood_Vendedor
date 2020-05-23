class Pedido{

  String idPedido;
  String idUsuario;
  String nombreUsuario;
  String apePat;
  String apeMat;
  String estado;
  String total;
  String hora;

  Pedido(this.idPedido, this.idUsuario, this.nombreUsuario, this.apePat, this.apeMat, this.estado, this.total, this.hora);

  Pedido.fromJsonMap(Map<dynamic, dynamic> json){
    idPedido = json['idpedido'];
    idUsuario = json['idusuario'];
    nombreUsuario = json['nombreUsuario'];
    apePat = json['apePat'];
    apeMat = json['apeMat'];
    estado = json['estado'];
    total = json['total'];
    hora = json['hora'];
  }
}