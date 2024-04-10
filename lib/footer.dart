import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:one_page/responsive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';
import 'app/text_styles.dart';

class Footer extends StatefulWidget {
  Footer({Key key}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
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
      padding: EdgeInsets.only(top: 70),
      color: Color(0xFF000000),
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 10,
        spacing: 10,
        children: [
          Container(
            width: Responsive.car(context)
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width * 0.20,
            height: Responsive.car(context) ? 150 : 200,
            child: Container(
                padding: EdgeInsets.only(left: 30),
                child: ListView(
                  children: [
                    Text(
                      "Contacto",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Text(
                      "Calle Eusebio Baez No. 5, Col. Deportistas, Chihuahua, Chih.",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "(614) 416-0599",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "info@mayoreocarss.com.mx",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                )),
          ),
          Container(
            width: Responsive.car(context)
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width * 0.20,
            height: Responsive.car(context) ? 170 : 200,
            child: Container(
                padding: EdgeInsets.only(left: 30),
                child: ListView(
                  children: [
                    Text(
                      "Categorias",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Text(
                      "Acumulaciones",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Afinacion",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Estetica Automotriz",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Fuel Injection",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Masa de Rueda",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                )),
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            width: Responsive.car(context)
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width * 0.20,
            height: Responsive.car(context) ? 170 : 200,
            child: ListView(
              children: [
                Text(
                  "Contactanos",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                Text(
                  "Telefono: (614) 416-0599",
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Direccion: Calle Eusebio Baez No. 5, Col. Deportistas, Chihuahua, Chih.",
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Correo: info@mayoreocarss.com.mx",
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(bottom: 10),
              alignment: Alignment.center,
              width: Responsive.car(context)
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width * 0.20,
              height: Responsive.car(context) ? 170 : 200,
              child: Image.asset(
                "assets/LogoMayoreo.jpg",
                width: 250,
                height: 125,
                fit: BoxFit.fitWidth,
              )),
        ],
      ),
    );
  }
}
