import 'package:dropdown_button2/dropdown_button2.dart';
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
import '../../../responsive.dart';
import '../detalleproducto_screen.dart';
import '../products_screen.dart';
class HomeSectionWidget extends StatefulWidget {
  List<articulos> articulo;
  HomeSectionWidget({Key key, this.articulo}) : super(key: key);

  ProductSection createState() => ProductSection();
}

class ProductSection extends State<HomeSectionWidget> {
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
    DatabaseProvider.getUltimosCuatro().then((articulosResult) {
      setState(() {
        articulosLista = articulosResult;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isHover = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 40,
        ),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                width: Responsive.isDesktop(context)
                    ? MediaQuery.of(context).size.width * .3
                    : MediaQuery.of(context).size.width,
                child: Image.network(
                  DatabaseProvider.INICIOCONTACTO,
                  height: 400,
                  width: 400,
                  fit: BoxFit.contain,
                  errorBuilder: (BuildContext context, Object exception,
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
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
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
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        // decoration: const BoxDecoration(
                        //     border: Border(
                        //         bottom: BorderSide(color: kSecondaryColor, width: 3))),
                        child: Text(
                          "Bienvenido",
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
                        "A Promex donde encontraras todo lo que necesitas para expresar tu creatividad con colores vibrantes y de alta calidad. \n \n ¡Comienza a vender hoy mismo!",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 200,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: (){
                          //DatabaseProvider.getScreenContacto(this.context);
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
                              "CONTACTO",
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
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: Image.network(
                  "https://pinturaspromex.com/resources/lineasback.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 200,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 5),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                child: Text(
                  "LINEAS",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sourceSansPro(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          constraints: BoxConstraints(maxWidth: kMaxWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),

                lineaLista.length != 0
                    ? Builder(
                        builder: (context) {
                          return Container(
                            width: double.infinity,
                            height: 250,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  child: Scrollbar(
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: lineaLista.length,
                                      itemBuilder: (context, itemsStockIndex) {
                                        return InkWell(
                                            onTap: () {
                                              // _detalleProducto(
                                              // articulosLista[itemsStockIndex]);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => ProductsScreenWidget(
                                                        lineas: lineaLista[itemsStockIndex],
                                                      )));

                                            },
                                            child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 40, 15, 40),
                                                child: Container(
                                                    width: 250,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.1),
                                                          spreadRadius: .5,
                                                          blurRadius: 10,
                                                          offset: Offset(0,
                                                              0), // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Column(children: [
                                                      Container(
                                                        width: double.infinity,
                                                        child: Stack(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFF2F7FA),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                ),
                                                                child: InkWell(
                                                                  child:
                                                                      ClipRRect(
                                                                    child: Image
                                                                        .network(
                                                                      lineaLista[itemsStockIndex].ubicacion_URL,
                                                                      width: double
                                                                          .infinity,
                                                                      height: 100,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                      errorBuilder: (BuildContext context,
                                                                          Object
                                                                              exception,
                                                                          StackTrace
                                                                              stackTrace) {
                                                                        return Image.network(
                                                                            DatabaseProvider
                                                                                .PLACEHOLDER,
                                                                            fit:
                                                                                BoxFit.contain
                                                                        ,height: 100,);
                                                                      },
                                                                      loadingBuilder: (BuildContext context,
                                                                          Widget
                                                                              child,
                                                                          ImageChunkEvent
                                                                              loadingProgress) {
                                                                        if (loadingProgress ==
                                                                            null)
                                                                          return child;
                                                                        return Image.asset(
                                                                            "assets/images/placeholder.gif",
                                                                            fit:
                                                                                BoxFit.cover);
                                                                      },
                                                                    ),

                                                                    // Image.network(
                                                                    //
                                                                    //   'https://www.semana.com/resizer/qP8wwU7nbUGFTtb-_-uDMIh2waA=/1280x720/smart/filters:format(jpg):quality(80)/cloudfront-us-east-1.images.arcpublishing.com/semana/Q2LEJTAWWRFDVGUWJOS3Q5TH24.jpg',
                                                                    //
                                                                    //   fit: BoxFit.cover,
                                                                    // ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(15,
                                                                    10, 0, 10),
                                                        child: Text(
                                                          lineaLista[
                                                                  itemsStockIndex]
                                                              .nombre_linea,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 2,
                                                          style: GoogleFonts
                                                              .sourceSansPro(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .black87,
                                                                  fontSize: 15,
                                                                  fontStyle: GoogleFonts
                                                                          .poppins()
                                                                      .fontStyle),
                                                        ),
                                                      ),
                                                    ]))));
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : Column(),

              //bottom Navigation menu
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: Image.network(
                  "https://pinturaspromex.com/resources/ultimosproductosback.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 200,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 5),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                child: Text(
                  "PRODUCTOS NUEVOS",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sourceSansPro(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
        Container(
          constraints: BoxConstraints(maxWidth: kMaxWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!Responsive.isDesktop(context))
                articulosLista.length != 0
                    ? Wrap(
                        alignment: WrapAlignment.center,
                        children: articulosLista
                            .map((f) => GestureDetector(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 10, 10, 0),
                                    child: AnimatedContainer(
                                      duration: kDefaultDuration,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 20,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        //   borderRadius: BorderRadius.circular(20),
                                        //   // border: Border.all(
                                        //   //     color: kgreyColor, width: 3),
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //     color: Colors.grey.withOpacity(0.5),
                                        //     spreadRadius: 5,
                                        //     blurRadius: 7,
                                        //     offset: Offset(0, 3), // changes position of shadow
                                        //   ),
                                        // ],
                                      ),
                                      child: Stack(
                                        fit: StackFit.passthrough,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Image.network(
                                                  f.foto_articulo,
                                                  height: 150,
                                                  width: 150,
                                                  fit: BoxFit.contain,
                                                  errorBuilder: (BuildContext
                                                          context,
                                                      Object exception,
                                                      StackTrace stackTrace) {
                                                    return Image.network(
                                                      DatabaseProvider
                                                          .PLACEHOLDER,
                                                      height: 150,
                                                      width: 150,
                                                      fit: BoxFit.contain,
                                                    );
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Expanded(
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              f.nombre_articulo,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: GoogleFonts
                                                                  .sourceSansPro(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
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
                                                  articulo: widget.articulo,
                                                )));
                                  },
                                ))
                            .toList(),
                      )
                    : Column(),
              if (Responsive.isDesktop(context))
                articulosLista.length != 0
                    ? Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: articulosLista
                              .map((f) => GestureDetector(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: AnimatedContainer(
                                        duration: kDefaultDuration,
                                        width: 270,
                                        height: 320,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          //
                                          // borderRadius: BorderRadius.circular(20),
                                          // // border: Border.all(
                                          // //     color: kgreyColor, width: 3),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
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
                                                  const EdgeInsets.all(20.0),
                                              child: Column(
                                                children: [
                                                  Image.network(
                                                    f.foto_articulo,
                                                    height: 150,
                                                    width: 150,
                                                    fit: BoxFit.contain,
                                                    errorBuilder: (BuildContext
                                                            context,
                                                        Object exception,
                                                        StackTrace stackTrace) {
                                                      return Image.network(
                                                        DatabaseProvider
                                                            .PLACEHOLDER,
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
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: GoogleFonts
                                                        .sourceSansPro(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
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
                                              builder: (context) =>
                                                  DetalleProductoScreenWidget(
                                                    articuloActual: f,
                                                    articulo: widget.articulo,
                                                  )));
                                    },
                                  ))
                              .toList(),
                        ))
                    : Column(),
            ],
          ),
        ),
      ],
    );
  }
}
