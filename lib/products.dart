import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:one_page/models/articulosModel.dart';
import 'package:one_page/models/categoriasModel.dart';
import 'package:one_page/productdescription.dart';
import 'package:one_page/responsive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';
import 'app/text_styles.dart';

class Products extends StatefulWidget {
  List<articulos> carrito;
  List<PlutoMenuItem> whiteHoverMenus;
  List<categorias> categoriasLista;
  List<articulos> ultimosArticulos;
  bool cargando;
  Products(
      {Key key,
      this.carrito,
      this.whiteHoverMenus,
      this.categoriasLista,
      this.cargando,
      this.ultimosArticulos})
      : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  ScrollController scrollController = ScrollController();
  double currentHeight = 0.0;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      setState(() {
        currentHeight = scrollController.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF6C6C6C),
      child: Padding(
        padding: EdgeInsets.only(
          left: Responsive.isMobile(context) ? 0 : 150,
          right: Responsive.isMobile(context) ? 0 : 150,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                  bottom: 25,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white,
                      width: 3.0,
                    ),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Nuestros Productos",
                  style: products3(context),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20, top: 20),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: widget.ultimosArticulos
                      .map((element) => productos(context, element))
                      .toList(),
                  // children: [
                  //   productos(context),
                  //   productos(context),
                  //   productos(context),
                  //   productos(context),
                  //   productos(context),
                  //   productos(context),
                  //   productos(context),
                  //   productos(context),
                  // ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell productos(BuildContext context, articulos articulo) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => productdescription(
                    articulo: articulo,
                    carrito: widget.carrito,
                    whiteHoverMenus: widget.whiteHoverMenus,
                    categoriasLista: widget.categoriasLista,
                    cargando: widget.cargando)));
      },
      child: Container(
        height: Responsive.isMobile(context) ? 260 : 370,
        width: Responsive.isMobile(context) ? 170 : 270,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                width: 200,
                height: Responsive.isMobile(context) ? 110 : 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/Prueba.jpg"),
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
              child: Column(
                children: [
                  Container(
                    child: Text(
                      articulo.nombre_articulo.trim(),
                      style: products(context),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Referencia: " + articulo.articulo.trim(),
                      style: products2(context),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 0, left: 0),
                    child: Row(
                      children: [
                        Text(
                          "\$" +
                              NumberFormat("#,###,##0.00")
                                  .format(articulo.precio_base),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF595959),
                            fontFamily: 'Poppins',
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        InkWell(
                          onTap: () {
                            widget.carrito.add(articulo);
                          },
                          child: Icon(
                            FontAwesomeIcons.cartShopping,
                            size: 20,
                            color: Color(0xFF090909),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // InkWell productos(BuildContext context) {
  //   return InkWell(
  //     onTap: () {
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) => productdescription(
  //                   whiteHoverMenus: widget.whiteHoverMenus,
  //                   categoriasLista: widget.categoriasLista,
  //                   cargando: widget.cargando)));
  //     },
  //     child: Container(
  //       height: Responsive.isMobile(context) ? 260 : 370,
  //       width: Responsive.isMobile(context) ? 170 : 270,
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(25),
  //       ),
  //       child: Column(
  //         children: [
  //           Padding(
  //             padding: EdgeInsets.all(20),
  //             child: Container(
  //               width: 200,
  //               height: Responsive.isMobile(context) ? 110 : 200,
  //               decoration: BoxDecoration(
  //                   image: DecorationImage(
  //                 image: AssetImage("assets/Prueba.jpg"),
  //               )),
  //             ),
  //           ),
  //           Padding(
  //             padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
  //             child: Column(
  //               children: [
  //                 Container(
  //                   child: Text(
  //                     "VARILLA TRASERA FORD EXPLORER MOUNTAINEER 4X2 PERNO 17MM 02-05",
  //                     style: products(context),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 7,
  //                 ),
  //                 Container(
  //                   alignment: Alignment.centerLeft,
  //                   child: Text(
  //                     "Referencia ************",
  //                     style: products2(context),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 7,
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsets.only(right: 0, left: 0),
  //                   child: Row(
  //                     children: [
  //                       Container(
  //                         alignment: Alignment.centerLeft,
  //                         child: Row(
  //                           children: [
  //                             Icon(
  //                               (FontAwesomeIcons.dollarSign),
  //                               color: Color(0xFF575757),
  //                               size: 14,
  //                             ),
  //                             Text(
  //                               "10.000",
  //                               style: TextStyle(
  //                                 fontSize: 14,
  //                                 fontWeight: FontWeight.bold,
  //                                 color: Color(0xFF595959),
  //                                 fontFamily: 'Poppins',
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                       Expanded(
  //                         child: Container(),
  //                       ),
  //                       InkWell(
  //                         child: Icon(
  //                           FontAwesomeIcons.cartShopping,
  //                           size: 20,
  //                           color: Color(0xFF090909),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
