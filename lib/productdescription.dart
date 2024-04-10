import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:one_page/app/text_styles.dart';
import 'package:one_page/models/articulosModel.dart';
import 'package:one_page/models/categoriasModel.dart';
import 'package:one_page/models/sucursalesModel.dart';
import 'package:one_page/navigation.dart';
import 'package:one_page/responsive.dart';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';

import 'backend/database_connect.dart';
import 'home.dart';

class productdescription extends StatefulWidget {
  final articulos articulo;
  List<articulos> carrito;
  List<PlutoMenuItem> whiteHoverMenus;
  List<categorias> categoriasLista;
  bool cargando;
  productdescription(
      {Key key,
      this.articulo,
      this.carrito,
      this.whiteHoverMenus,
      this.categoriasLista,
      this.cargando})
      : super(key: key);

  // List<articulos> get articulo => null;

  List<sucursales> get sucurales => null;

  @override
  State<productdescription> createState() => _productdescriptionState();
}

class _productdescriptionState extends State<productdescription> {
  ScrollController scrollController = ScrollController();

  sucursales get sucursalSelected => null;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: Column(
        children: [
          Navigation(
              carrito: widget.carrito,
              whiteHoverMenus: widget.whiteHoverMenus,
              categoriasLista: widget.categoriasLista,
              cargando: widget.cargando),
          Expanded(
              child: Container(
            width: MediaQuery.of(context).size.width,
            height: Responsive.isMobile(context) ? 1500 : 1000,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 20, top: 20),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: Responsive.isMobile(context) ? 1200 : 600,
                    child: Wrap(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(20),
                            height: 550,
                            width: Responsive.isMobile(context)
                                ? MediaQuery.of(context).size.width
                                : MediaQuery.of(context).size.width * 0.4,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  widget.articulo.nombre_articulo.trim(),
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF000000),
                                  ),
                                ),
                                Container(
                                  height: 350,
                                  // width: 400,
                                  child: Image.asset(
                                    "assets/Prueba.jpg",
                                    fit: BoxFit.fitHeight,
                                  ),
                                )
                              ],
                            )),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: Container(
                            height: 530,
                            width: Responsive.isMobile(context)
                                ? MediaQuery.of(context).size.width
                                : MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black, // Color del borde
                                width: 1.0, // Ancho del borde
                              ),
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        (FontAwesomeIcons.dollarSign),
                                        color: Color(0xFF000000),
                                        size: 35,
                                      ),
                                      Text(
                                        NumberFormat("#,###,##0.00").format(
                                            widget.articulo.precio_base),
                                        style: const TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF000000),
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    "IVA incluido",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF4D4D4D),
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Referencia: " + widget.articulo.articulo,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Cantidad disponible: " +
                                        NumberFormat("#,###,##0.##").format(
                                            widget.articulo.disponible) +
                                        " " +
                                        widget.articulo.nombre_unidad +
                                        "(s)",
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  // Container(
                                  //   width: 500,
                                  //   child: Row(
                                  //     children: [
                                  //       Expanded(
                                  //         child: Container(),
                                  //       ),
                                  //       Text(
                                  //         "Sistema:",
                                  //
                                  //         style: TextStyle(
                                  //
                                  //           fontFamily: 'Poppins',
                                  //           color: Color(0xFF7C7C7C),
                                  //         ),
                                  //       ),
                                  //       Expanded(
                                  //         child: Container(),
                                  //       ),
                                  //       Text(
                                  //         "subgrupo:",
                                  //         style: TextStyle(
                                  //
                                  //           fontFamily: 'Poppins',
                                  //           color: Color(0xFF7A7A7A),
                                  //         ),
                                  //       ),
                                  //       Expanded(
                                  //         child: Container(),
                                  //       ),
                                  //       Text(
                                  //         "Grupo:",
                                  //         style: TextStyle(
                                  //
                                  //           fontFamily: 'Poppins',
                                  //           color: Color(0xFF797979),
                                  //         ),
                                  //       ),
                                  //       Expanded(
                                  //         child: Container(),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: 60,
                                  // ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        widget.carrito.add(widget.articulo);
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF000000),
                                        borderRadius:
                                        BorderRadius.circular(15),
                                      ),
                                      child: const Text(
                                        "Compra Ahora",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(),
                                        ),
                                        const Text(
                                          "Compartir:",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF4B4B4B),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const InkWell(
                                          child: Icon(
                                            FontAwesomeIcons.facebook,
                                            size: 20,
                                            color: Color(0xFF860E0E),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const InkWell(
                                          child: Icon(
                                            FontAwesomeIcons.pinterest,
                                            size: 20,
                                            color: Color(0xFF860E0E),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const InkWell(
                                          child: Icon(
                                            FontAwesomeIcons.twitter,
                                            size: 20,
                                            color: Color(0xFF860E0E),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: Responsive.car(context) ? 0 : 185,
                      right: Responsive.car(context) ? 0 : 185,
                    ),
                    child: Container(
                      padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 25),
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Detalles del Producto",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                fontSize: 25,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.articulo.descripcion_extendido.trim(),
                            style: products5(context),
                          ),
                          // Wrap(
                          //   children: [
                          //     LayoutBuilder(
                          //       builder: (context, constraints) {
                          //         return Padding(
                          //           padding: EdgeInsets.all(
                          //               Responsive.car(context) ? 7 : 14),
                          //           child: Container(
                          //             padding: EdgeInsets.all(20),
                          //             alignment: Alignment.center,
                          //             width: Responsive.carr(context)
                          //                 ? constraints.maxWidth
                          //                 : constraints.maxWidth * 0.46,
                          //             height: 200,
                          //             decoration: BoxDecoration(
                          //               color: Colors.grey[200],
                          //               borderRadius: BorderRadius.circular(20),
                          //             ),
                          //             child: ListView(
                          //               children: [
                          //                 Text(
                          //                   "Caracteristicas principales",
                          //                   style: products5(context),
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //         );
                          //       },
                          //     ),
                          //     LayoutBuilder(
                          //       builder: (context, constraints) {
                          //         return Padding(
                          //           padding: EdgeInsets.all(
                          //             Responsive.car(context) ? 7 : 13,
                          //           ),
                          //           child: Container(
                          //             padding: EdgeInsets.all(20),
                          //             alignment: Alignment.center,
                          //             width: Responsive.carr(context)
                          //                 ? constraints.maxWidth
                          //                 : constraints.maxWidth * 0.46,
                          //             height: 200,
                          //             decoration: BoxDecoration(
                          //               color: Colors.grey[200],
                          //               borderRadius: BorderRadius.circular(20),
                          //             ),
                          //             child: ListView(
                          //               children: [
                          //                 Text(
                          //                   "Caracteristicas secundarias",
                          //                   style: products5(context),
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //         );
                          //       },
                          //     ),
                          //   ],
                          // )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
