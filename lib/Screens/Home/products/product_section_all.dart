import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_next/extensions/animation_extension.dart';
import 'package:flutter_next/views/next_col.dart';
import 'package:flutter_next/widgets/hover_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

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
import '../categories_screen.dart';
import '../detalleproducto_screen.dart';
import '../products_screen.dart';

class AllProductSectionWidget extends StatefulWidget {
  List<articulos> articulo;
  Familias familias;
  Sublinea sublineas;
  Linea lineas;
  AllProductSectionWidget(
      {Key key, this.articulo, this.familias, this.sublineas, this.lineas})
      : super(key: key);

  ProductSection createState() => ProductSection();
}

class ProductSection extends State<AllProductSectionWidget> {
  //Your code here
  int countPages = 1;
  TextEditingController busquedaController;
  List<Pedido> pedidosCliente = [];
  List<detallePedido> detallesPedidos = [];
  List<articulos> articulosLista = [];
  List<Sublinea> sublineaLista = [];
  List<Linea> lineaLista = [];
  List<detalleCarrito> detalleCarritoList = [];
  TextEditingController lineaBusquedaController =
      TextEditingController(text: '');
  double totalOrden = 0.0;
  bool busqueda;
  String linea = "%";
  String sublinea = "%";
  String familia = "%";

  @override
  void initState() {
    super.initState();
    _getCategorias();
    _getUltimosCuatro();
  }

  _setIndexCategories(Linea linea) {
    setState(() {
      lineaLista.add(linea);
    });
  }

  _getFamilias(Linea linea) async {
    linea.sublineas.forEachIndexed((index, element) {
      DatabaseProvider.getFamilias(element.sublinea).then((value) {
        //print("ME TRAJE :::: " +
           // element.nombre_sublinea +
            //" INDEX:::: " +
            //index.toString());

        element.familia = value;

        linea.sublineas[index].familia = value;
        //print("Guarde familias" +
           // linea.sublineas[index].familia.first.nombre_familia);
      });
    });
    _setIndexCategories(linea);
  }

  _getSublineas(Linea linea) {
    DatabaseProvider.getSublineas(linea.linea).then((value) {
      linea.sublineas = value;

      _getFamilias(linea);
    });
  }

  _getCategorias() {
    DatabaseProvider.getLineas(1).then((lineasResult) {
      lineasResult.forEach((element) {
        _getSublineas(element);
      });
    });
  }

  _getUltimosCuatro() {
    if (widget.lineas != null) {
      linea = widget.lineas.linea;
    }
    if (widget.sublineas != null) {
      sublinea = widget.sublineas.sublinea;
    }
    if (widget.familias != null) {
      familia = widget.familias.familia;
    }
    DatabaseProvider.getArticulosPagina(
            1, 20, countPages, sublinea, linea, familia)
        .then((articulosResult) {
      setState(() {
        articulosLista = articulosResult;
      });
    });
    //print(articulosLista.length);
  }

  @override
  Widget build(BuildContext context) {
    bool isHover = false;
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Color.fromRGBO(255, 255, 255, 0.8), BlendMode.lighten),
                  image: AssetImage('assets/hero-bg.jpg'),
                  fit: BoxFit.fill)),
          // constraints: BoxConstraints(maxWidth: kMaxWidth),
          child: Responsive.isDesktop(context)
              ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 20,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: kSecondaryColor, width: 3))),
                          child: Text(
                            "Categorias",
                            style: GoogleFonts.sourceSansPro(
                                fontSize: 23, fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        lineaLista.length != 0
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // alignment: WrapAlignment.center,
                                children: lineaLista.map((f) {
                                  if (linea == f.linea) {
                                    f.selected = true;
                                  }
                                  return NextCol(
                                    sizes: 'col-12 col-lg-3 col-md-6 col-sm-12',
                                    child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  GestureDetector(
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10.0,
                                                              vertical: 5.0),
                                                      child: InkWell(
                                                        child: Text(
                                                          f.nombre_linea
                                                              .toUpperCase(),
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: GoogleFonts
                                                              .sourceSansPro(
                                                                  color:
                                                                      kPrimaryColor,
                                                                  fontSize: 20),
                                                        ),
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        lineaLista
                                                            .forEach((element) {
                                                          if (element != f) {
                                                            element.selected =
                                                                false;
                                                          }
                                                        });
                                                        if (f.selected) {
                                                          f.selected = false;
                                                        } else {
                                                          f.selected = true;
                                                        }
                                                      });
                                                    },
                                                    onDoubleTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ProductsScreenWidget(
                                                                    lineas: f,
                                                                    articulo: widget
                                                                        .articulo,
                                                                  )));
                                                    },
                                                  ),
                                                  if (f.selected)
                                                    Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: f.sublineas
                                                            .map((e) {
                                                          if (sublinea ==
                                                              e.sublinea) {
                                                            e.selected = true;
                                                          }
                                                          return Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 15),
                                                              child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    GestureDetector(
                                                                      child: Container(
                                                                          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                                                          child: InkWell(
                                                                              child: Text(
                                                                            e.nombre_sublinea.trim(),
                                                                            textAlign:
                                                                                TextAlign.left,
                                                                            style: GoogleFonts.sourceSansPro(
                                                                                color: kPrimaryColor,
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.bold),
                                                                          ))),
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          f.sublineas
                                                                              .forEach((element) {
                                                                            if (element !=
                                                                                e) {
                                                                              element.selected = false;
                                                                            }
                                                                          });
                                                                          if (e
                                                                              .selected) {
                                                                            e.selected =
                                                                                false;
                                                                          } else {
                                                                            e.selected =
                                                                                true;
                                                                          }
                                                                        });
                                                                      },
                                                                      onDoubleTap:
                                                                          () {
                                                                        Navigator.push(
                                                                            context,
                                                                            MaterialPageRoute(
                                                                                builder: (context) => ProductsScreenWidget(
                                                                                      lineas: f,
                                                                                      sublineas: e,
                                                                                      articulo: widget.articulo,
                                                                                    )));
                                                                      },
                                                                    ),
                                                                    if (e
                                                                        .selected)
                                                                      Column(
                                                                          crossAxisAlignment: CrossAxisAlignment
                                                                              .start,
                                                                          children: e
                                                                              .familia
                                                                              .map((x) => Padding(
                                                                                  padding: EdgeInsets.only(left: 15),
                                                                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                                    GestureDetector(
                                                                                      child: Container(
                                                                                          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                                                                          child: InkWell(
                                                                                              child: Text(
                                                                                            x.nombre_familia.trim(),
                                                                                            textAlign: TextAlign.left,
                                                                                            style: GoogleFonts.sourceSansPro(color: Colors.black45, fontSize: 15, fontWeight: FontWeight.bold),
                                                                                          ))),
                                                                                      onTap: () {
                                                                                        Navigator.push(
                                                                                            context,
                                                                                            MaterialPageRoute(
                                                                                                builder: (context) => ProductsScreenWidget(
                                                                                                      lineas: f,
                                                                                                      sublineas: e,
                                                                                                      familias: x,
                                                                                                      articulo: widget.articulo,
                                                                                                    )));
                                                                                      },
                                                                                    ),
                                                                                  ])))
                                                                              .toList()),
                                                                  ]));
                                                        }).toList()),
                                                ]))
                                        .zoom(
                                            viewPort: 0.28,
                                            duration: const Duration(
                                                milliseconds: 300)),
                                  );
                                }).toList(),
                              )
                            : Column(),
                        //trending product section
                      ]),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: kSecondaryColor, width: 3))),
                                child: Text(
                                  "Todos nuestros productos",
                                  style: GoogleFonts.sourceSansPro(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),

                              articulosLista.length != 0
                                  ? Wrap(
                                      children: articulosLista
                                          .map((f) => HoverWidget(
                                        
                                              builder:
                                                  (BuildContext context,
                                                          bool isHovered) =>
                                                      Container(
                                                        margin: EdgeInsets.all(10),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: const Color
                                                                      .fromRGBO(
                                                                  18,
                                                                  66,
                                                                  101,
                                                                  0.08),
                                                              blurRadius: 15,
                                                              spreadRadius:
                                                                  isHovered
                                                                      ? 10
                                                                      : 2,
                                                              offset: Offset(
                                                                isHovered
                                                                    ? 2
                                                                    : 0,
                                                                isHovered
                                                                    ? 6.0
                                                                    : 2.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        child: NextCol(
                                                                sizes:
                                                                    'col-12 col-lg-3 col-md-6 col-sm-12',
                                                                child:
                                                                    GestureDetector(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                    child:
                                                                        AnimatedContainer(
                                                                      duration:
                                                                          kDefaultDuration,
                                                                      width:
                                                                          230,
                                                                      // decoration:
                                                                      //     BoxDecoration(
                                                                      //   color: Colors
                                                                      //       .white,
                                                                      //
                                                                      //   // borderRadius: BorderRadius.circular(20),
                                                                      //   // border: Border.all(
                                                                      //   //     color: kgreyColor, width: 3),
                                                                      //   boxShadow: [
                                                                      //     BoxShadow(
                                                                      //       color:
                                                                      //           Colors.grey.withOpacity(0.2),
                                                                      //       spreadRadius:
                                                                      //           1,
                                                                      //       blurRadius:
                                                                      //           20,
                                                                      //       offset:
                                                                      //           Offset(0, 3), // changes position of shadow
                                                                      //     ),
                                                                      //   ],
                                                                      // ),
                                                                      child:
                                                                          Stack(
                                                                        fit: StackFit
                                                                            .passthrough,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Image.network(
                                                                                  f.foto_articulo,
                                                                                  height: 150,
                                                                                  width: 150,
                                                                                  fit: BoxFit.contain,
                                                                                  errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
                                                                                    return Image.network(
                                                                                      DatabaseProvider.PLACEHOLDER,
                                                                                      height: 150,
                                                                                      width: 150,
                                                                                      fit: BoxFit.contain,
                                                                                    );
                                                                                  },
                                                                                ),
                                                                                const SizedBox(
                                                                                  height: 10,
                                                                                ),
                                                                                Text(
                                                                                  f.nombre_articulo,
                                                                                  maxLines: 3,
                                                                                  textAlign: TextAlign.center,
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  style: GoogleFonts.sourceSansPro(fontSize: 18, fontWeight: FontWeight.w600),
                                                                                ),Text(
                                                                                  "\$${NumberFormat("#,###,##0.00").format(f.precio_base)}",
                                                                                  maxLines: 3,
                                                                                  textAlign: TextAlign.center,
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  style: GoogleFonts.sourceSansPro(fontSize: 18, fontWeight: FontWeight.w600),
                                                                                ),Text(
                                                                                  "Existencias : ${f.disponible}",
                                                                                  maxLines: 3,
                                                                                  textAlign: TextAlign.center,
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  style: GoogleFonts.sourceSansPro(fontSize: 18, fontWeight: FontWeight.w600),
                                                                                ),

                                                                                const SizedBox(
                                                                                  height: 10,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  onTap: () {
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) => DetalleProductoScreenWidget(
                                                                                  articuloActual: f,
                                                                                  articulo: widget.articulo,
                                                                                )));
                                                                  },
                                                                ))
                                                            .zoom(
                                                                viewPort: 0.28,
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        300)),
                                                      )))
                                          .toList(),
                                    )
                                  : Column(),

                              //now we create trending Product model
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
                                          color: kPrimaryColor,
                                          height: 40,
                                          onPressed: () {
                                            if (countPages > 1) {
                                              countPages = countPages - 1;
                                              _getUltimosCuatro();
                                            }
                                          },
                                          child: Text(
                                            "Anterior",
                                            style: GoogleFonts.sourceSansPro(
                                                color: kWhiteColor,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      onTap: () {},
                                    ),
                                    Text(
                                      'Pagina actual ' + countPages.toString(),
                                      style: GoogleFonts.sourceSansPro(
                                          color: kDarkblueColor, fontSize: 20),
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 5.0),
                                        child: MaterialButton(
                                          color: kPrimaryColor,
                                          height: 40,
                                          onPressed: () {
                                            countPages = countPages + 1;
                                            _getUltimosCuatro();
                                          },
                                          child: Text(
                                            "Siguiente",
                                            style: GoogleFonts.sourceSansPro(
                                                color: kWhiteColor,
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

                              //bottom Navigation menu
                            ],
                          )))
                ])
              : Column(children: [
                  Container(
                    margin: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 20,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: kSecondaryColor, width: 3))),
                        child: Text(
                          "Categorias",
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 23, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      lineaLista.isNotEmpty
                          ? Container(
                              // width: 250,

                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 100,
                                        child: DropdownButtonFormField2<Linea>(
                                          isExpanded: true,
                                          // value: sucursalSelected,
                                          items: lineaLista
                                              .map((Linea rtItem) =>
                                                  DropdownMenuItem<Linea>(
                                                      value: rtItem,
                                                      child: Text(
                                                        rtItem.nombre_linea
                                                            .toUpperCase(),
                                                        softWrap: true,
                                                      )))
                                              .toList(),
                                          hint: Text(
                                            'Marcas',
                                          ),

                                          onChanged: (Linea newValue) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CategoriesScreen(
                                                          lineaActual: newValue,
                                                          articulo:
                                                              widget.articulo,
                                                        )));
                                          },
                                          // Search implementation using dropdown_button2 package
                                          searchController:
                                              lineaBusquedaController,
                                          searchInnerWidget: Padding(
                                            padding: const EdgeInsets.only(
                                              top: 0,
                                              bottom: 0,
                                              right: 8,
                                              left: 8,
                                            ),
                                            child: TextFormField(
                                              controller:
                                                  lineaBusquedaController,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelText: 'Seleccione Linea',
                                                counterText: '',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                            ),
                                          ),
                                          searchMatchFn: (item, searchValue) {
                                            if (searchValue.length >= 4) {
                                              return (item.value.nombre
                                                  .toLowerCase()
                                                  .contains(searchValue
                                                      .toLowerCase()));
                                            } else {
                                              return true;
                                            }
                                          },
                                          //This to clear the search value when you close the menu
                                          onMenuStateChange: (isOpen) {
                                            if (!isOpen) {
                                              lineaBusquedaController.clear();
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Text("Lineas"),

                      //trending product section
                    ]),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: kSecondaryColor, width: 3))),
                            child: Text(
                              "Todos nuestros productos",
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 23, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          articulosLista.length != 0
                              ? Wrap(
                                  alignment: WrapAlignment.center,
                                  children: articulosLista
                                      .map((f) => GestureDetector(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: AnimatedContainer(
                                                duration: kDefaultDuration,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,

                                                  // borderRadius: BorderRadius.circular(20),
                                                  // border: Border.all(
                                                  //     color: kgreyColor, width: 3),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      spreadRadius: 1,
                                                      blurRadius: 20,
                                                      offset: Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child: Stack(
                                                  fit: StackFit.passthrough,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        children: [
                                                          Image.network(
                                                            f.foto_articulo,
                                                            height: 150,
                                                            width: 150,
                                                            fit: BoxFit.contain,
                                                            errorBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    Object
                                                                        exception,
                                                                    StackTrace
                                                                        stackTrace) {
                                                              return Image
                                                                  .network(
                                                                DatabaseProvider
                                                                    .PLACEHOLDER,
                                                                height: 150,
                                                                width: 150,
                                                                fit: BoxFit
                                                                    .contain,
                                                              );
                                                            },
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Expanded(
                                                              child: Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child: Column(
                                                                    children: [
                                                                      Text(
                                                                        f.nombre_articulo,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: GoogleFonts.sourceSansPro(
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.w600),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                    ],
                                                                  )))
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetalleProductoScreenWidget(
                                                            articuloActual: f,
                                                            articulo:
                                                                widget.articulo,
                                                          )));
                                            },
                                          ))
                                      .toList(),
                                )
                              : Column(),

                          //now we create trending Product model
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
                                      color: kPrimaryColor,
                                      height: 40,
                                      onPressed: () {
                                        if (countPages > 1) {
                                          countPages = countPages - 1;
                                          _getUltimosCuatro();
                                        }
                                      },
                                      child: Text(
                                        "Anterior",
                                        style: GoogleFonts.sourceSansPro(
                                            color: kWhiteColor, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                                Text(
                                  'Pagina actual ' + countPages.toString(),
                                  style: GoogleFonts.sourceSansPro(
                                      color: kDarkblueColor, fontSize: 20),
                                ),
                                GestureDetector(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    child: MaterialButton(
                                      color: kPrimaryColor,
                                      height: 40,
                                      onPressed: () {
                                        countPages = countPages + 1;
                                        _getUltimosCuatro();
                                      },
                                      child: Text(
                                        "Siguiente",
                                        style: GoogleFonts.sourceSansPro(
                                            color: kWhiteColor, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  onTap: () {},
                                )
                              ]),

                          const SizedBox(
                            height: 20,
                          ),

                          //bottom Navigation menu
                        ],
                      ))
                ]),
        ),
      ],
    );
  }
}
