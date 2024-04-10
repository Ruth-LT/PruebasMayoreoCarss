import 'familiasModel.dart';

class Sublinea {
  String sublinea;
  String nombre_sublinea;
  int countBusqueda;
  String linea;
  bool selected;
  List<Familias> familia;
  Sublinea(
      {this.sublinea,
      this.nombre_sublinea,
        this.countBusqueda,
        this.linea,
        this.selected,
        this.familia
      });

  factory Sublinea.fromJson(Map<String, dynamic> json) {
    return Sublinea(
      sublinea: json['sublinea'] as String,
      nombre_sublinea: json['nombre_sublinea'].toString().toUpperCase() as String,
      linea: json['linea'] as String,
      countBusqueda: 0,
      selected: false,
      familia: []
    );
  }
}
