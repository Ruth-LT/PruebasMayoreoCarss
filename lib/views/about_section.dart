import 'package:one_page/app/fonts.dart';
import 'package:one_page/backend/database_connect.dart';
import 'package:one_page/generated/assets.dart';
import 'package:one_page/home.dart';
import '../app/text_styles.dart';
import 'package:flutter_next/flutter_next.dart';
import 'package:flutter/material.dart';
import '../ordered_list.dart';
import 'details_sections.dart';
import 'video_section.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 60, right: 60),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Text(
              "Nuestras mejores Categorias ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins'),
            ),
          ),


          Align(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              alignment: Alignment.center,
              child: Wrap(
                runSpacing: 30,
                spacing: 30,
                children: [
                  Container(

                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(100),
                      // Color de fondo del contenedor
                      boxShadow: [
                        BoxShadow(
                          color:
                          Colors.black, // Color de la sombra
                          blurRadius:
                          5.0, // Radio de difuminado
                          offset: Offset(
                              0, 3), // Desplazamiento en x e y
                        ),
                      ],
                    ),
                    child: Text ("Balatas",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(100),
                      // Color de fondo del contenedor
                      boxShadow: [
                        BoxShadow(
                          color:
                          Colors.black, // Color de la sombra
                          blurRadius:
                          5.0, // Radio de difuminado
                          offset: Offset(
                              0, 3), // Desplazamiento en x e y
                        ),
                      ],
                    ),
                    child: Text ("Suspensiones",style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(100),
                      // Color de fondo del contenedor
                      boxShadow: [
                        BoxShadow(
                          color:
                          Colors.black, // Color de la sombra
                          blurRadius:
                          5.0, // Radio de difuminado
                          offset: Offset(
                              0, 3), // Desplazamiento en x e y
                        ),
                      ],
                    ),
                    child: Text ("Baterias",style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(100),
                      // Color de fondo del contenedor
                      boxShadow: [
                        BoxShadow(
                          color:
                          Colors.black, // Color de la sombra
                          blurRadius:
                          5.0, // Radio de difuminado
                          offset: Offset(
                              0, 3), // Desplazamiento en x e y
                        ),
                      ],
                    ),
                    child: Text ("Baleros",style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(100),
                      // Color de fondo del contenedor
                      boxShadow: [
                        BoxShadow(
                          color:
                          Colors.black, // Color de la sombra
                          blurRadius:
                          5.0, // Radio de difuminado
                          offset: Offset(
                              0, 3), // Desplazamiento en x e y
                        ),
                      ],
                    ),
                    child: Text ("Aceites",style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(100),
                      // Color de fondo del contenedor
                      boxShadow: [
                        BoxShadow(
                          color:
                          Colors.black, // Color de la sombra
                          blurRadius:
                          5.0, // Radio de difuminado
                          offset: Offset(
                              0, 3), // Desplazamiento en x e y
                        ),
                      ],
                    ),
                    child: Text ("Power",style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.black,

                      borderRadius: BorderRadius.circular(100),

                      // Color de fondo del contenedor
                      boxShadow: [
                        BoxShadow(
                          color:
                          Colors.black, // Color de la sombra
                          blurRadius:
                          5.0, // Radio de difuminado
                          offset: Offset(
                              0, 3), // Desplazamiento en x e y
                        ),
                      ],
                    ),
                    child: Text ("Crucetas",style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),



    );
  }
}
