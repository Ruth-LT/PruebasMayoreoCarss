import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:one_page/models/articulosModel.dart';
import 'package:one_page/models/categoriasModel.dart';
import 'package:one_page/models/familiasCategoriasModel.dart';
import 'package:one_page/models/sublineasCategoriasModel.dart';
import 'package:one_page/models/sucursalesModel.dart';
import 'package:one_page/navigation.dart';
import 'package:one_page/productdescription.dart';
import 'package:one_page/responsive.dart';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';

//import para el spinbox
import 'package:flutter_spinbox/flutter_spinbox.dart';

import 'app/text_styles.dart';
import 'backend/database_connect.dart';
import 'home.dart';

class productdisplay extends StatefulWidget {
  final String nombre;
  List<articulos> carrito;
  categorias categoria;
  sublineasCategorias sublinea;
  familiasCategorias familia;
  List<PlutoMenuItem> whiteHoverMenus;
  List<categorias> categoriasLista;
  bool cargando;
  productdisplay(
      {Key key,
      this.carrito,
      this.nombre,
      this.categoria,
      this.sublinea,
      this.familia,
      this.whiteHoverMenus,
      this.categoriasLista,
      this.cargando})
      : super(key: key);
  List<articulos> get articulo => null;
  List<sucursales> get sucurales => null;
  @override
  State<productdisplay> createState() => _productdisplayState();
}

class _productdisplayState extends State<productdisplay> {
  ScrollController scrollController = ScrollController();

  sucursales get sucursalSelected => null;

  List<articulos> articulosLista = [];
  String categorias = "";
  bool consultando = true;
  double numeroDeArticulos = 15;
  int numeroDePagina = 1;
  ScrollController scrollControl = ScrollController();

  void initState() {
    super.initState();
    nombreCategoria();
    consultaArticulos();
  }

  consultaArticulos() {
    String sublinea = '%';
    String familia = '%';

    if (widget.sublinea != null) {
      sublinea = widget.sublinea.sublinea.toString();
    }

    if (widget.familia != null) {
      familia = widget.familia.familia.toString();
    }

    DatabaseProvider.getArticulos(
            numeroDeArticulos, numeroDePagina, widget.categoria.linea, sublinea, familia)
        .then((resultado) {
      try {
        setState(() {
          articulosLista = resultado;
          consultando = false;
        });
      } catch (error) {}
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      consultaArticulos();
    });
  }

  nombreCategoria() {
    setState(() {
      categorias = "Linea: " + widget.categoria.nombre_linea;

      if (widget.sublinea != null) {
        categorias += " -> Sublinea: " + widget.sublinea.nombre_sublinea;
      }

      if (widget.familia != null) {
        categorias += " -> Familia: " + widget.familia.nombre_familia;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: Column(children: [
        Navigation(
            carrito: widget.carrito,
            whiteHoverMenus: widget.whiteHoverMenus,
            categoriasLista: widget.categoriasLista,
            cargando: widget.cargando),
        Expanded(
            child: SingleChildScrollView(
              controller: scrollControl,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Wrap(
              children: [
                // Container(
                //   alignment: Responsive.isMobile(context)
                //       ? Alignment.center
                //       : Alignment.centerRight,
                //   padding: EdgeInsets.all(10),
                //   width: Responsive.isMobile(context)
                //       ? MediaQuery.of(context).size.width
                //       : MediaQuery.of(context).size.width * 0.30,
                //   child: Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20),
                //       color: Colors.white,
                //     ),
                //     alignment: Alignment.centerLeft,
                //     padding: EdgeInsets.only(top: 10, left: 20),
                //     width: 300,
                //     child: Column(
                //       children: [
                //         Text(
                //           widget.categoria.nombre_linea.trim(),
                //           style: TextStyle(
                //             fontSize: 20,
                //             fontFamily: 'Poppins',
                //             fontWeight: FontWeight.bold
                //           ),
                //         ),
                //         ListView.builder(
                //             padding:
                //             EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                //             physics: BouncingScrollPhysics(),
                //             scrollDirection: Axis.vertical,
                //             shrinkWrap: true,
                //             itemCount: widget.categoria.sublineas.length,
                //             itemBuilder: (context, listViewIndex) {
                //               final i = widget.categoria.sublineas[listViewIndex];
                //               return InkWell(
                //                   onTap: () {
                //                   },
                //                   child: Text(
                //                     i.nombre_sublinea.trim(),
                //                     style: TextStyle(
                //                       fontSize: 18,
                //                       fontFamily: 'Poppins',
                //                     ),
                //                   ));
                //             })
                //       ],
                //     )
                //   ),
                // ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: Responsive.car(context)
                      ? MediaQuery.of(context).size.width
                      : MediaQuery.of(context).size.width * 0.70,
                  child: Column(
                    children: [
                      LayoutBuilder(builder: (context, constraints) {
                        return Container(
                          alignment: Alignment.center,
                          width: constraints.maxWidth,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.black,
                                width: 3.0,
                              ),
                            ),
                          ),
                          child: const Text(
                            "PRODUCTOS",
                            style: TextStyle(
                              fontSize: 40,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        child: SpinBox(
                          min: 3,
                          max: 30,
                          value: numeroDeArticulos,
                          decimals: 0,
                          step: 3,
                          decoration: InputDecoration(labelText: 'Numero de productos'),
                          onChanged: (pp){
                            setState(() {
                              numeroDeArticulos = pp;
                              consultando = true;
                              consultaArticulos();
                            });
                          },
                        ),
                        padding: const EdgeInsets.all(16),
                      ),
                      Text(
                        categorias,
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      consultando
                          ? Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height * .5,
                              child: const SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: CircularProgressIndicator(
                                      strokeWidth: 20, color: Colors.black)))
                          : articulosLista.isNotEmpty
                              ? Wrap(
                                  spacing: 15,
                                  runSpacing: 15,
                                  children: articulosLista
                                      .map((element) => InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          productdescription(
                                                              articulo: element,
                                                              carrito: widget.carrito,
                                                              whiteHoverMenus:
                                                                  widget
                                                                      .whiteHoverMenus,
                                                              categoriasLista:
                                                                  widget
                                                                      .categoriasLista,
                                                              cargando: widget
                                                                  .cargando)));
                                            },
                                            child: Container(
                                              width: 220,
                                              height: 335,
                                              padding: const EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Column(
                                                children: [
                                                  LayoutBuilder(
                                                    builder:
                                                        (context, constraints) {
                                                      return Container(
                                                        height: 200,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            image: const DecorationImage(
                                                                image: AssetImage(
                                                                    "assets/Prueba.jpg"),
                                                                fit: BoxFit
                                                                    .fill)),
                                                      );
                                                    },
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      element.nombre_articulo
                                                          .trim(),
                                                      maxLines: 4,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                        color:
                                                            Color(0xFF00196B),
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  height:
                                      MediaQuery.of(context).size.height * .5,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/NotFound.png",
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.4,
                                      ),
                                      const Text(
                                        "No hay artículos para mostrar",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ],
                                  )),
                    ],
                  ),
                )
              ],
            ),
          ),
        )),
        const SizedBox(
          height: 20,
        ),
        Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child: MaterialButton(
                    color: Colors.blueAccent,
                    height: 40,
                    onPressed: () {
                      if (numeroDePagina > 1) {
                        numeroDePagina = numeroDePagina - 1;
                        setState(() {
                          consultando = true;
                        });
                        consultaArticulos();
                      }
                    },
                    child: Text(
                      "Anterior",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                ),
                onTap: () {},
              ),
              Text(
                'Pagina actual ' + numeroDePagina.toString(),
                style: TextStyle(
                    color: Colors.white, fontSize: 20),
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child: MaterialButton(
                    color: Colors.blue,
                    height: 40,
                    onPressed: () {
                      numeroDePagina = numeroDePagina + 1;
                      setState(() {
                        consultando = true;
                      });
                      consultaArticulos();
                      scrollControl.animateTo(
                          scrollControl.position.minScrollExtent,
                          duration: Duration(
                              milliseconds: 300),
                          curve: Curves.easeOut);
                    },
                    child: Text(
                      "Siguiente",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                ),
                onTap: () {},
              )
            ]),

        const SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}
