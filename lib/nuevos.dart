import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:one_page/models/articulosModel.dart';
import 'package:one_page/models/sucursalesModel.dart';
import 'package:one_page/responsive.dart';

import 'backend/database_connect.dart';
import 'home.dart';

class Nuevos extends StatefulWidget {
  final String nombre;
  Nuevos({Key key, this.nombre}) : super(key: key);

  List<articulos> get articulo => null;

  List<sucursales> get sucurales => null;

  @override
  State<Nuevos> createState() => _NuevosState();
}

class _NuevosState extends State<Nuevos> {
  ScrollController scrollController = ScrollController();

  sucursales get sucursalSelected => null;

  _Menu() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DatabaseProvider.menuDrawer(
          context, widget.articulo, widget.sucurales, sucursalSelected),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: Column(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                _Menu();
                              },
                              child: FaIcon(
                                FontAwesomeIcons.arrowLeft,
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 20,
                                  right: Responsive.isMobile(context) ? 0 : 0),
                              child: Container(
                                height: 80,
                                width: Responsive.isMobile(context)
                                    ? 150
                                    : MediaQuery.of(context).size.width * .4,
                                child: TextField(
                                  onSubmitted: (value) {},
                                  onChanged: (value) {
                                    //
                                    //
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    hintText: 'Buscar Articulos',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            InkWell(
                              onTap: () {},
                              child: FaIcon(
                                FontAwesomeIcons.cartShopping,
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 80, left: 80),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 700,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 3.0,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: 700,
                            decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 20),
                                  width: 700,
                                  height: 600,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/Aceite.jpg',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.30,
                              height: 700,
                              decoration: BoxDecoration(
                                color: Colors.white30,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 20, top: 50),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 400,
                                      height: 100,
                                      child: Text(
                                        widget.nombre +
                                            'Aceite Motor Mobil 10w30 Extengine Semisintetico 5lts',
                                        style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                      child: Container(),
                                    ),
                                    Container(
                                      width: 400,
                                      height: 50,
                                      child: Text(
                                        '500,000',
                                        style: TextStyle(
                                          fontSize: 35,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                      child: Container(),
                                    ),
                                    Container(
                                      width: 400,
                                      height: 200,
                                      child: Text(
                                        'Mobil Super Synthetic es un aceite para motores completamente sintético que ofrece 80% mejor protección que la industria�.Brinda protección excepcional a las partes críticas de tu motor en un amplio rango de temperaturas de operación, climas y condiciones de manejo.',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                      child: Container(),
                                    ),
                                    Container(
                                      width: 400,
                                      height: 30,
                                      child: Text(
                                        'Stock disponible',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                      child: Container(),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 400,
                                      height: 70,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          InkWell(
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 170,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black,
                                                    blurRadius: 3.0,
                                                    offset: Offset(0, 1),
                                                  ),
                                                ],
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      FaIcon(
                                                        Icons
                                                            .arrow_downward_sharp,
                                                        size: 15,
                                                        color: Colors.black,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        'Comprar ahora',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                          InkWell(
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 170,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black,
                                                    blurRadius: 3.0,
                                                    offset: Offset(0, 1),
                                                  ),
                                                ],
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Container(
                                                  child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  FaIcon(
                                                    Icons.add_shopping_cart,
                                                    size: 15,
                                                    color: Colors.black,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Añadir al carrito',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              )),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        )
                      ],
                    )),
              ),
              Padding(
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
                                "Mas de nuestros productos ",
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
                                      padding:
                                          EdgeInsets.only(top: 20, bottom: 20),
                                      child: Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        runSpacing: 20,
                                        spacing: 20,
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.15,
                                              height: 300,
                                              decoration: BoxDecoration(

                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors
                                                        .black,
                                                    blurRadius:
                                                        5.0,
                                                    offset: Offset(0,
                                                        3),
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 225,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/Aceite.jpg'),
                                                      fit: BoxFit.cover,
                                                    )),
                                                  ),
                                                  Container(
                                                    color: Colors.green,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 75,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.15,
                                              height: 300,
                                              decoration: BoxDecoration(

                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors
                                                        .black, // Color de la sombra
                                                    blurRadius:
                                                        5.0, // Radio de difuminado
                                                    offset: Offset(0,
                                                        3), // Desplazamiento en x e y
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 225,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/Power.png'),
                                                        )),
                                                  ),
                                                  Container(
                                                    color: Colors.green,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 75,
                                                  ),
                                                ],
                                              )),
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
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
                                                    offset: Offset(0,
                                                        3), // Desplazamiento en x e y
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 225,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/Parabrisas.jpg'),
                                                      fit: BoxFit.cover,
                                                    )),
                                                  ),
                                                  Container(
                                                    color: Colors.green,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 75,
                                                  ),
                                                ],
                                              )),
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
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
                                                    offset: Offset(0,
                                                        3), // Desplazamiento en x e y
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 225,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/Crucetas.jpg'),
                                                      fit: BoxFit.cover,
                                                    )),
                                                  ),
                                                  Container(
                                                    color: Colors.green,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 75,
                                                  ),
                                                ],
                                              )),
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
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
                                                    offset: Offset(0,
                                                        3), // Desplazamiento en x e y
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 225,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/Baleros.jpg'),
                                                      fit: BoxFit.cover,
                                                    )),
                                                  ),
                                                  Container(
                                                    color: Colors.green,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 75,
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
                                      padding:
                                          EdgeInsets.only(top: 20, bottom: 20),
                                      child: Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        runSpacing: 20,
                                        spacing: 20,
                                        children: [
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
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
                                                    offset: Offset(0,
                                                        3), // Desplazamiento en x e y
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 225,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/Aceite.jpg'),
                                                      fit: BoxFit.cover,
                                                    )),
                                                  ),
                                                  Container(
                                                    color: Colors.green,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 75,
                                                  ),
                                                ],
                                              )),
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
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
                                                    offset: Offset(0,
                                                        3), // Desplazamiento en x e y
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 225,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/Power.png'),
                                                        )),
                                                  ),
                                                  Container(
                                                    color: Colors.green,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 75,
                                                  ),
                                                ],
                                              )),
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
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
                                                    offset: Offset(0,
                                                        3), // Desplazamiento en x e y
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 225,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/Parabrisas.jpg'),
                                                      fit: BoxFit.cover,
                                                    )),
                                                  ),
                                                  Container(
                                                    color: Colors.green,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 75,
                                                  ),
                                                ],
                                              )),
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
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
                                                    offset: Offset(0,
                                                        3), // Desplazamiento en x e y
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 225,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/Crucetas.jpg'),
                                                      fit: BoxFit.cover,
                                                    )),
                                                  ),
                                                  Container(
                                                    color: Colors.green,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 75,
                                                  ),
                                                ],
                                              )),
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
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
                                                    offset: Offset(0,
                                                        3), // Desplazamiento en x e y
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 225,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/Baleros.jpg'),
                                                      fit: BoxFit.cover,
                                                    )),
                                                  ),
                                                  Container(
                                                    color: Colors.green,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 75,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
