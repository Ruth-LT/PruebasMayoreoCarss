import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_page/Screens/Home/products/producto_detalle_section_all.dart';
import 'package:one_page/Screens/Home/products/sucural_section.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../backend/database_connect.dart';
import '../../home.dart';
import '../../models/articulosModel.dart';
import '../../models/familiasModel.dart';
import '../../models/lineaModel.dart';
import '../../models/sublineaModel.dart';
import '../../models/sucursalesModel.dart';
import '../../models/userModel.dart';
import '../../responsive.dart';
import '../../views/contact_section.dart';
import '../../views/footer_section.dart';
import '../../widgets/menu.dart';
import 'products/product_section.dart';
import '';

class DetalleProductoScreenWidget extends StatefulWidget {
  final articulos articuloActual;
  final List<articulos> articulo;
  final Sublinea sublineaActual;
  final Linea lineaActual;
  List<sucursales> sucurales;
  final Familias familias;
   DetalleProductoScreenWidget(
      {Key key,
      this.articuloActual,
      this.articulo,
      this.lineaActual,
      this.familias,
      this.sublineaActual})
      : super(key: key);

  @override
  _DetalleProductoScreenWidgetState createState() =>
      _DetalleProductoScreenWidgetState();
}

class _DetalleProductoScreenWidgetState
    extends State<DetalleProductoScreenWidget> {
  user usuarioFinal;
  SharedPreferences preffs;
  sucursales sucursalSelected;

  initState() {
    super.initState();
    _currentSession();
    _getSucursalSelected();
  }

  _currentSession() async {
    preffs = await SharedPreferences.getInstance();
    String usuario = preffs.getString("user");
    String password = preffs.getString("password");

    DatabaseProvider.getUserByEmailPassword(usuario, password).then((value) {
      if (value.status) {
        print("valor de usuario: " + value.usuario.toString());

        setState(() {
          usuarioFinal = value;
        });
      } else {}
    });
  }
  _getSucursalSelected() async {
    var preffs = await SharedPreferences.getInstance();

    widget.sucurales.forEach((element) {
      if (element.sucursal.replaceAll(" ", "") ==
          preffs.getString("sucursal")) {
        setState(() {
          sucursalSelected = element;
        });

      }
    });
    DatabaseProvider.getSucursales(1).then((value) {
      value.forEach((element) {
        if (element.sucursal.replaceAll(" ", "") ==
            preffs.getString("sucursal")) {
          sucursalSelected = element;

        }
      });
      setState(() {
        widget.sucurales = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DatabaseProvider.menuDrawer(context, widget.articulo, widget.sucurales, sucursalSelected),
      backgroundColor: Colors.white,
      //scrollable widget
      body: Container(
        child: Stack(children: [
          //now we create menu and header

          //now we create banner
          //for this import packages
        Padding(padding: EdgeInsets.only(top:Responsive.isMobile(context)? 80 : 150),
          // child:  Expanded(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                children: [
                  DetalleProductoSectionWidget(
                    articuloActual: widget.articuloActual,
                    usuario: usuarioFinal,
                    familias: widget.familias,
                    lineaActual: widget.lineaActual,
                    sublineaActual: widget.sublineaActual,
                  ),
                  ContactSection(

                  ),
                  const FooterSection()
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
