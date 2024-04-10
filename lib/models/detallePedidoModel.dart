class detallePedido{
  int pedido;
  int clave_articulo;
  String articulo;
  String nombre_articulo;
  int numero_linea;
  double cantidad;
  double cantidad_piezas;
  double cantidad_venta;
  double precio_pactado;
  double importe;
  double importe_impuesto;
  double impuesto_IEPS;

  detallePedido(
      {
        this.pedido,
        this.clave_articulo,
        this.articulo,
        this.nombre_articulo,
        this.numero_linea,
        this.cantidad,
        this.cantidad_piezas,
        this.cantidad_venta,
        this.precio_pactado,
        this.importe,
        this.importe_impuesto,
        this.impuesto_IEPS,
      });

  factory detallePedido.fromJson(Map<String, dynamic> json) {
    return detallePedido(
      pedido: json['pedido'] as int,
      clave_articulo: json['clave_articulo'] as int,
      articulo: json['articulo'] as String,
      nombre_articulo: json['nombre_articulo'] as String,
      numero_linea: json['numero_linea'] as int,
      cantidad: double.parse(json['cantidad'].toString()),
      cantidad_piezas: double.parse(json['cantidad_piezas'].toString()),
      cantidad_venta: json['cantidad_venta'] as double,
      precio_pactado: double.parse(json['precio_pactado'].toString()),
      importe: double.parse(json['importe'].toString()),
      importe_impuesto: double.parse(json['importe_impuesto'].toString()),
      impuesto_IEPS: double.parse(json['impuesto_IEPS'].toString()),
    );
  }

  static List<detallePedido> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => detallePedido.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String articulosAsString() {
    return '#${this.articulo} ${this.nombre_articulo}';
  }



  ///custom comparing function to check if two users are equal
  bool isEqual(detallePedido model) {
    return this.articulo == model.articulo;
  }

  @override
  String toString() => nombre_articulo;
}