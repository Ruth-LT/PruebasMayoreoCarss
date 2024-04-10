class user {
  int sucursal;
  int sucursal_almacen;
  int usuario;
  bool es_supervisor;
  String nombre_persona;
  String cumpleanos;
  String mensaje;
  bool status;
  user({
      this.sucursal,
      this.sucursal_almacen,
      this.usuario,
      this.es_supervisor,
      this.nombre_persona,
      this.cumpleanos,
      this.mensaje,
      this.status});

  factory user.fromJson(Map<String, dynamic> json) {
    return user(
      sucursal: json['sucursal'] as int,
      sucursal_almacen: json['sucursal_almacen'] as int,
      usuario: json['cliente'] as int,
      es_supervisor: json['es_supervisor'] as bool,
      nombre_persona: json['nombre_persona'] as String,
      cumpleanos: json['cumpleanos'] as String,
      mensaje: json['mensaje'] as String,
      status: json['status'] as bool,
    );
  }
}
