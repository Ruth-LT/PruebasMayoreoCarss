class Familias {
  String familia;
  String nombre_familia;
  int countBusqueda;
  String sublinea;
  Familias(
      {this.sublinea,
      this.nombre_familia,
        this.countBusqueda,
        this.familia,
      });

  factory Familias.fromJson(Map<String, dynamic> json) {
    return Familias(
      sublinea: json['sublinea'] as String,
      nombre_familia: json['nombre_famili'].toString().toUpperCase() as String,
      familia: json['familia'] as String,
      countBusqueda: 0
    );
  }
}
