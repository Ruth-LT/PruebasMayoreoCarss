import 'dart:convert';

import 'ordenDetalleModel.dart';

class  ordencompleta{
  int status;
  int pedido;

  ordencompleta(
      {
        this.status,
        this.pedido,
      });

  factory ordencompleta.fromJson(Map<String, dynamic> json) {
    return ordencompleta(
        status: json['status'] as int,
      pedido: json['orden'] as int,
    );

  }


}