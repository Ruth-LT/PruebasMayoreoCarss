import 'dart:typed_data';


class proveedores{
  String clase;
  String clave_anterior;
  String comentarios;
  String nombre_comercial;
  String nombre_proveedor;
  int proveedor;
  String rfc;
  proveedores(
      {
        this.clase,
        this.clave_anterior,
        this.comentarios,
        this.nombre_comercial,
        this.nombre_proveedor,
        this.proveedor,
        this.rfc,
      });

  factory proveedores.fromJson(Map<String, dynamic> json) {
    return proveedores(
      clase: json['clase'] as String,
      clave_anterior: json['clave_anterior'] as String,
      comentarios: json['comentarios'] as String,
      nombre_comercial: json['nombre_comercial'] as String,
      nombre_proveedor: json['nombre_proveedor'] as String,
      proveedor: json['proveedor'] as int,
      rfc: json['rfc'] as String,
    );
  }
  static List<proveedores> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => proveedores.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String articulosAsString() {
    return '#${this.proveedor} ${this.nombre_proveedor}';
  }



  ///custom comparing function to check if two users are equal
  bool isEqual(proveedores model) {
    return this.proveedor == model.proveedor;
  }

  @override
  String toString() => nombre_proveedor;
}