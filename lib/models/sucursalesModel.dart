import 'dart:convert';

class sucursales {
  String nombre;

  String sucursal;

  sucursales({
    this.nombre,
    this.sucursal,
  });

  factory sucursales.fromJson(Map<String, dynamic> json) {
    return sucursales(
      nombre: json['nombre_sucursal'] as String,
      sucursal: json['sucursal'] as String,
    );
  }


}