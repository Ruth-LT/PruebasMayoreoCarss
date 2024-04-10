import 'dart:convert';

class  detalleorden{
  int orden_compra;
  int numero_linea;
  int clave_articulo;
  String articulo;
  String nombre_articulo;
  String nombre_unidad;
  double cantidad;
  double costo;
  int impuesto;
  int impuesto_IEPS;

  detalleorden(
      {
        this.orden_compra,
        this.numero_linea,
        this.clave_articulo,
        this.articulo,
        this.nombre_articulo,
        this.nombre_unidad,
        this.cantidad,
        this.costo,
        this.impuesto,
        this.impuesto_IEPS,
      });

  factory detalleorden.fromJson(Map<String, dynamic> json) {
    return detalleorden(
      orden_compra: json['orden_compra'] as int,
      numero_linea: json['numero_linea'] as int,
      clave_articulo: json['clave_articulo'] as int,
      articulo: json['articulo'] as String,
      nombre_articulo: json['nombre_articulo'] as String,
      nombre_unidad: json['nombre_unidad'] as String,
      cantidad: double.parse(json['cantidad'].toString()),
      costo: double.parse(json['costo'].toString()),
      impuesto: json['impuesto'] as int,
      impuesto_IEPS: json['impuesto_IEPS'] as int,
    );
  }

}