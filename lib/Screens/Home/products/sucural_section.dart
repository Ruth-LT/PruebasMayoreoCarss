import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../backend/database_connect.dart';
import '../../../constants.dart';
import '../../../models/articulosModel.dart';
import '../../../models/detalleCarritoModel.dart';
import '../../../models/detallePedidoModel.dart';
import '../../../models/lineaModel.dart';
import '../../../models/pedidoModel.dart';
import '../../../models/sublineaModel.dart';

class SucursalSectionWidget extends StatefulWidget {
  List<articulos> articulo;
  SucursalSectionWidget({Key key, this.articulo}) : super(key: key);

  ProductSection createState() => ProductSection();
}

class ProductSection extends State<SucursalSectionWidget> {
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
  String urlSucursal;
  SharedPreferences preffs;

  TextEditingController lineaBusquedaController =
      TextEditingController(text: '');
  @override
  void initState() {
    super.initState();
    _getCategorias();
    // _getUltimosCuatro();
    // _getImage();
  }

  _getCategorias() {
    DatabaseProvider.getLineas(1).then((lineasResult) {
      setState(() {
        lineaLista = lineasResult;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isHover = false;
    return Column(children: [
      Image.network(
        "https://pinturaspromex.com/resources/promexprepie.png",
        fit: BoxFit.fitWidth,
      ),
      Container(
          // constraints: BoxConstraints(maxWidth: kMaxWidth),

          child: Stack(alignment: Alignment.center, children: [
        Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: kPrimaryColor,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
                  Column(children: [
                    Container(
                        padding: EdgeInsets.only(right: 20, left: 20),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Image.network(
                                  DatabaseProvider.LOGO,
                                  width:
                                      MediaQuery.of(context).size.width * .12,
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      "Aichisa",
                                      style: GoogleFonts.sourceSansPro(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      "Dirección",
                                      style: GoogleFonts.sourceSansPro(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      "Calle Pino #3114 Col. Zona Industrial Nombre de Dios, Chih. Chihuahua, Mexico",
                                      style: GoogleFonts.sourceSansPro(
                                          color: Colors.white, fontSize: 18),
                                    ))
                              ],
                            ),
                            // Column(
                            //   children: [
                            //     Padding(
                            //       padding: EdgeInsets.only(top: 5),
                            //       child: Text(
                            //         "Accesos Directos ",
                            //         style:   GoogleFonts.sourceSansPro(
                            //             color: Colors.white,
                            //             fontSize: 20,
                            //             fontWeight: FontWeight.bold),
                            //       ),
                            //     ),
                            //     InkWell(
                            //       onTap: () {
                            //         Navigator.push(
                            //             context,
                            //             MaterialPageRoute(
                            //                 builder: (context) => CartScreen()));
                            //       },
                            //       child: Padding(
                            //         padding: EdgeInsets.only(top: 5),
                            //         child: Text(
                            //           "Inicio",
                            //           style:   GoogleFonts.sourceSansPro(
                            //               color: Colors.white,
                            //               fontSize: 18,
                            //               fontWeight: FontWeight.normal),
                            //         ),
                            //       ),
                            //     ),
                            //     InkWell(
                            //       onTap: () {
                            //         Navigator.push(
                            //             context,
                            //             MaterialPageRoute(
                            //                 builder: (context) =>
                            //                     ProductsScreenWidget()));
                            //       },
                            //       child: Padding(
                            //         padding: EdgeInsets.only(top: 5),
                            //         child: Text(
                            //           "Productos",
                            //           style:   GoogleFonts.sourceSansPro(
                            //               color: Colors.white,
                            //               fontSize: 18,
                            //               fontWeight: FontWeight.normal),
                            //         ),
                            //       ),
                            //     ),
                            //     InkWell(
                            //       onTap: () {
                            //         Navigator.push(
                            //             context,
                            //             MaterialPageRoute(
                            //                 builder: (context) => HomeScreen()));
                            //       },
                            //       child: Padding(
                            //         padding: EdgeInsets.only(top: 5),
                            //         child: Text(
                            //           "Carrito",
                            //           style:   GoogleFonts.sourceSansPro(
                            //               color: Colors.white,
                            //               fontSize: 18,
                            //               fontWeight: FontWeight.normal),
                            //         ),
                            //       ),
                            //     ),
                            //     InkWell(
                            //       onTap: () {
                            //         Navigator.push(
                            //             context,
                            //             MaterialPageRoute(
                            //                 builder: (context) => ProfileScreen()));
                            //       },
                            //       child: Padding(
                            //         padding: EdgeInsets.only(top: 5),
                            //         child: Text(
                            //           "Perfil",
                            //           style:   GoogleFonts.sourceSansPro(
                            //               color: Colors.white,
                            //               fontSize: 18,
                            //               fontWeight: FontWeight.normal),
                            //         ),
                            //       ),
                            //     ),

                            // ],
                            // ),
                            Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  'Copyright © MDS Desarollo de Sistemas - Alleato Software 2023',
                                  style: GoogleFonts.sourceSansPro(
                                      color: Colors.white, fontSize: 15),
                                ))
                          ],
                        ))
                  ])
                ]),
                //trending product section

                //bottom Navigation menu
              ],
            ),
          )
        ])
      ]))
    ]);
  }
}
