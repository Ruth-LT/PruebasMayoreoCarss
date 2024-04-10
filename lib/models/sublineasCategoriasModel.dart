import 'package:one_page/models/familiasCategoriasModel.dart';

class sublineasCategorias {
  int sublinea;
  String nombre_sublinea;
  List<familiasCategorias> familias;

  sublineasCategorias({this.sublinea, this.nombre_sublinea, this.familias});

  factory sublineasCategorias.fromJson(Map<String, dynamic> json) {
    List<dynamic> detallesFamilias = json['familias'];

    return sublineasCategorias(
        sublinea: json['sublinea'] as int,
        nombre_sublinea: json['nombre_sublinea'] as String,
        familias: detallesFamilias
            .map<familiasCategorias>((json) => familiasCategorias.fromJson(json))
            .toList());
  }
}
