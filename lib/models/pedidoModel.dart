class Pedido{
  int pedido;
  int cliente;
  String sucursal;
  String moneda;
  String fecha_pedido;
  String fecha_prometida_entrega;
  int tipo_cambio;
  String estado_actual;
  String comentarios;
  double importe_pedido;


  Pedido(
      {
        this.pedido,
        this.cliente,
        this.sucursal,
        this.moneda,
        this.fecha_pedido,
        this.fecha_prometida_entrega,
        this.tipo_cambio,
        this.estado_actual,
        this.comentarios,
        this.importe_pedido,

      });

  factory Pedido.fromJson(Map<String, dynamic> json) {
    return Pedido(
      pedido: json['pedido'] as int,
      cliente: json['cliente'] as int,
      sucursal: json['sucursal'] as String,
      moneda: json['moneda'] as String,
      fecha_pedido: json['fecha_pedido'] as String,
      fecha_prometida_entrega: json['fecha_prometida_entrega'] as String,
      tipo_cambio: json['tipo_cambio'] as int,
      estado_actual: json['estado_actual'] as String,
      comentarios: json['comentarios'] as String,
      importe_pedido: double.parse(json['importe_pedido'].toString()),

    );
  }

  static List<Pedido> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => Pedido.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String articulosAsString() {
    return '#${this.pedido} ';
  }



  ///custom comparing function to check if two users are equal
  bool isEqual(Pedido model) {
    return this.pedido == model.pedido;
  }

  @override
  String toString() => pedido.toString();
}