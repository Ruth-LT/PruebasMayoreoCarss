import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_page/Screens/Home/products/about_section.dart';
import 'package:one_page/Screens/Home/products/sucural_section.dart';
import 'package:one_page/views/about_section_complete.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../backend/database_connect.dart';
import '../../home.dart';
import '../../models/articulosModel.dart';
import '../../models/sucursalesModel.dart';
import '../../models/userModel.dart';
import '../../responsive.dart';
import '../../views/contact_section.dart';
import '../../views/footer_section.dart';
import '../../widgets/menu.dart';
import 'products/product_section.dart';

class OurCompanyScreen extends StatefulWidget {
  List<articulos> articulo;
  List<sucursales> sucurales;
  List<user> usuario;
  OurCompanyScreen({Key key, this.articulo, this.sucurales, this.usuario})
      : super(key: key);

  @override
  _OurCompanyScreenState createState() => _OurCompanyScreenState();
}

class _OurCompanyScreenState extends State<OurCompanyScreen> {
  List<articulos> listadeArticulos = [];

  sucursales sucursalSelected;
  initState() {
    super.initState();
    _getArticulos();
    _getSucursalSelected();
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
  _getArticulos() async {
    var preffs = await SharedPreferences.getInstance();
    String sucursal = preffs.getString("sucursal");
    if (sucursal == null) {
      preffs.setString("sucursal", "1");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OurCompanyScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DatabaseProvider.menuDrawer(context, widget.articulo, widget.sucurales, sucursalSelected),
      backgroundColor: Colors.white,
      //scrollable widget
      body: Container(
        child: Stack(
          children: [
            //now we create menu and header

            //now we create banner
            //for this import packages
            Padding(padding: EdgeInsets.only(top:Responsive.isMobile(context)? 100 : 150),
              // child: Expanded(
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  children: [
                    AboutSectionComplete(),
                    // ProductSectionWidget(
                    //   articulo: widget.articulo,
                    // ),
                    const FooterSection()
                  ],
                // ),
              ),
            ),
            ),
            Navigation(),
            //now we will make our site responsive
          ],
        ),
      ),
    );
  }
}
