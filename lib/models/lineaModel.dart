
import 'package:one_page/models/sublineaModel.dart';

class Linea {
  String linea;
  String nombre_linea;
  String ubicacion_URL;
  int countBusqueda;
  bool selected;
  List<Sublinea> sublineas;
  Linea(
      {this.linea,
      this.nombre_linea,
      this.ubicacion_URL,
        this.countBusqueda,
        this.selected,
        this.sublineas
      });

  factory Linea.fromJson(Map<String, dynamic> json) {
    return Linea(
      linea: json['linea'] as String,
        nombre_linea: json['nombre_linea'].toString().toUpperCase() as String,
        ubicacion_URL: json['ubicacion_URL'] as String,
      countBusqueda: 0,
      selected: false,
        sublineas: []
    );
  }
}
