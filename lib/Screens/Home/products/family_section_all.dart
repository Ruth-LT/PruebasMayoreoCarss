import 'package:flutter/material.dart';
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
import '../subcategorias_screen.dart';

class FamiliaSectionWidget extends StatefulWidget {
  final Sublinea sublineaActual;
  final Linea lineaActual;
  final Familias familia;
  final List<articulos> articulo;
  const FamiliaSectionWidget({
    Key key, this.sublineaActual, this.lineaActual, this.articulo, this.familia
  }) : super(key: key);

  ProductSection createState() => ProductSection();
}

class ProductSection extends State<FamiliaSectionWidget> {
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
    _getUltimosCuatro();
  }

  // _getCategorias() {
  //   DatabaseProvider.getSublineas(widget.sublineaActual.linea).then((lineasResult) {
  //     setState(() {
  //       sublineaLista = lineasResult;
  //     });
  //   });
  // }


  _getUltimosCuatro() {
    print(widget.sublineaActual.sublinea);
    DatabaseProvider.getArticulosPaginaSublinea(1,20,countPages, int.parse(widget.familia.familia)).then((articulosResult) {
      setState(() {
        articulosLista = articulosResult;
      });
    });
    print(articulosLista.length);
  }


  @override
  Widget build(BuildContext context) {
    bool isHover = false;
    return Column(

      children: [
        Container(
          constraints: BoxConstraints(maxWidth: kMaxWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center
            ,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                margin: const EdgeInsets.symmetric(horizontal: 10),

                child:  Text(
                  "FAMILIAS",
                  style:   GoogleFonts.sourceSansPro(fontSize: 23, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  margin: const EdgeInsets.symmetric(horizontal: 10),

                child:  Text(
                  "Secuencia de busqueda",
                  style:   GoogleFonts.sourceSansPro(fontSize: 23, fontWeight: FontWeight.w600),
                ),
              ),
              Wrap(children: [
                InkWell(onTap: (){

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoriesScreen(lineaActual: widget.lineaActual)));
                },child: Container(
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
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  // decoration: const BoxDecoration(
                  //     border: Border(
                  //         bottom: BorderSide(color: kSecondaryColor, width: 3))),
                  child: Icon(Icons.arrow_forward_ios_rounded,
                    color: kPrimaryColor,
                    size: 20,
                  ),
                ),
                InkWell(onTap: (){

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubCategoriesScreenWidget(lineaActual: widget.lineaActual, sublineaActual: widget.sublineaActual,)));
                },child:Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  // decoration: const BoxDecoration(
                  //     border: Border(
                  //         bottom: BorderSide(color: kSecondaryColor, width: 3))),
                  child:  Text(
                     widget.sublineaActual.nombre_sublinea,
                    style:   GoogleFonts.sourceSansPro(fontSize: 23, fontWeight: FontWeight.w600),
                  ),
                ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  // decoration: const BoxDecoration(
                  //     border: Border(
                  //         bottom: BorderSide(color: kSecondaryColor, width: 3))),
                  child: Icon(Icons.arrow_forward_ios_rounded,
                    color: kPrimaryColor,
                    size: 20,
                  ),
                ),
                InkWell(onTap: (){


                },child:Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  // decoration: const BoxDecoration(
                  //     border: Border(
                  //         bottom: BorderSide(color: kSecondaryColor, width: 3))),
                  child:  Text(
                    widget.sublineaActual.nombre_sublinea,
                    style:   GoogleFonts.sourceSansPro(fontSize: 23, fontWeight: FontWeight.w600),
                  ),
                ),
                ),
                    ]),

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
                                    onPressed: () {},
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


              // Container(
              //   padding: const EdgeInsets.symmetric(vertical: 5),
              //   margin: const EdgeInsets.symmetric(horizontal: 10),
              //   decoration: const BoxDecoration(
              //       border: Border(
              //           bottom: BorderSide(color: kSecondaryColor, width: 3))),
              //   child: const Text(
              //     "Mostrando los ultimos 20 productos de esta subcategoria",
              //     style:   GoogleFonts.sourceSansPro(fontSize: 23, fontWeight: FontWeight.w600),
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              if (!Responsive.isDesktop(context))
                articulosLista.length != 0
                    ? Wrap(
                  alignment: WrapAlignment.center,
                  children: articulosLista
                      .map((f) => GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: AnimatedContainer(
                        duration: kDefaultDuration,
                        width: MediaQuery.of(context).size.width,
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
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.network(
                                    f.foto_articulo,
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.contain,
                                    errorBuilder: (BuildContext context,  Object exception, StackTrace stackTrace) {

                                      return Image.network(DatabaseProvider.PLACEHOLDER,
                                        height: 150,
                                        width: 150,
                                        fit: BoxFit.contain,
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(child:
                                  Container(

                                      alignment: Alignment.center,
                                      child:
                                      Column(

                                        children: [
                                          Text(
                                            f.nombre_articulo,
                                            overflow:
                                            TextOverflow.ellipsis,
                                            style:   GoogleFonts.sourceSansPro(
                                                fontSize: 18,
                                                fontWeight:
                                                FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),

                                        ],
                                      )
                                  )
                                  )


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
                                    familias: widget.familia,
                                    lineaActual: widget.lineaActual,
                                    sublineaActual: widget.sublineaActual,
                                  )));
                    },
                  ))
                      .toList(),
                )
                    : Column(),
              if (Responsive.isDesktop(context))
                articulosLista.length != 0
                    ? Wrap(
                  alignment: WrapAlignment.center,
                  children: articulosLista
                      .map((f) => GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: AnimatedContainer(
                        duration: kDefaultDuration,
                        width: 270,
                        height: 320,
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
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.network(
                                    f.foto_articulo,
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.contain,
                                    errorBuilder: (BuildContext context,  Object exception, StackTrace stackTrace) {

                                      return Image.network(DatabaseProvider.PLACEHOLDER,
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
                                    overflow: TextOverflow.ellipsis,
                                    style:   GoogleFonts.sourceSansPro(
                                        fontSize: 18,
                                        fontWeight:
                                        FontWeight.w600),
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
                                    familias: widget.familia,
                                    lineaActual: widget.lineaActual,
                                    sublineaActual: widget.sublineaActual,
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
                  children:  [
                    GestureDetector(
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
                            if(countPages>1){
                              countPages = countPages - 1;
                              _getUltimosCuatro();
                            }
                          },
                          child: Text(
                            "Anterior",
                            style:   GoogleFonts.sourceSansPro(
                                color: kWhiteColor, fontSize: 20),
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                    Text(
                      'Pagina actual '+ countPages.toString(),
                      style:   GoogleFonts.sourceSansPro(
                          color: kDarkblueColor, fontSize: 20),
                    ),
                    GestureDetector(
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
                            countPages = countPages + 1;
                            _getUltimosCuatro();
                          },
                          child: Text(
                            "Siguiente",
                            style:   GoogleFonts.sourceSansPro(
                                color: kWhiteColor, fontSize: 20),
                          ),
                        ),
                      ),
                      onTap: () {},
                    )]

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
