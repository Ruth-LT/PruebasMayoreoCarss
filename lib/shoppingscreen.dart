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
import 'navigation.dart';

class Shoppingscreen extends StatefulWidget {
  List<articulos> carrito;
  List<PlutoMenuItem> whiteHoverMenus;
  List<categorias> categoriasLista;
  bool cargando;
  Shoppingscreen(
      {Key key,
      this.carrito,
      this.whiteHoverMenus,
      this.categoriasLista,
      this.cargando})
      : super(key: key);

  @override
  State<Shoppingscreen> createState() => _ShoppingscreenState();
}

class _ShoppingscreenState extends State<Shoppingscreen> {
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
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Navigation(
                carrito: widget.carrito,
                whiteHoverMenus: widget.whiteHoverMenus,
                categoriasLista: widget.categoriasLista,
                cargando: widget.cargando),
            Container(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 50, top: 10, bottom: 10),
                    child: Text(
                      "Mi carrito",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            (MediaQuery.of(context).size.width) >= 1000
                                ? new Row(children: [
                                    FaIcon(
                                      FontAwesomeIcons.arrowLeft,
                                      color: Color(0xFF001F86),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Volver a comprar",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ])
                                : new Row(children: [
                                    FaIcon(FontAwesomeIcons.arrowLeft,
                                        color: Color(0xFF001F86)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ]),
                          ],
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            (MediaQuery.of(context).size.width) >= 1000
                                ? new Row(children: [
                                    FaIcon(
                                      FontAwesomeIcons.barcode,
                                      color: Color(0xFF001F86),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Comprar con Codigo",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ])
                                : new Row(children: [
                                    FaIcon(FontAwesomeIcons.barcode,
                                        color: Color(0xFF001F86)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ]),
                          ],
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(
                  Responsive.isMobilee(context) ? 0 : 20,
                ),
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        LayoutBuilder(
                          builder: (context, constraints) {
                            return Container(
                              padding: EdgeInsets.all(10),
                              height: 450,
                              width: Responsive.carrr(context)
                                  ? MediaQuery.of(context).size.width
                                  : MediaQuery.of(context).size.width * 0.6,
                              child: (widget.carrito != null && widget.carrito.isNotEmpty)?
                              ListView.builder(
                                  physics:
                                  BouncingScrollPhysics(),
                                  itemCount: widget.carrito.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (context, listViewIndex) {
                                    final articulo = widget.carrito[
                                    listViewIndex];

                                    return descriptionShopping(articulo);
                                  })
                                  : Container()
                              // ListView(
                              //   children: [
                              //     descriptionShopping(),
                              //     descriptionShopping(),
                              //     descriptionShopping(),
                              //   ],
                              // ),
                            );
                          },
                        ),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            return Container(
                                margin: EdgeInsets.all(20),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: Responsive.carrr(context)
                                    ? MediaQuery.of(context).size.width
                                    : MediaQuery.of(context).size.width * 0.3,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          "Total de Compra",
                                          style: products6(context),
                                        ),
                                      ),
                                      Text(
                                        "Total",
                                        style: products7(context),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Iva",
                                        style: products7(context),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Metodo de Pago",
                                        style: products7(context),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Direcccion ",
                                        style: products7(context),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: InkWell(
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 40,
                                            width: 300,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFC7C7C7),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Text(
                                              "Hacer Compra ",
                                              style: products7(context),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ));
                          },
                        ),
                      ],
                    )),
              ),
            ))
          ],
        ),
      ),
    );
  }

  LayoutBuilder descriptionShopping(articulos articulo) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          margin: EdgeInsets.all(
            Responsive.isMobilee(context) ? 0 : 20,
          ),
          width: 500,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Expanded(
                child: Image.asset(
                  "assets/Prueba.jpg",
                  width: 150,
                  height: 150,
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    articulo.nombre_articulo.trim(),
                    style: products4(context),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "\$" +
                        NumberFormat("#,###,##0.00")
                            .format(articulo.precio_base),
                    style: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Container(
                        height: 35,
                        width: Responsive.isMobilee(context) ? 65 : 25,
                        child: InkWell(
                          child: Icon(
                            FontAwesomeIcons.plus,
                            size: 15,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 35,
                        width: 30,
                        child: Text(
                          "1",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      Container(
                        height: 35,
                        width: Responsive.isMobilee(context) ? 65 : 25,
                        child: InkWell(
                          child: Icon(
                            FontAwesomeIcons.minus,
                            size: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(),
                  child: Text(
                    "1",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    widget.carrito.remove(articulo);
                  });
                },
                child: Container(
                    alignment: Alignment.center,
                    width: 50,
                    decoration: BoxDecoration(),
                    child: Icon(
                      FontAwesomeIcons.trash,
                      color: Color(0xFF001F86),
                      size: 15,
                    )),
              ),
            ],
          ),
        );
      },
    );
  }
}
