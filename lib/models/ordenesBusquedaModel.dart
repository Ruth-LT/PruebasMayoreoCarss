import 'dart:typed_data';


class ordenesBusqueda{
  int orden_compra;
  String cFecha;
  String nombre_sucursal;
  String nombre_proveedor;
  String estado_actual;
  ordenesBusqueda(
      {
        this.orden_compra,
        this.cFecha,
        this.nombre_sucursal,
        this.nombre_proveedor,
        this.estado_actual,
      });

  factory ordenesBusqueda.fromJson(Map<String, dynamic> json) {
    return ordenesBusqueda(
      orden_compra: json['orden_compra'] as int,
      cFecha: json['cFecha'] as String,
      nombre_sucursal: json['nombre_sucursal'] as String,
      nombre_proveedor: json['nombre_proveedor'] as String,
      estado_actual: json['estado_actual'] as String,
    );
  }
  static List<ordenesBusqueda> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => ordenesBusqueda.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String articulosAsString() {
    return '#${this.orden_compra} ${this.nombre_proveedor}';
  }



  ///custom comparing function to check if two users are equal
  bool isEqual(ordenesBusqueda model) {
    return this.orden_compra == model.orden_compra;
  }

  @override
  String toString() => nombre_proveedor;
}