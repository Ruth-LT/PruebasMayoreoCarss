import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../backend/database_connect.dart';
import '../../../constants.dart';
import '../../../models/articulosModel.dart';
import '../../../models/detalleCarritoModel.dart';
import '../../../models/detallePedidoModel.dart';
import '../../../models/lineaModel.dart';
import '../../../models/pedidoModel.dart';
import '../../../models/sublineaModel.dart';
import '../subcategorias_screen.dart';
class CategorySectionWidget extends StatefulWidget {
  final Linea lineaActual;
  final List<articulos> articulo;
  const CategorySectionWidget({
    Key key, this.lineaActual, this.articulo
  }) : super(key: key);

  ProductSection createState() => ProductSection();
}

class ProductSection extends State<CategorySectionWidget> {
  //Your code here
  int countPages = 1;
  TextEditingController busquedaController;
  List<Pedido> pedidosCliente = [];
  List<detallePedido> detallesPedidos = [];
  List<articulos> articulosLista = [];
  List<Sublinea> sublineaLista = [];
  List<Linea> lineaLista = [];
  List<detalleCarrito> detalleCarritoList = [];
  double totalOrden = 0.0;
  bool busqueda;

  @override
  void initState() {
    super.initState();
    _getCategorias();
  }

  _getCategorias() {
    DatabaseProvider.getSublineas(widget.lineaActual.linea).then((lineasResult) {
      setState(() {
        sublineaLista = lineasResult;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    bool isHover = false;
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: kMaxWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                margin: const EdgeInsets.symmetric(horizontal: 10),

                child:  Text(
                  "LINEA",
                  style:   GoogleFonts.sourceSansPro(fontSize: 23, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                // decoration: const BoxDecoration(
                //     border: Border(
                //         bottom: BorderSide(color: kSecondaryColor, width: 3))),
                child:  Text(
                  "Selecciona una Sublinea",
                  style:   GoogleFonts.sourceSansPro(fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                // decoration: const BoxDecoration(
                //     border: Border(
                //         bottom: BorderSide(color: kSecondaryColor, width: 3))),
                child:  Text(
                  widget.lineaActual.nombre_linea,
                  style:   GoogleFonts.sourceSansPro(fontSize: 23, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              sublineaLista.length != 0
                  ? Wrap(
                      children: sublineaLista
                          .map((f) => GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 5.0),
                                  // margin: EdgeInsets.only(
                                  //     left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
                                  // decoration: BoxDecoration(
                                  //   border: Border.all(color: Color(0xFF282f61), width: 2.0),
                                  //   borderRadius: BorderRadius.all(Radius.circular(
                                  //       10.0) //                 <--- border radius here
                                  //   ),
                                  // ),
                                  child: MaterialButton(
                                    color: kPrimaryColor,
                                    height: 40,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SubCategoriesScreenWidget(sublineaActual: f, lineaActual: widget.lineaActual, ),),);
                                    },
                                    child: Text(
                                      f.nombre_sublinea,
                                      style:   GoogleFonts.sourceSansPro(
                                          color: kWhiteColor, fontSize: 20),
                                    ),
                                  ),
                                ),
                                onTap: () {},
                              ))
                          .toList(),
                    )
                  : Column(),
              //trending product section
              const SizedBox(
                height: 20,
              ),




              const SizedBox(
                height: 100,
              ),
              //bottom Navigation menu
            ],
          ),
        ),
      ],
    );
  }
}
