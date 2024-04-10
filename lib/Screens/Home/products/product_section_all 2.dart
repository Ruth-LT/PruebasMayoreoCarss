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

class AllProductSectionWidget extends StatefulWidget {
  const AllProductSectionWidget({
    Key key,
  }) : super(key: key);

  ProductSection createState() => ProductSection();
}

class ProductSection extends State<AllProductSectionWidget> {
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
    DatabaseProvider.getArticles(1).then((articulosResult) {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(),
                child:  Text(
                  "Marcas",
                  style:   GoogleFonts.sourceSansPro(fontSize: 23, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              lineaLista.length != 0
                  ? Wrap(
                      children: lineaLista
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
                                      f.nombre_linea,
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
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: kSecondaryColor, width: 3))),
                child:  Text(
                  "Ultimos productos",
                  style:   GoogleFonts.sourceSansPro(fontSize: 23, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              articulosLista.length != 0
                  ? Wrap(

                      children: articulosLista
                          .map((f) => GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: AnimatedContainer(
                                  duration: kDefaultDuration,
                                  width: 270,
                                  height: 320,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: kgreyColor, width: 3),
                                      boxShadow: [if (isHover) kDefaultShadow]),
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

                                                return Image.network(DatabaseProvider.LOGO,
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
                                                  fontWeight: FontWeight.w600),
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
                                onTap: () {},
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
                      onPressed: () {},
                      child: Text(
                        "Pagina Anterior",
                        style:   GoogleFonts.sourceSansPro(
                            color: kWhiteColor, fontSize: 20),
                      ),
                    ),
                  ),
                    onTap: () {},
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
                        onPressed: () {},
                        child: Text(
                          "Pagina Siguiente",
                          style:   GoogleFonts.sourceSansPro(
                              color: kWhiteColor, fontSize: 20),
                        ),
                      ),
                    ),
                    onTap: () {},
                  )]

              ),
              // Container(
              //   padding: const EdgeInsets.symmetric(vertical: 5),
              //   margin: const EdgeInsets.symmetric(horizontal: 10),
              //   decoration: const BoxDecoration(
              //       border: Border(
              //           bottom: BorderSide(color: kSecondaryColor, width: 3))),
              //   child: const Text(
              //     "Our Products",
              //     style:   GoogleFonts.sourceSansPro(fontSize: 23, fontWeight: FontWeight.w600),
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              // const AllBrandsProduct(),
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
              //     "Testimonios",
              //     style:   GoogleFonts.sourceSansPro(fontSize: 23, fontWeight: FontWeight.w600),
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 10),
              //   child: Author(),
              // ),
              // now add all brands data
              //first of all we create model

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
