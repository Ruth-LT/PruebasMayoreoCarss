class articulos{
  int clave_articulo;
  String familia;
  String sublinea;
  String linea;
  String nombre_sublinea;
  String articulo;
  String nombre_articulo;
  String descripcion_extendido;
  String nombre_unidad;
  String nombre_unidad_alterna;
  String nombre_corto_unidad;
  String nombre_corto_alterna;
  String nombre_unidad_venta;
  String ubicacion_URL;
  double factor_alterna;
  double disponible;
  double precio_base;
  String foto_articulo;
  int solo_piezas;
  bool busqueda;

  articulos(
      {
        this.clave_articulo,
        this.familia,
        this.sublinea,
        this.linea,
        this.nombre_sublinea,
        this.articulo,
        this.nombre_articulo,
        this.descripcion_extendido,
        this.nombre_unidad,
        this.nombre_unidad_alterna,
        this.nombre_corto_unidad,
        this.nombre_corto_alterna,
        this.nombre_unidad_venta,
        this.ubicacion_URL,
        this.factor_alterna,
        this.disponible,
        this.precio_base,
        this.foto_articulo,
        this.solo_piezas,
        this.busqueda
      });

  factory articulos.fromJson(Map<String, dynamic> json) {
    return articulos(
      clave_articulo: json['clave_articulo'] as int,
      familia: json['familia'] as String,
      sublinea: json['sublinea'] as String,
      linea: json['linea'] as String,
      nombre_sublinea: json['nombre_sublinea'] as String,
      articulo: json['articulo'] as String,
      nombre_articulo: json['nombre_articulo'] as String,
      descripcion_extendido: json['descripcion_extendida'] as String,
      nombre_unidad: json['nombre_unidad'] as String,
      nombre_unidad_alterna: json['nombre_unidad_alterna'] as String,
      nombre_corto_unidad: json['nombre_corto_unidad'] as String,
      nombre_corto_alterna: json['nombre_corto_alterna'] as String,
      nombre_unidad_venta: json['nombre_unidad_venta'] as String,
      ubicacion_URL: json['ubicacion_URL'] as String,
      factor_alterna: double.parse(json['factor_alterna'].toString()) ,
      // disponible: 1.0 ,
      disponible: double.parse(json['disponible'].toString()) ,
      // precio_base: 2.0 ,
      precio_base: double.parse(json['precio_base'].toString()) ,
        foto_articulo: json['foto_articulo'].toString(),
      solo_piezas: json['solo_piezas'] as int,
      busqueda: true

    );
  }

  static List<articulos> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => articulos.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String articulosAsString() {
    return '#${this.articulo} ${this.nombre_articulo}';
  }



  ///custom comparing function to check if two users are equal
  bool isEqual(articulos model) {
    return this.articulo == model.articulo;
  }

  @override
  String toString() => nombre_articulo;
}