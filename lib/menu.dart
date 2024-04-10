import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:one_page/models/articulosModel.dart';
import 'package:one_page/models/sucursalesModel.dart';
import 'package:one_page/widgets/menu.dart';

import 'backend/database_connect.dart';
import 'home.dart';
import 'nuevos.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  List<articulos> get articulo => null;

  List<sucursales> get sucurales => null;

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  ScrollController scrollController = ScrollController();

  sucursales get sucursalSelected => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DatabaseProvider.menuDrawer(
          context, widget.articulo, widget.sucurales, sucursalSelected),
      body: Column(
        children: [
          Navigation(),
          Expanded(
              child: SingleChildScrollView(
            controller: scrollController,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/CarroRefa.png'),
                    )),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 75,
                    child: const Text(
                      "AAAAAAAAAAAA",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        right: 30, left: 30, top: 20, bottom: 0),
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.30,
                          height: 300,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/Bateria.png',
                              ),
                            ),
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black,
                                blurRadius: 3.0,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .30,
                          height: 300,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/Bandas.jpg',
                              ),
                            ),
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black,
                                blurRadius: 3.0,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .30,
                          height: 300,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/Balatas.jpg',
                              ),
                            ),
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black, // Color de la sombra
                                blurRadius: 3.0, // Radio de difuminado
                                offset: Offset(0, 1), // Desplazamiento en x e y
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        right: 50, left: 50, top: 70, bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    // height: 250,

                    child: Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: 220,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/Aceite.jpg',
                              ),
                            ),
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black,
                                blurRadius: 3.0,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .15,
                          height: 220,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/Crucetas.jpg',
                              ),
                            ),
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black,
                                blurRadius: 3.0,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .15,
                          height: 220,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/Parabrisas.jpg',
                              ),
                            ),
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black,
                                blurRadius: 3.0,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .15,
                          height: 220,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/Power.png',
                              ),
                            ),
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black,
                                blurRadius: 3.0,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        right: 50, left: 50, top: 70, bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: 220,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/Aceite.jpg',
                              ),
                            ),
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black,
                                blurRadius: 3.0,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .15,
                          height: 220,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/Crucetas.jpg',
                              ),
                            ),
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black,
                                blurRadius: 3.0,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .15,
                          height: 220,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/Parabrisas.jpg',
                              ),
                            ),
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black,
                                blurRadius: 3.0,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .15,
                          height: 220,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/Power.png',
                              ),
                            ),
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black,
                                blurRadius: 3.0,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        right: 50, left: 50, top: 70, bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: 220,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/Aceite.jpg',
                              ),
                            ),
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black,
                                blurRadius: 3.0,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .15,
                          height: 220,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/Crucetas.jpg',
                              ),
                            ),
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black,
                                blurRadius: 3.0,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .15,
                          height: 220,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/Parabrisas.jpg',
                              ),
                            ),
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black,
                                blurRadius: 3.0,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .15,
                          height: 220,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/Power.png',
                              ),
                            ),
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black,
                                blurRadius: 3.0,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
