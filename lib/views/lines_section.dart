import '../app/data.dart';
import '../app/text_styles.dart';

import 'package:flutter_next/flutter_next.dart';
import 'package:flutter/material.dart';
import '../backend/database_connect.dart';
import '../models/lineaModel.dart';
import '../nuevos.dart';
import '../widgets/service_item.dart';

class LinesSectionWidget extends StatefulWidget {
  const LinesSectionWidget({Key key}) : super(key: key);

  LinesSection createState() => LinesSection();
}

class LinesSection extends State<LinesSectionWidget> {
  List<Linea> lineaLista = [];


  String nombre = "pedro";

  @override
  void initState() {
    super.initState();
    _getCategorias();
  }

  _getCategorias() {
    DatabaseProvider.getLineas(1).then((lineasResult) {
      setState(() {
        lineaLista = lineasResult;
      });
    });
  }

  _Nuevos() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Nuevos(nombre: nombre,)));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Container(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 60,
                    right: 60,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 500,
                    height: 100,
                    child: Text(
                      "Mejores ventas ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 100,
                    right: 100,
                  ),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              runSpacing: 20,
                              spacing: 20,
                              children: [


                                InkWell(
                                  onTap: () {
                                    _Nuevos();
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      // Color de fondo del contenedor
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors
                                              .black, // Color de la sombra
                                          blurRadius:
                                          5.0, // Radio de difuminado
                                          offset: Offset(
                                              0, 3), // Desplazamiento en x e y
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width,
                                          height: 225,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image:
                                                AssetImage('assets/Aceite.jpg'),
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
color: Colors.white,
                                          width:
                                          MediaQuery.of(context).size.width,
                                          height: 75,
                                          child: Text(
                                            "Mobile Super 1000"
                                          ),
                                        ),
                                      ],
                                    ),),
                                ),




                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      // Color de fondo del contenedor
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors
                                              .black, // Color de la sombra
                                          blurRadius:
                                              5.0, // Radio de difuminado
                                          offset: Offset(
                                              0, 3), // Desplazamiento en x e y
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 225,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                              image: DecorationImage(
                                            image:
                                                AssetImage('assets/Power.png'),
                                          )),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          color: Colors.white,
                                          width:
                                          MediaQuery.of(context).size.width,
                                          height: 75,
                                          child: Text(
                                              "Quaker State"
                                          ),
                                        ),
                                      ],
                                    )),
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      // Color de fondo del contenedor
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors
                                              .black, // Color de la sombra
                                          blurRadius:
                                              5.0, // Radio de difuminado
                                          offset: Offset(
                                              0, 3), // Desplazamiento en x e y
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 225,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                            image: AssetImage(
                                                'assets/Parabrisas.jpg'),
                                            fit: BoxFit.cover,
                                          )),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          color: Colors.white,
                                          width:
                                          MediaQuery.of(context).size.width,
                                          height: 75,
                                          child: Text(
                                              "Parabrisas"
                                          ),
                                        ),
                                      ],
                                    )),
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      color: Colors.red,

                                      // Color de fondo del contenedor
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors
                                              .black, // Color de la sombra
                                          blurRadius:
                                              5.0, // Radio de difuminado
                                          offset: Offset(
                                              0, 3), // Desplazamiento en x e y
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 225,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                            image: AssetImage(
                                                'assets/Crucetas.jpg'),
                                            fit: BoxFit.cover,
                                          )),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          color: Colors.white,
                                          width:
                                          MediaQuery.of(context).size.width,
                                          height: 75,
                                          child: Text(
                                              "Cruceta"
                                          ),
                                        ),
                                      ],
                                    )),
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      color: Colors.red,

                                      // Color de fondo del contenedor
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors
                                              .black, // Color de la sombra
                                          blurRadius:
                                              5.0, // Radio de difuminado
                                          offset: Offset(
                                              0, 3), // Desplazamiento en x e y
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 225,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                            image: AssetImage(
                                                'assets/Baleros.jpg'),
                                            fit: BoxFit.cover,
                                          )),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          color: Colors.white,
                                          width:
                                          MediaQuery.of(context).size.width,
                                          height: 75,
                                          child: Text(
                                              "Baleros"
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ))),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 60,
                    right: 60,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 500,
                    height: 100,
                    child: Text(
                      "Nuestros Productos ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 100,
                    right: 100,
                  ),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              runSpacing: 20,
                              spacing: 20,
                              children: [


                                InkWell(
                                  onTap: () {
                                    _Nuevos();
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      // Color de fondo del contenedor
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors
                                              .black, // Color de la sombra
                                          blurRadius:
                                          5.0, // Radio de difuminado
                                          offset: Offset(
                                              0, 3), // Desplazamiento en x e y
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width,
                                          height: 225,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image:
                                                AssetImage('assets/Aceite.jpg'),
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          color: Colors.white,
                                          width:
                                          MediaQuery.of(context).size.width,
                                          height: 75,
                                          child: Text(
                                              "Mobile Super 1000"
                                          ),
                                        ),
                                      ],
                                    ),),
                                ),




                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      // Color de fondo del contenedor
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors
                                              .black, // Color de la sombra
                                          blurRadius:
                                          5.0, // Radio de difuminado
                                          offset: Offset(
                                              0, 3), // Desplazamiento en x e y
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width,
                                          height: 225,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              image: DecorationImage(
                                                image:
                                                AssetImage('assets/Power.png'),
                                              )),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          color: Colors.white,
                                          width:
                                          MediaQuery.of(context).size.width,
                                          height: 75,
                                          child: Text(
                                              "Quaker State"
                                          ),
                                        ),
                                      ],
                                    )),
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      // Color de fondo del contenedor
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors
                                              .black, // Color de la sombra
                                          blurRadius:
                                          5.0, // Radio de difuminado
                                          offset: Offset(
                                              0, 3), // Desplazamiento en x e y
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width,
                                          height: 225,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/Parabrisas.jpg'),
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          color: Colors.white,
                                          width:
                                          MediaQuery.of(context).size.width,
                                          height: 75,
                                          child: Text(
                                              "Parabrisas"
                                          ),
                                        ),
                                      ],
                                    )),
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      color: Colors.red,

                                      // Color de fondo del contenedor
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors
                                              .black, // Color de la sombra
                                          blurRadius:
                                          5.0, // Radio de difuminado
                                          offset: Offset(
                                              0, 3), // Desplazamiento en x e y
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width,
                                          height: 225,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/Crucetas.jpg'),
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          color: Colors.white,
                                          width:
                                          MediaQuery.of(context).size.width,
                                          height: 75,
                                          child: Text(
                                              "Cruceta"
                                          ),
                                        ),
                                      ],
                                    )),
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      color: Colors.red,

                                      // Color de fondo del contenedor
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors
                                              .black, // Color de la sombra
                                          blurRadius:
                                          5.0, // Radio de difuminado
                                          offset: Offset(
                                              0, 3), // Desplazamiento en x e y
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width,
                                          height: 225,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/Baleros.jpg'),
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          color: Colors.white,
                                          width:
                                          MediaQuery.of(context).size.width,
                                          height: 75,
                                          child: Text(
                                              "Baleros"
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
