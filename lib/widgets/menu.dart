import 'dart:async';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_page/Screens/Home/products_screen.dart';
import 'package:one_page/nuevos.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/sucursalesModel.dart';
import '../../../models/sucursalesModel.dart';
import '../../../models/userModel.dart';
import '../Screens/Home/detalleproducto_screen.dart';
import '../backend/database_connect.dart';
import '../constants.dart';
import '../generated/assets.dart';
import '../home.dart';
import '../menu.dart';
import '../models/articulosModel.dart';
import '../responsive.dart';

class Navigation extends StatefulWidget {
  List<articulos> articulo;
  List<user> usuario;

  Navigation(
      {Key key, this.articulo, this.listaDeArticulosBusqueda, this.usuario})
      : super(key: key);

  List<articulos> listaDeArticulosBusqueda = [];
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  List<articulos> listadeArticulos = [];
  int carritoCount = 0;
  Timer _debounce;
  SharedPreferences preffs;
  List<sucursales> sucursal = [];

  String busqueda = "";
  TextEditingController sucursalBuscqueda = TextEditingController();
  sucursales sucursalSelected;
  initState() {
    _getSucursal();
  }

  _busqueda(String busqueda) {
    widget.articulo = [];
    DatabaseProvider.getBuscarFlutter(busqueda).then((value) {
      print("Count of search : " + value.length.toString());
      setState(() {
        widget.articulo = value;
        Navigator.pop(context);
        // setState(() {
        //   // Here you can write your code for open new view
        //   Navigator.pop(context);
        //   Navigator.pop(context);
        //   _showDialog(busqueda);
        // });
      });
      return value;
    });
  }

  _getCountPedidos() async {
    preffs = await SharedPreferences.getInstance();
    List<String> carrito = preffs.getStringList("carrito");
    if (carrito != null) {
      setState(() {
        carritoCount = carrito.length;
      });
    }
  }

  _messageLoading(String message) {
    showCupertinoModalPopup<void>(
      context: this.context,
      barrierDismissible: false,
      semanticsDismissible: false,
      builder: (BuildContext context) => CupertinoAlertDialog(
          title: Column(children: [
        Image.network(
          'assets/logo.jpg',
          width: MediaQuery.of(context).size.width * .1,
        ),
        Text(message),
      ])),
    );
  }

  _onSearchChanged(String query) {
    setState(() {
      busqueda = query;
    });
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(seconds: 1), () {
      if (busqueda == query) {
        // do something with query
        _realBusqueda(query);
      }
    });
  }

  _getSucursal() async {
    preffs = await SharedPreferences.getInstance();

    DatabaseProvider.getSucursales(1).then((value) {
      value.forEach((element) {
        if (element.sucursal.replaceAll(" ", "") ==
            preffs.getString("sucursal")) {
          sucursalSelected = element;
        }
      });
      setState(() {
        sucursal = value;
      });
    });
  }

  _saveSucursal(String sucursal) async {
    preffs = await SharedPreferences.getInstance();
    preffs.setString("sucursal", sucursal.replaceAll(" ", ""));
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  _realBusqueda(String query) {
    if (query == "") {
      setState(() {
        widget.articulo = null;
      });
    } else {
      if (query.isNotEmpty) {
        setState(() {
          _busqueda(query);
          // _showDialog(query);
          _messageLoading('Realizando consulta de ${query}');
        });
      }
    }
  }

  _Nuevos() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Nuevos()));
  }

  @override
  Widget build(BuildContext context) {
    _getCountPedidos();

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 50, right: 50),
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Row(
                    children: [


SizedBox(
  width: 10,
),

                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/LogoRefa.jpg'),
                            fit: BoxFit.cover,
                          )
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
                            onSubmitted: (value) {
                              _onSearchChanged(value);
                            },
                            onChanged: (value) {
                              // if (Responsive.isDesktop(context))
                              // _onSearchChanged(value);
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
                      SizedBox(
                        width: 30,

                      ),
                      InkWell(
                        onTap: () {},
                        child: FaIcon(
                          FontAwesomeIcons.user,
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
        Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: 70,
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Expanded(child: Container(),),

InkWell(
  onTap: (
      ) {
    Scaffold.of(context).openDrawer();
  },

  child: Container(
    padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10)
      ),
    child: Row(
      children: [

        FaIcon(
          FontAwesomeIcons.bars,
        ),
        SizedBox(
          width: 10,
        ),
        Text("Nuestras Categorias",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ],
    ),
  )

),



              SizedBox(
                width: 20,
              ),
              InkWell(
                child:
                Container(
padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(
                    "Catalogos",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                child:
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(
                    "Cotizaciones",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                child:
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(
                    "Consulta de Facturas",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,

                    ),
                  ),
                ),
              ),
              Expanded(child: Container(),),

            ],
          ),
        )
      ],
    );
  }
}

class WebMenu extends StatefulWidget {
  List<articulos> articulo;

  WebMenu({Key key, this.articulo}) : super(key: key);
  @override
  _WebMenuState createState() => _WebMenuState();
}

class _WebMenuState extends State<WebMenu> {
  TextEditingController articuloNombreBusquedaController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: InkWell(
            onTap: () {
              DatabaseProvider.getScreenHome(this.context);
            },
            child: Text.rich(
              TextSpan(
                children: <InlineSpan>[
                  TextSpan(
                      text: ' Inicio',
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              textAlign: TextAlign.center,
              style: GoogleFonts.sourceSansPro(fontSize: 40),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: InkWell(
            onTap: () {
              // DatabaseProvider.getScreenAbout(this.context,widget.articulo);
            },
            child: Text.rich(
              TextSpan(
                children: <InlineSpan>[
                  TextSpan(
                      text: ' Nosotros',
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              textAlign: TextAlign.center,
              style: GoogleFonts.sourceSansPro(fontSize: 40),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProductsScreenWidget(articulo: widget.articulo)));
            },
            child: Text.rich(
              TextSpan(
                children: <InlineSpan>[
                  TextSpan(
                      text: ' Productos',
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              textAlign: TextAlign.center,
              style: GoogleFonts.sourceSansPro(fontSize: 40),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: InkWell(
            onTap: () {
              // DatabaseProvider.getScreenContacto(this.context);
            },
            child: Text.rich(
              TextSpan(
                children: <InlineSpan>[
                  TextSpan(
                      text: ' Contacto',
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              textAlign: TextAlign.center,
              style: GoogleFonts.sourceSansPro(fontSize: 40),
            ),
          ),
        ),
      ],
    );
  }
}

class MobMenu extends StatefulWidget {
  List<articulos> articulo;
  MobMenu({Key key, this.articulo}) : super(key: key);

  @override
  _MobMenuState createState() => _MobMenuState();
}

class _MobMenuState extends State<MobMenu> {
  List<sucursales> sucursal = [];
  SharedPreferences preffs;
  sucursales sucursalSelected;
  TextEditingController articuloNombreBusquedaController =
      TextEditingController(text: '');

  initState() {
    _getSucursal();
  }

  _getSucursal() async {
    preffs = await SharedPreferences.getInstance();

    DatabaseProvider.getSucursales(1).then((value) {
      value.forEach((element) {
        if (element.sucursal.replaceAll(" ", "") ==
            preffs.getString("sucursal")) {
          sucursalSelected = element;
        }
      });
      setState(() {
        sucursal = value;
      });
    });
  }

  _saveSucursal(String sucursal) async {
    preffs = await SharedPreferences.getInstance();
    preffs.setString("sucursal", sucursal.replaceAll(" ", ""));
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Column()],
    );
  }
}

class MenuItems extends StatefulWidget {
  final String title;
  final VoidCallback press;
  final bool isActive;
  const MenuItems({Key key, this.title, this.press, this.isActive = false})
      : super(key: key);

  @override
  _MenuItemsState createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: widget.press,
        onHover: (val) {
          setState(() {
            isHover = val;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: widget.isActive == true
                          ? kPrimaryColor
                          : isHover
                              ? kPrimaryColor
                              : Colors.transparent,
                      width: 4))),
          child: Text(
            widget.title,
            style: GoogleFonts.sourceSansPro(
              fontWeight: widget.isActive == true
                  ? FontWeight.bold
                  : isHover
                      ? FontWeight.bold
                      : FontWeight.normal,
              fontSize: _size.width >= 370 ? 18 : 14,
              color: widget.isActive == true
                  ? kPrimaryColor
                  : isHover
                      ? kPrimaryColor
                      : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class Debouncer {
  final int milliseconds;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
