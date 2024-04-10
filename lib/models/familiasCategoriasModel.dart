class familiasCategorias {
  int familia;
  String nombre_familia;

  familiasCategorias({this.familia, this.nombre_familia});

  factory familiasCategorias.fromJson(Map<String, dynamic> json) {
    return familiasCategorias(
        familia: json['familia'] as int,
        nombre_familia: json['nombre_familia'] as String
    );
  }
}