import 'package:flutter/material.dart';
import 'package:flutter_next/extensions/animation_extension.dart';
import 'package:flutter_next/extensions/context_extensions.dart';
import 'package:flutter_next/views/next_col.dart';
import 'package:flutter_next/views/next_row.dart';

import '../../../models/articulosModel.dart';
import '../../../models/detalleCarritoModel.dart';
import '../../../models/detallePedidoModel.dart';
import '../../../models/lineaModel.dart';
import '../../../models/pedidoModel.dart';
import '../../../models/sublineaModel.dart';
import '../backend/database_connect.dart';
import '../models/feature_model.dart';
import 'feature_item.dart';

class ProductSectionWidget extends StatefulWidget {
  List<articulos> articulo;
  ProductSectionWidget({Key key, this.articulo}) : super(key: key);

  ProductSection createState() => ProductSection();
}

class ProductSection extends State<ProductSectionWidget> {
  //Your code here

  TextEditingController busquedaController;
  List<Pedido> pedidosCliente = [];
  List<detallePedido> detallesPedidos = [];
  List<articulos> articulosLista = [];
  List<Sublinea> sublineaLista = [];
  List<Linea> lineaLista = [];
  List<detalleCarrito> detalleCarritoList = [];
  double totalOrden = 0.0;
  bool busqueda;
  List<FeatureModel> featuresList = [];

  TextEditingController lineaBusquedaController =
      TextEditingController(text: '');
  @override
  void initState() {
    super.initState();
    _getCategorias();
    _getUltimosCuatro();
  }

  _getCategorias() {
    DatabaseProvider.getLineas(1).then((lineasResult) {
      setState(() {
        lineaLista = lineasResult;
      });
    });
  }

  _getUltimosCuatro() {
    articulosLista = [];
    DatabaseProvider.getUltimosCuatro().then((articulosResult) {

      setState(() {
        articulosLista = articulosResult;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.height * 0.1),
      padding: EdgeInsets.symmetric(
          horizontal: context.isMobile ? 20 : context.width * 0.05),
      child: NextRow(
          verticalSpacing: 30,
          children: articulosLista
              .map((articulos e) => NextCol(
                    sizes: 'col-12 col-lg-3 col-md-6 col-sm-12',
                    child: FeatureItem(
                      articulo: e,
                    ).zoom(
                        viewPort: 0.28,
                        duration: const Duration(milliseconds: 300)),
                  ))
              .toList()),
    );
  }
}
