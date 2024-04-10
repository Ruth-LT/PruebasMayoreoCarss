class precios{
  int clave_articulo;
  double precio;
  double tasa_IVA;
  double tasa_IEPS;
  int tiene_IVA;
  String tipo_IEPS;

  precios(
      {
        this.clave_articulo,
        this.precio,
        this.tasa_IVA,
        this.tasa_IEPS,
        this.tiene_IVA,
        this.tipo_IEPS,
      });

  factory precios.fromJson(Map<String, dynamic> json) {
    return precios(
      clave_articulo: json['clave_articulo'] as int,
      precio:  double.parse(json['precio'].toString()),
      tasa_IVA:   double.parse(json['tasa_IVA'].toString()),
      tasa_IEPS:  double.parse(json['tasa_IEPS'].toString()),
      tiene_IVA: json['tiene_IVA'] as int,
      tipo_IEPS: json['tipo_IEPS'] as String,
    );
  }

  static List<precios> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => precios.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String articulosAsString() {
    return '#${this.clave_articulo} ';
  }



  ///custom comparing function to check if two users are equal
  bool isEqual(precios model) {
    return this.clave_articulo == model.clave_articulo;
  }

  @override
  String toString() => clave_articulo.toString();
}