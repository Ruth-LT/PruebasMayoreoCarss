
class detalleCarrito{
  int clave_articulo;
  String articulo;
  String nombre_articulo;
  String descripcion_extendido;
  String ubicacion_URL;
  double precio_base;
  double cantidad;
  double total;

  detalleCarrito(
      {
        this.clave_articulo,
        this.articulo,
        this.nombre_articulo,
        this.descripcion_extendido,
        this.ubicacion_URL,
        this.precio_base,
        this.cantidad,
        this.total,
      });

  Map toJson() => {
    'clave_articulo' : clave_articulo,
    'articulo' : articulo,
    'nombre_articulo' : nombre_articulo,
    'descripcion_extendido' : descripcion_extendido,
    'ubicacion_URL' : ubicacion_URL,
    'precio_base' : precio_base,
    'cantidad' : cantidad,
    'total' : total
  };

  factory detalleCarrito.fromJson(Map<String, dynamic> json) {
    return detalleCarrito(
      clave_articulo: json['clave_articulo'] as int,
      articulo: json['articulo'] as String,
      nombre_articulo: json['nombre_articulo'] as String,
      descripcion_extendido: json['descripcion_extendido'] as String,
      ubicacion_URL: json['ubicacion_URL'] as String,
      precio_base: json['precio_base'] as double,
      cantidad: json['cantidad'] as double,
      total: json['total'] as double,
    );
  }

}