class claseProvedor{
  int clase_proveedor;
  String nombre_clase;
  claseProvedor(
      {
        this.clase_proveedor,
        this.nombre_clase,
      });

  factory claseProvedor.fromJson(Map<String, dynamic> json) {
    return claseProvedor(
      clase_proveedor: json['clase_proveedor'] as int,
      nombre_clase: json['nombre_clase'] as String,
    );
  }
}