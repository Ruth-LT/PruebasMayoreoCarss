import 'package:one_page/models/sublineasCategoriasModel.dart';

class categorias {
  int linea;
  String nombre_linea;
  List<sublineasCategorias> sublineas;

  categorias({this.linea, this.nombre_linea, this.sublineas});

  factory categorias.fromJson(Map<String, dynamic> json) {
    List<dynamic> detallesSublineas = json['sublineas'];

    return categorias(
        linea: json['linea'] as int,
        nombre_linea: json['nombre_linea'] as String,
        sublineas: detallesSublineas
            .map<sublineasCategorias>(
                (json) => sublineasCategorias.fromJson(json))
            .toList());
  }
}
