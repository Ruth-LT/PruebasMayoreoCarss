import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../backend/database_connect.dart';
import '../../../constants.dart';
import '../../../models/articulosModel.dart';
import '../../../models/detalleCarritoModel.dart';
import '../../../models/detallePedidoModel.dart';
import '../../../models/familiasModel.dart';
import '../../../models/lineaModel.dart';
import '../../../models/pedidoModel.dart';
import '../../../models/sublineaModel.dart';
import '../../../responsive.dart';

class ContactSectionWidget extends StatefulWidget {
  final Sublinea sublineaActual;
  final Linea lineaActual;
  final Familias familia;
  final List<articulos> articulo;
  const ContactSectionWidget(
      {Key key,
      this.sublineaActual,
      this.lineaActual,
      this.articulo,
      this.familia})
      : super(key: key);

  ProductSection createState() => ProductSection();
}

class ProductSection extends State<ContactSectionWidget> {
  //Your code here
  int countPages = 1;
  int countProducts = 0;
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
    // _getCategorias();
    // _getUltimosCuatro();
  }

  // _getCategorias() {
  //   DatabaseProvider.getSublineas(widget.sublineaActual.linea).then((lineasResult) {
  //     setState(() {
  //       sublineaLista = lineasResult;
  //     });
  //   });
  // }

  //
  // _getUltimosCuatro() {
  //   print(widget.sublineaActual.sublinea);
  //   DatabaseProvider.getArticulosPaginaSublinea(1,20,countPages, int.parse(widget.familia.familia)).then((articulosResult) {
  //     setState(() {
  //       articulosLista = articulosResult;
  //     });
  //   });
  //   print(articulosLista.length);
  // }

  @override
  Widget build(BuildContext context) {
    bool isHover = false;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            // decoration: const BoxDecoration(
            //     border: Border(
            //         bottom: BorderSide(color: kSecondaryColor, width: 3))),
            child: Text(
              "Contáctanos",
              maxLines: 2,
              style: GoogleFonts.sourceSansPro(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child:  Container(
                  width: Responsive.isDesktop(context)
                      ? MediaQuery.of(context).size.width * .4
                      : MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,

                    // borderRadius: BorderRadius.circular(20),
                    // border: Border.all(
                    //     color: kgreyColor, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 20,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          // decoration: const BoxDecoration(
                          //     border: Border(
                          //         bottom: BorderSide(color: kSecondaryColor, width: 3))),
                          child: Text(
                            "CHIHUAHUA",
                            maxLines: 2,
                            style: GoogleFonts.sourceSansPro(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Calle Pino #3114 Col. Zona Industrial Nombre de Dios",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 200,

                          style: GoogleFonts.sourceSansPro(
                            fontSize: 18, fontWeight: FontWeight.w600, ),
                        ),
                        Text(
                          "01 (614) 417 9477",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 200,

                          style: GoogleFonts.sourceSansPro(
                            fontSize: 18, fontWeight: FontWeight.w600, ),
                        ),
                        Text(
                          "01 (614) 419 9961",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 200,

                          style: GoogleFonts.sourceSansPro(
                            fontSize: 18, fontWeight: FontWeight.w600, ),
                        ),
                        Text(
                          "chihuahua@pinturaspromex.com.mx",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 200,

                          style: GoogleFonts.sourceSansPro(
                            fontSize: 18, fontWeight: FontWeight.w600, ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: (){
                            DatabaseProvider.canLaunchUrl("https://goo.gl/maps/KJrL2vmAALvX4NaZ8");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: kPrimaryColor,

                              // borderRadius: BorderRadius.circular(20),
                              // border: Border.all(
                              //     color: kgreyColor, width: 3),
                              boxShadow: [
                                BoxShadow(
                                  color: kPrimaryColor.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 20,
                                  offset:
                                  Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(padding: EdgeInsets.all(15),child: Container(
                              // decoration: const BoxDecoration(
                              //     border: Border(
                              //         bottom: BorderSide(color: kSecondaryColor, width: 3))),
                              child: Text(
                                "VER EN MAPS",
                                style: GoogleFonts.sourceSansPro(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child:  Container(
                  width: Responsive.isDesktop(context)
                      ? MediaQuery.of(context).size.width * .4
                      : MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,

                    // borderRadius: BorderRadius.circular(20),
                    // border: Border.all(
                    //     color: kgreyColor, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 20,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          // decoration: const BoxDecoration(
                          //     border: Border(
                          //         bottom: BorderSide(color: kSecondaryColor, width: 3))),
                          child: Text(
                            "JUAREZ",
                            maxLines: 2,
                            style: GoogleFonts.sourceSansPro(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Eje Vial Juan Gabriel #4240-interior 3 El Vergel",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 200,

                          style: GoogleFonts.sourceSansPro(
                              fontSize: 18, fontWeight: FontWeight.w600, ),
                        ),
                        Text(
                          "01 (656) 610 7058",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 200,

                          style: GoogleFonts.sourceSansPro(
                            fontSize: 18, fontWeight: FontWeight.w600, ),
                        ),

                        Text(
                          "chihuahua@pinturaspromex.com.mx",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 200,

                          style: GoogleFonts.sourceSansPro(
                            fontSize: 18, fontWeight: FontWeight.w600, ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: (){
                            DatabaseProvider.canLaunchUrl("https://goo.gl/maps/49WFYNqjihYJkRreA");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: kPrimaryColor,

                              // borderRadius: BorderRadius.circular(20),
                              // border: Border.all(
                              //     color: kgreyColor, width: 3),
                              boxShadow: [
                                BoxShadow(
                                  color: kPrimaryColor.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 20,
                                  offset:
                                  Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(padding: EdgeInsets.all(15),child: Container(
                              // decoration: const BoxDecoration(
                              //     border: Border(
                              //         bottom: BorderSide(color: kSecondaryColor, width: 3))),
                              child: Text(
                                "VER EN MAPS",
                                style: GoogleFonts.sourceSansPro(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]);
  }
}
