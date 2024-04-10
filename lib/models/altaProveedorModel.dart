class altaProveedor{
  String sucursal;
  String comprador;
  int clase;
  int ciudad;
  String nombre;
  String rfc;
  String tax_id;
  String calle;
  String no_exterior;
  String no_interior;
  String colonia;
  String codigo_postal;
  String entre_calles;
  String area;
  String telefono;
  String extension;
  String nombre_contacto;
  String apellido_contacto;
  String tipo_contacto;
  String correo;
  String puesto;
  int proveedor;

  altaProveedor(
      {
        this.sucursal,
        this.comprador,
        this.clase,
        this.ciudad,
        this.nombre,
        this.rfc,
        this.tax_id,
        this.calle,
        this.no_exterior,
        this.no_interior,
        this.colonia,
        this.codigo_postal,
        this.entre_calles,
        this.area,
        this.telefono,
        this.extension,
        this.nombre_contacto,
        this.apellido_contacto,
        this.tipo_contacto,
        this.correo,
        this.puesto,
        this.proveedor,
      });

  factory altaProveedor.fromJson(Map<String, dynamic> json) {
    return altaProveedor(
      sucursal: json['sucursal'] as String,
      comprador: json['comprador'] as String,
      clase: json['clase'] as int,
      ciudad: json['ciudad'] as int,
      nombre: json['nombre'] as String,
      rfc: json['rfc'] as String,
      tax_id: json['tax_id'] as String,
      calle: json['calle'] as String,
      no_exterior: json['no_exterior'] as String,
      no_interior: json['no_interior'] as String,
      colonia: json['colonia'] as String,
      codigo_postal: json['codigo_postal'] as String,
      entre_calles: json['entre_calles'] as String,
      area: json['area'] as String,
      telefono: json['telefono'] as String,
      extension: json['extension'] as String,
      nombre_contacto: json['nombre_contacto'] as String,
      apellido_contacto: json['apellido_contacto'] as String,
      tipo_contacto: json['tipo_contacto'] as String,
      correo: json['correo'] as String,
      puesto: json['puesto'] as String,
      proveedor: json['proveedor'] as int,
    );
  }

  static List<altaProveedor> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => altaProveedor.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String articulosAsString() {
    return '#${this.nombre} ';
  }



  ///custom comparing function to check if two users are equal
  bool isEqual(altaProveedor model) {
    return this.proveedor == model.proveedor;
  }

  @override
  String toString() => nombre;
}