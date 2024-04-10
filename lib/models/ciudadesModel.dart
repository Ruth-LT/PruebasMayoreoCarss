class ciudades{
  int ciudad;
  String clave_lada;
  String estado;
  String mascara;
  String nombre;
  String nombre_estado;
  String nombre_pais;

  ciudades(
      {
        this.ciudad,
        this.clave_lada,
        this.estado,
        this.mascara,
        this.nombre,
        this.nombre_estado,
        this.nombre_pais
      });

  factory ciudades.fromJson(Map<String, dynamic> json) {
    return ciudades(
      ciudad: json['ciudad'] as int,
      clave_lada: json['clave_lada'] as String,
      estado: json['estado'] as String,
      mascara: json['mascara'] as String,
      nombre: json['nombre'] as String,
      nombre_estado: json['nombre_estado'] as String,
      nombre_pais: json['nombre_pais'] as String
    );
  }
}