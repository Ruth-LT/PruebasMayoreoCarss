import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_page/Screens/Home/products/subcategoru_section_all.dart';
import 'package:one_page/Screens/Home/products/sucural_section.dart';

import '../../backend/database_connect.dart';
import '../../models/articulosModel.dart';
import '../../models/lineaModel.dart';
import '../../models/sublineaModel.dart';
import '../../responsive.dart';
import '../../widgets/menu.dart';
import 'products/product_section.dart';
import '';

class SubCategoriesScreenWidget extends StatefulWidget {
  final Sublinea sublineaActual;
  final List<articulos> articulo;
  final Linea lineaActual;
  const SubCategoriesScreenWidget(
      {Key key, this.sublineaActual, this.lineaActual, this.articulo})
      : super(key: key);

  @override
  _SubCategoriesScreenWidgetState createState() =>
      _SubCategoriesScreenWidgetState();
}

class _SubCategoriesScreenWidgetState extends State<SubCategoriesScreenWidget> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: DatabaseProvider.menuDrawer(context, widget.articulo),
      backgroundColor: Colors.white,
      //scrollable widget
      body: Container(
        child: Stack(children: [
          //now we create menu and header

          //now we create banner
          //for this import packages
        Padding(padding: EdgeInsets.only(top:Responsive.isMobile(context)? 80 : 150),
          // child: Expanded(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                children: [
                  SubCategorySectionWidget(
                      sublineaActual: widget.sublineaActual,
                      lineaActual: widget.lineaActual,
                      articulo: widget.articulo),
                  SucursalSectionWidget(
                    articulo: widget.articulo,
                  ),
                  //now we will make our site responsive
                ],
              // ),
            ),
          ),
          ),
          Navigation(articulo: widget.articulo),
        ]),
      ),
    );
  }
}
