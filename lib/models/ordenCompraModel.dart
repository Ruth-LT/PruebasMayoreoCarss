import 'dart:convert';

import 'ordenDetalleModel.dart';

class  ordencompra{
  int orden_compra;
  String cFecha;
  String cPromesa;
  int proveedor;
  String nombre_proveedor;
  bool tipo_urgente;
  String comentarios;
  List<detalleorden> detalle_orden;

  ordencompra(
      {
        this.orden_compra,
        this.cFecha,
        this.cPromesa,
        this.proveedor,
        this.nombre_proveedor,
        this.tipo_urgente,
        this.comentarios,
        this.detalle_orden
      });

  factory ordencompra.fromJson(Map<String, dynamic> json) {
    List<dynamic> ordencomprajson = json['orden_compra'];
    List<dynamic> detallesjson =  json['detalles'];
    Map<String, dynamic> ordenCompra = ordencomprajson[0];
    var listaDetallesOrden = detallesjson.cast<Map<String, dynamic>>();
    return ordencompra(
        orden_compra: ordenCompra['orden_compra'] as int,
        cFecha: ordenCompra['cFecha'] as String,
        cPromesa: ordenCompra['cPromesa'] as String,
        proveedor: ordenCompra['proveedor'] as int,
        nombre_proveedor: ordenCompra['nombre_proveedor'] as String,
        tipo_urgente: ordenCompra['tipo_urgente'] as bool,
        comentarios: ordenCompra['comentarios'] as String,
        detalle_orden: parseDetalles(listaDetallesOrden)
    );

  }
  static List<detalleorden> parseDetalles(List<Map<String, dynamic>> responseBody) {
    return responseBody.map<detalleorden>((json) => detalleorden.fromJson(json)).toList();
  }

}