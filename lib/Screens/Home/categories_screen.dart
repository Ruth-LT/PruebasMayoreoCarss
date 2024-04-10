import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_page/Screens/Home/products/categoru_section_all.dart';
import 'package:one_page/Screens/Home/products/sucural_section.dart';

import '../../backend/database_connect.dart';
import '../../models/articulosModel.dart';
import '../../models/lineaModel.dart';
import '../../responsive.dart';
import '../../widgets/menu.dart';
import 'products/product_section.dart';
import '';

class CategoriesScreen extends StatefulWidget {
  final Linea lineaActual;
  final List<articulos> articulo;

  const CategoriesScreen({Key key, this.lineaActual, this.articulo})
      : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: DatabaseProvider.menuDrawer(context, widget.articulo),
      backgroundColor: Colors.white,
      //scrollable widget
      body: Container(
        child: Stack(
            children: [
              //now we create menu and header
          //now we create banner
          //for this import packages
        Padding(padding: EdgeInsets.only(top:Responsive.isMobile(context)? 80 : 150),
          // child: Expanded(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                children: [
                  CategorySectionWidget(
                    lineaActual: widget.lineaActual,
                  ),
                  SucursalSectionWidget(
                    articulo: widget.articulo,
                  ),
                  //now we will make our site responsive
                ],
              ),
            // ),
          ),
          ),
          Navigation(articulo: widget.articulo),
        ]),
      ),
    );
  }
}
