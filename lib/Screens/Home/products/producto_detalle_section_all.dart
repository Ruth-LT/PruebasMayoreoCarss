import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_next/extensions/animation_extension.dart';
import 'package:flutter_next/views/next_col.dart';
import 'package:flutter_next/widgets/hover_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:one_page/Screens/Home/carrito_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../backend/database_connect.dart';
import '../../../constants.dart';
import '../../../models/articulosModel.dart';
import '../../../models/detalleCarritoModel.dart';
import '../../../models/detallePedidoModel.dart';
import '../../../models/familiasModel.dart';
import '../../../models/lineaModel.dart';
import '../../../models/pedidoModel.dart';
import '../../../models/sublineaModel.dart';
import '../../../models/userModel.dart';
import '../../../responsive.dart';
import '../products_screen.dart';
import '../profile_screen.dart';

class DetalleProductoSectionWidget extends StatefulWidget {
  final articulos articuloActual;
  final user usuario;
  final Sublinea sublineaActual;
  final Linea lineaActual;
  final Familias familias;
  final List<articulos> articulo;
  const DetalleProductoSectionWidget(
      {Key key,
      this.articuloActual,
      this.usuario,
      this.sublineaActual,
      this.familias,
      this.articulo,
      this.lineaActual})
      : super(key: key);

  ProductSection createState() => ProductSection();
}

class ProductSection extends State<DetalleProductoSectionWidget> {
  //Your code here
  int countPages = 1;
  TextEditingController busquedaController;
  List<Pedido> pedidosCliente = [];
  List<detallePedido> detallesPedidos = [];
  List<articulos> articulosLista = [];
  List<Sublinea> sublineaLista = [];
  List<Linea> lineaLista = [];
  List<String> carrito = [];
  List<detalleCarrito> detalleCarritoList = [];
  Linea lineaActual = new Linea();
  Sublinea sublineaActual = new Sublinea();
  Familias familiaActual = new Familias();
  detalleCarrito detalleCarritos = detalleCarrito();
  double totalOrden = 0.0;
  bool busqueda;
  int quantity = 0;
  SharedPreferences preffs;

  @override
  void initState() {
    super.initState();
    // _getCategorias();
    // _getUltimosCuatro();
    _getRuta();
  }

  _getRuta() {
    print("LINEA EN ARTICULO ::: ${widget.articuloActual.linea}");
    print("LINEA NULL ::: ${lineaActual.linea}");
    DatabaseProvider.getLineas(1).then((value) {
      value.forEach((element) {
        if (widget.articuloActual.linea == element.linea) {
          print("ENTRE A LINEA ::: ${element.linea}");
          setState(() {
            lineaActual = element;
          });
          DatabaseProvider.getSublineas(lineaActual.linea).then((value) {
            value.forEach((elementTwo) {
              if (widget.articuloActual.sublinea == elementTwo.sublinea) {
                print("ENTRE A Sublinea ::: ${elementTwo.sublinea}");
                setState(() {
                  sublineaActual = elementTwo;
                });
              }
              DatabaseProvider.getFamilias(sublineaActual.sublinea)
                  .then((value) {
                value.forEach((elementTree) {
                  if (widget.articuloActual.familia == elementTree.familia) {
                    print("ENTRE A FAMILIA ::: ${elementTree.familia}");
                    setState(() {
                      familiaActual = elementTree;
                    });
                  }
                });
              });
            });
          });
        }
      });
    });
  }
  _saveOnCart() async {
    // detalleCarritos.articulo = widget.articuloActual;
    detalleCarritos.precio_base = widget.articuloActual.precio_base;
    detalleCarritos.articulo = widget.articuloActual.articulo;
    detalleCarritos.descripcion_extendido =
        widget.articuloActual.descripcion_extendido;
    detalleCarritos.nombre_articulo = widget.articuloActual.nombre_articulo;
    detalleCarritos.ubicacion_URL = widget.articuloActual.ubicacion_URL;
    detalleCarritos.clave_articulo = widget.articuloActual.clave_articulo;
    detalleCarritos.cantidad = double.parse(quantity.toString());
    detalleCarritos.total = widget.articuloActual.precio_base * quantity;

    String jsonUser = jsonEncode(detalleCarritos);
    print(jsonUser);
    preffs = await SharedPreferences.getInstance();
    carrito = preffs.getStringList("carrito");
    if (carrito == null) {
      carrito = [];
    }
    carrito.add(jsonUser);
    print(carrito.first);
    preffs.setStringList("carrito", carrito);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CarritoScreen()));
  }

  @override
  Widget build(BuildContext context) {
    bool isHover = false;
    return Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Color.fromRGBO(255, 255, 255, 0.8),
                          BlendMode.lighten),
                      image: AssetImage('assets/hero-bg.jpg'),
                      fit: BoxFit.fill)),
              // width: MediaQuery.of(context).size.width,
              // constraints: BoxConstraints(maxWidth: kMaxWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: kDarkblueColor, width: 3))),
                    child: Text(
                      "Detalles del articulo",
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  familiaActual.familia != null
                      ? Wrap(children: [
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => HomeScreen()));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              // decoration: const BoxDecoration(
                              //     border: Border(
                              //         bottom: BorderSide(color: kSecondaryColor, width: 3))),
                              child: Text(
                                "Inicio",
                                style: GoogleFonts.sourceSansPro(
                                    fontSize: 23, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            // decoration: const BoxDecoration(
                            //     border: Border(
                            //         bottom: BorderSide(color: kSecondaryColor, width: 3))),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: kPrimaryColor,
                              size: 20,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProductsScreenWidget(
                                            lineas: lineaActual,
                                          )));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                lineaActual.nombre_linea,
                                style: GoogleFonts.sourceSansPro(
                                    fontSize: 23, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            // decoration: const BoxDecoration(
                            //     border: Border(
                            //         bottom: BorderSide(color: kSecondaryColor, width: 3))),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: kPrimaryColor,
                              size: 20,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProductsScreenWidget(
                                            lineas: lineaActual,
                                            sublineas: sublineaActual,
                                          )));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              // decoration: const BoxDecoration(
                              //     border: Border(
                              //         bottom: BorderSide(color: kSecondaryColor, width: 3))),
                              child: Text(
                                sublineaActual.nombre_sublinea,
                                style: GoogleFonts.sourceSansPro(
                                    fontSize: 23, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            // decoration: const BoxDecoration(
                            //     border: Border(
                            //         bottom: BorderSide(color: kSecondaryColor, width: 3))),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: kPrimaryColor,
                              size: 20,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProductsScreenWidget(
                                            lineas: lineaActual,
                                            sublineas: sublineaActual,
                                            familias: familiaActual,
                                          )));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              // decoration: const BoxDecoration(
                              //     border: Border(
                              //         bottom: BorderSide(color: kSecondaryColor, width: 3))),
                              child: Text(
                                familiaActual.nombre_familia,
                                style: GoogleFonts.sourceSansPro(
                                    fontSize: 23, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ])
                      : Wrap(children: [
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => HomeScreen()));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              // decoration: const BoxDecoration(
                              //     border: Border(
                              //         bottom: BorderSide(color: kSecondaryColor, width: 3))),
                              child: Text(
                                "Inicio ",
                                style: GoogleFonts.sourceSansPro(
                                    fontSize: 23, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ]),
                  const SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      HoverWidget(
                          builder: (BuildContext context, bool isHovered) =>
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromRGBO(
                                            18, 66, 101, 0.08),
                                        blurRadius: 15,
                                        spreadRadius: isHovered ? 10 : 2,
                                        offset: Offset(
                                          isHovered ? 2 : 0,
                                          isHovered ? 6.0 : 2.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  child: NextCol(
                                    sizes: 'col-12 col-lg-3 col-md-6 col-sm-12',
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Container(
                                        width: Responsive.isDesktop(context)
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .3
                                            : MediaQuery.of(context).size.width,
                                        // decoration: BoxDecoration(
                                        //   color: Colors.white,
                                        //
                                        //   // borderRadius: BorderRadius.circular(20),
                                        //   // border: Border.all(
                                        //   //     color: kgreyColor, width: 3),
                                        //   boxShadow: [
                                        //     BoxShadow(
                                        //       color:
                                        //           Colors.grey.withOpacity(0.2),
                                        //       spreadRadius: 1,
                                        //       blurRadius: 20,
                                        //       offset: Offset(0,
                                        //           3), // changes position of shadow
                                        //     ),
                                        //   ],
                                        // ),
                                        child: Image.network(
                                          widget.articuloActual.foto_articulo,
                                          height: 400,
                                          width: 400,
                                          fit: BoxFit.contain,
                                          errorBuilder: (BuildContext context,
                                              Object exception,
                                              StackTrace stackTrace) {
                                            return Image.network(
                                              DatabaseProvider.PLACEHOLDER,
                                              height: 400,
                                              width: 400,
                                              fit: BoxFit.contain,
                                            );
                                          },
                                        ),
                                      ),
                                    ).zoom(
                                        viewPort: 0.28,
                                        duration:
                                            const Duration(milliseconds: 300)),
                                  ))),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: HoverWidget(
                          builder: (BuildContext context, bool isHovered) =>
                              Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromRGBO(18, 66, 101, 0.08),
                                  blurRadius: 15,
                                  spreadRadius: isHovered ? 10 : 2,
                                  offset: Offset(
                                    isHovered ? 2 : 0,
                                    isHovered ? 6.0 : 2.0,
                                  ),
                                ),
                              ],
                            ),
                            child: NextCol(
                              sizes: 'col-12 col-lg-3 col-md-6 col-sm-12',
                              child: Container(
                                width: Responsive.isDesktop(context)
                                    ? MediaQuery.of(context).size.width * .4
                                    : MediaQuery.of(context).size.width,
                                // decoration: BoxDecoration(
                                //   color: Colors.white,
                                //
                                //   // borderRadius: BorderRadius.circular(20),
                                //   // border: Border.all(
                                //   //     color: kgreyColor, width: 3),
                                //   boxShadow: [
                                //     BoxShadow(
                                //       color: Colors.grey.withOpacity(0.2),
                                //       spreadRadius: 1,
                                //       blurRadius: 20,
                                //       offset: Offset(
                                //           0, 3), // changes position of shadow
                                //     ),
                                //   ],
                                // ),
                                child: Container(
                                  margin: EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        // decoration: const BoxDecoration(
                                        //     border: Border(
                                        //         bottom: BorderSide(color: kSecondaryColor, width: 3))),
                                        child: Text(
                                          "Producto: " +
                                              widget.articuloActual
                                                  .nombre_articulo,
                                          maxLines: 2,
                                          style: GoogleFonts.sourceSansPro(
                                              fontSize: 23,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Clave del articulo : " +
                                            widget.articuloActual.articulo,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                        style: GoogleFonts.sourceSansPro(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "Precio: \$ " +
                                            NumberFormat("#,###,##0.00")
                                                .format(widget.articuloActual.precio_base),
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: kPrimaryColor,
                                            fontSize: 20, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Descripcion : ",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 15,
                                        style: GoogleFonts.sourceSansPro(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        widget.articuloActual
                                            .descripcion_extendido
                                            .trim(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 15,
                                        style: GoogleFonts.sourceSansPro(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "Unidad : " +
                                            widget.articuloActual.nombre_unidad,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.sourceSansPro(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "Existencias : " +
                                            widget.articuloActual.disponible.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 18, fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Si deseas adquirir este producto contactanos.",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.sourceSansPro(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      widget.usuario != null
                                          ? Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              MaterialButton(
                                                color: kPrimaryColor,
                                                height: 30,
                                                onPressed: () {
                                                  setState(() {
                                                    if (quantity > 0) quantity--;
                                                  });
                                                },
                                                child: Icon(Icons.remove,
                                                    color: Colors.white),
                                              ),
                                              MaterialButton(
                                                color: kPrimaryColor,
                                                height: 30,
                                                onPressed: () {},
                                                child: Text(
                                                  quantity.toString(),
                                                  style: TextStyle(
                                                      color: kWhiteColor, fontSize: 25),
                                                ),
                                              ),
                                              MaterialButton(
                                                color: kPrimaryColor,
                                                height: 30,
                                                onPressed: () {
                                                  setState(() {
                                                    if (quantity <
                                                        widget.articuloActual
                                                            .disponible) quantity++;
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          MaterialButton(
                                            color: kPrimaryColor,
                                            height: 40,
                                            onPressed: () {
                                              _saveOnCart();
                                            },
                                            child: Text(
                                              "Agregar al Carrito",
                                              style: TextStyle(
                                                  color: kWhiteColor, fontSize: 20),
                                            ),
                                          ),
                                        ],
                                      )
                                          : Column(
                                        children: [
                                          MaterialButton(
                                            color: kPrimaryColor,
                                            height: 40,
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ProfileScreen()));
                                            },
                                            child: Text(
                                              "Iniciar Sesión",
                                              style: TextStyle(
                                                  color: kWhiteColor, fontSize: 20),
                                            ),
                                          ),
                                        ],
                                      )
                                      // SizedBox(
                                      //   height: 20,
                                      // ),
                                    ],
                                  ),
                                ),
                              ).zoom(
                                  viewPort: 0.28,
                                  duration: const Duration(milliseconds: 300)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

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
        ));
  }
}
