import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:one_page/home.dart';
import 'package:one_page/menu.dart';
import 'package:one_page/models/categoriasModel.dart';
import 'package:one_page/responsive.dart';
import 'package:one_page/views/about_section.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Screens/Home/categories_screen.dart';
import '../Screens/Home/contact_screen.dart';
import '../Screens/Home/ourcompany_screen.dart';
import '../Screens/Home/products_screen.dart';
import '../models/altaProveedorModel.dart';
import '../models/articulosModel.dart';
import '../models/bannersModel.dart';
import '../models/ciudadesModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/clasesProveedoresModel.dart';
import '../models/detallePedidoModel.dart';
import '../models/familiasModel.dart';
import '../models/lineaModel.dart';
import '../models/ordenCompletadaModel.dart';
import '../models/ordenesBusquedaModel.dart';
import '../models/pedidoModel.dart';
import '../models/proveedoresModel.dart';
import '../models/sublineaModel.dart';
import '../models/sucursalesModel.dart';
import '../models/userModel.dart';

class DatabaseProvider {
  static const ROOT =
      "https://alleatoapps.com/apis/MayoreoCarssApi/mayoreo_carss.php/";
  static const ROOTCATEGORIAS = "categorias";
  static const ROOTULTIMOS = "ultimos_articulos";
  static const ROOTARTICULOS = "articulos_pagina";

  static const ROOTLOGIN = ROOT + "login";
  static const ROOTGETARTICULOS = ROOT + "articulos/";
  static const ROOTSUCURSALES = ROOT + "combo_sucursales/%20%20%20%20%20%201";
  static const ROOTGETLINEAS = ROOT + "lineas/";
  static const ROOTGETULTIMASCUATRO = ROOT + "ultimos_articulos/";
  static const ROOTPAGINASNECESARIAS = ROOT + "paginas_necesarias/";
  static const ROOTPAGINASARTICULOS = ROOT + "articulos_pagina/";
  static const ROOTPAGINASARTICULOSSUBLINEA =
      ROOT + "articulos_pagina_sublinea/";
  static const ROOTBUSQUEDA = ROOT + "buscador_articulos/";
  static const ROOTSUBLINEAS = ROOT + "sublineas/";
  static const ROOTBANNERS =
      "https://pinturaspromex.com/api2/api.get_banners_web.php";
  static const ROOTFAMILIAS = ROOT + "familias";
  static const ROOTGETPEDIDOS = ROOT + "pedidos_cliente/";
  static const ROOTBUSCAORDENES = ROOT + "busca_ordenes";
  static const ROOTCONSULTAORDEN = ROOT + "consulta_orden";
  static const ROOTGUARDAORDEN = ROOT + "guarda_pedido";
  static const ROOTGUARDPROVEEDOR = ROOT + "guarda_proveedor";
  static const ROOTDATOSCOMBO = ROOT + "datos_combos";

  static const ROOTResources = "https://pinturaspromex.com/resources/";
  static const LOGO = ROOTResources + "logo.png";
  static const PLACEHOLDER = ROOTResources + "no-img-placeholder.png";
  static const LOADER = ROOTResources + "loading.gif";
  static const INICIOCONTACTO = ROOTResources + "contactinicio.png";
  static const ABOUTIMAGE = ROOTResources + "about.png";

  static SharedPreferences preffs;

  static getScreenProductos(BuildContext contexto, List<articulos> articulod) {
    Navigator.push(
        contexto,
        MaterialPageRoute(
            builder: (context) => ProductsScreenWidget(
                  articulo: articulod,
                )));
  }

  static getScreenAbout(BuildContext contexto, List<articulos> articulod) {
    Navigator.push(
        contexto,
        MaterialPageRoute(
            builder: (context) => OurCompanyScreen(
                  articulo: articulod,
                )));
  }

  static getScreenHome(BuildContext contexto) {
    Navigator.push(contexto, MaterialPageRoute(builder: (context) => Home()));
  }

  static getScreenContacto(BuildContext contexto) {
    Navigator.push(
        contexto, MaterialPageRoute(builder: (context) => ContactScreen()));
  }

  static AboutSectioon(BuildContext contexto) {
    Navigator.push(
        contexto, MaterialPageRoute(builder: (context) => AboutSection()));
  }

  static getCategoriesScreen(
      BuildContext contexto, Linea newValue, List<articulos> articulo) {
    Navigator.push(
        contexto,
        MaterialPageRoute(
            builder: (context) => CategoriesScreen(
                  lineaActual: newValue,
                  articulo: articulo,
                )));
  }

  static MenuArticulos(BuildContext contexto) {
    Navigator.push(contexto, MaterialPageRoute(builder: (context) => Menu()));
  }

  static Casa(BuildContext contexto) {
    Navigator.push(contexto, MaterialPageRoute(builder: (context) => Home()));
  }

  // static Nosotros(BuildContext contexto) {
  //   Navigator.push(
  //       contexto, MaterialPageRoute(builder: (context) => about()));
  // }

  static menuDrawer(BuildContext contexto, List<articulos> articulo,
      List<sucursales> sucursal, sucursales sucursalSelected) {
    getSucursales(1).then((value) => sucursal = value);
    return Drawer(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                MenuArticulos(contexto);
              },
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  'Menu',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Casa(contexto);
              },
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "Balatas",
                  style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                MenuArticulos(contexto);
              },
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "Suspensiones",
                  style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "Baterias",
                  style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Baleros",
                  style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            InkWell(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Aceites",
                  style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            InkWell(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Power",
                  style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            InkWell(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Crucetas",
                  style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static menuSpaceWeb(context) {
    return Responsive.isDesktop(context) ? 80 : 300;
  }

  static canLaunchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

//----------------------------------------------------------
// SECTION OF LOGIN
//----------------------------------------------------------

//obtener usuario mediante email y password
  static Future<user> getUserByEmailPassword(
      String usuario, String password) async {
    Map data = {'correo': usuario, 'contrasena': password};
    //encode Map to JSON
    var body = json.encode(data);
    // print(data);
    var response = await http.post(Uri.parse(ROOTLOGIN),
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "https://pinturaspromex.com",
          'Access-Control-Allow-Credentials': 'true'
        },
        body: body);
    if (response.statusCode == 200) {
      // print(response.body);
      user list = user.fromJson(json.decode(response.body));

      return list;
    } else {
      throw <user>[];
    }
  }

  static List<user> parseUser(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<user>((json) => user.fromJson(json)).toList();
  }

//----------------------------------------------------------
// END SECTION OF LOGIN
//----------------------------------------------------------

//----------------------------------------------------------
// SECTION OF SEARCH ARTICLES
//----------------------------------------------------------
  //************************ API PHP ************************
  static Future<List<categorias>> getCategorias() async {
    Map data = {'action': ROOTCATEGORIAS};
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.post(Uri.parse(ROOT),
        headers: {"Content-Type": "application/json"}, body: body);
    if (response.statusCode == 200) {
      // print(response.body);

      List<categorias> categoriasLista =
          parseCategorias(json.decode(response.body));

      return categoriasLista;
    } else {
      throw <user>[];
    }
  }

  static List<categorias> parseCategorias(Map<String, dynamic> responseBody) {
    List<dynamic> detallesjson = responseBody['categorias'];
    return detallesjson
        .map<categorias>((json) => categorias.fromJson(json))
        .toList();
  }

  static Future<List<articulos>> getUltimosArticulos() async {
    Map data = {'action': ROOTULTIMOS, 'sucursal': 1};
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.post(Uri.parse(ROOT),
        headers: {"Content-Type": "application/json"}, body: body);
    if (response.statusCode == 200) {
      // print(response.body);

      List<articulos> lista = parseUltimosArticulos(json.decode(response.body));

      return lista;
    } else {
      throw <user>[];
    }
  }

  static List<articulos> parseUltimosArticulos(
      Map<String, dynamic> responseBody) {
    List<dynamic> detallesjson = responseBody['articulos'];
    return detallesjson
        .map<articulos>((json) => articulos.fromJson(json))
        .toList();
  }

  static Future<List<articulos>> getArticulos(double intervalo, int pagina, int linea, String sublinea, String familia) async {
    Map data = {
      'action': ROOTARTICULOS,
      'sucursal': 1,
      'intervalo': intervalo,
      'pagina': pagina,
      'linea': linea,
      'sublinea': sublinea,
      'familia': familia
    };
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.post(Uri.parse(ROOT),
        headers: {"Content-Type": "application/json"}, body: body);
    if (response.statusCode == 200) {
      print(response.body);

      List<articulos> lista = parseUltimosArticulos(json.decode(response.body));

      return lista;
    } else {
      throw <user>[];
    }
  }

  //************************ API JS ************************
  static _saveSucursal(String sucursal, BuildContext context) async {
    preffs = await SharedPreferences.getInstance();
    preffs.setString("sucursal", sucursal.replaceAll(" ", ""));
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  static Future<List<articulos>> getArticles(int cliente) async {
    preffs = await SharedPreferences.getInstance();
    String sucursal = preffs.getString("sucursal");

    Map data = {
      // 'orden': num_orden
    };
    //encode Map to JSON
    var body = json.encode(data);
    var response =
        await http.get(Uri.parse(ROOTGETARTICULOS + sucursal), headers: {
      "Content-Type": "application/json",
      "Access-Control-Request-Headers": "https://pinturaspromex.com",
      "Access-Control-Request-Method": "GET, DELETE, HEAD, OPTIONS",
    });
    if (response.statusCode == 200) {
      //print(response.body);
      List<articulos> articulo = parseArticles(json.decode(response.body));
      return articulo;
    } else {
      throw <user>[];
    }
  }

  static Future<List<sucursales>> getSucursales(int cliente) async {
    Map data = {
      // 'orden': num_orden
    };
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.get(Uri.parse(ROOTSUCURSALES), headers: {
      "Content-Type": "application/json",
      "Access-Control-Request-Headers": "https://pinturaspromex.com",
      "Access-Control-Request-Method": "GET, DELETE, HEAD, OPTIONS",
    });
    if (response.statusCode == 200) {
      print(response.body);
      List<sucursales> articulo = parseSucursales(json.decode(response.body));
      return articulo;
    } else {
      throw <user>[];
    }
  }

//obtener usuario mediante email y password
  static Future<List<Linea>> getLineas(int cliente) async {
    Map data = {
      // 'orden': num_orden
    };
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.get(Uri.parse(ROOTGETLINEAS), headers: {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "https://pinturaspromex.com",
      'Access-Control-Allow-Credentials': 'true'
    });
    if (response.statusCode == 200) {
      //print(response.body);
      List<Linea> linea = parseLineas(json.decode(response.body));
      return linea;
    } else {
      throw <user>[];
    }
  }

  //obtener usuario mediante email y password
  static Future<List<articulos>> getUltimosCuatro() async {
    preffs = await SharedPreferences.getInstance();
    String sucursal = preffs.getString("sucursal");
    print('AHORA SI SUCURSAL::: $sucursal');
    Map data = {'sucursal': sucursal};
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.get(
        Uri.parse(
          ROOTGETULTIMASCUATRO + sucursal,
        ),
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "https://pinturaspromex.com",
          'Access-Control-Allow-Credentials': 'true'
        });
    if (response.statusCode == 200) {
      //
      print("RESPONSE BODY ULTIMOS 4   ::: " + response.body);
      List<articulos> linea = parseArticles(json.decode(response.body));
      return linea;
    } else {
      throw <user>[];
    }
  }

  //obtener usuario mediante email y password
  static Future<List<Sublinea>> getSublineas(String lineas) async {
    Map data = {'linea': int.parse(lineas)};
    //encode Map to JSON
    var body = json.encode(data);
    //print('BODY DE SUBLINEA'+body);
    var response = await http.post(Uri.parse(ROOTSUBLINEAS),
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "https://pinturaspromex.com",
          'Access-Control-Allow-Credentials': 'true'
        },
        body: body);
    if (response.statusCode == 200) {
      //print(response.body);
      List<Sublinea> linea = parseSublineas(json.decode(response.body));
      List<Sublinea> sublineas = [];
      linea.forEach((element) {
        //print(element.linea.trimLeft());
        if (element.linea.trimLeft() == lineas) {
          sublineas.add(element);
        }
      });
      return sublineas;
    } else {
      throw <user>[];
    }
  }

  static Future<List<Familias>> getFamilias(String sublineasactual) async {
    Map data = {'sublinea': sublineasactual};
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.post(Uri.parse(ROOTFAMILIAS),
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "https://pinturaspromex.com",
          'Access-Control-Allow-Credentials': 'true'
        },
        body: body);
    if (response.statusCode == 200) {
      // print("Numero de sublinea actual :::: ${sublineasactual}");
      List<Familias> linea = parseFamilias(json.decode(response.body));
      List<Familias> sublineas = [];
      linea.forEach((element) {
        //print(element.sublinea.trimLeft());
        if (element.sublinea.trimLeft() == sublineasactual) {
          //print("Entre Aqui con ::::: ${sublineasactual}");
          sublineas.add(element);
        }
      });
      return sublineas;
    } else {
      throw <user>[];
    }
  }

  //obtener usuario mediante email y password
  static Future<List<articulos>> getArticulosPagina(int sucursal, int intervalo,
      int pagina, String sublinea, String linea, String familia) async {
    preffs = await SharedPreferences.getInstance();
    String sucursal = preffs.getString("sucursal");
    Map data = {
      'sucursal': sucursal,
      'intervalo': intervalo,
      'pagina': pagina,
      'linea': linea,
      'sublinea': sublinea,
      'familia': familia,
    };
    //encode Map to JSON
    var body = json.encode(data);
    //print('BODY DE ARTICULOS '+ body);
    // print(ROOTPAGINASARTICULOS);
    var response = await http.post(Uri.parse(ROOTPAGINASARTICULOS),
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "https://pinturaspromex.com",
          'Access-Control-Allow-Credentials': 'true'
        },
        body: body);
    //print(response.body);
    if (response.statusCode == 200) {
      List<articulos> linea = parseArticles(json.decode(response.body));
      return linea;
    } else {
      throw <user>[];
    }
  } //obtener usuario mediante email y password

  static Future<List<articulos>> getArticulosPaginaSublinea(
      int sucursal, int intervalo, int pagina, int sublinea) async {
    preffs = await SharedPreferences.getInstance();
    String sucursal = preffs.getString("sucursal");
    Map data = {
      'sucursal': sucursal,
      'intervalo': intervalo,
      'pagina': pagina,
      'sublinea': sublinea
    };
    //encode Map to JSON
    var body = json.encode(data);
    //print(data);
    // print(ROOTPAGINASARTICULOSSUBLINEA);
    var response = await http.post(Uri.parse(ROOTPAGINASARTICULOSSUBLINEA),
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "https://pinturaspromex.com",
          'Access-Control-Allow-Credentials': 'true'
        },
        body: body);
    // print(response.body);
    if (response.statusCode == 200) {
      List<articulos> linea = parseArticles(json.decode(response.body));
      return linea;
    } else {
      throw <user>[];
    }
  }

  static Future<List<articulos>> getBuscarFlutter(String busqueda) async {
    preffs = await SharedPreferences.getInstance();
    String sucursal = preffs.getString("sucursal");
    Map data = {'sucursal': sucursal, 'busqueda': busqueda};
    //encode Map to JSON
    var body = json.encode(data);
    // print(data);
    // print(ROOTBUSQUEDA);
    var response = await http.post(Uri.parse(ROOTBUSQUEDA),
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "https://pinturaspromex.com",
          'Access-Control-Allow-Credentials': 'true'
        },
        body: body);
    //print(response.body);
    if (response.statusCode == 200) {
      List<articulos> linea = parseArticles(json.decode(response.body));
      return linea;
    } else {
      throw <user>[];
    }
  }

  static List<articulos> parseArticles(Map<String, dynamic> responseBody) {
    List<dynamic> detallesjson = responseBody['articulos'];
    return detallesjson
        .map<articulos>((json) => articulos.fromJson(json))
        .toList();
  }

  static List<sucursales> parseSucursales(Map<String, dynamic> responseBody) {
    List<dynamic> detallesjson = responseBody['sucursales'];
    return detallesjson
        .map<sucursales>((json) => sucursales.fromJson(json))
        .toList();
  }

  static List<Sublinea> parseSublineas(Map<String, dynamic> responseBody) {
    List<dynamic> detallesjson = responseBody['sublineas'];
    return detallesjson
        .map<Sublinea>((json) => Sublinea.fromJson(json))
        .toList();
  }

  static List<Familias> parseFamilias(Map<String, dynamic> responseBody) {
    List<dynamic> detallesjson = responseBody['familias'];
    return detallesjson
        .map<Familias>((json) => Familias.fromJson(json))
        .toList();
  }

  static List<Linea> parseLineas(Map<String, dynamic> responseBody) {
    List<dynamic> detallesjson = responseBody['lineas'];
    return detallesjson.map<Linea>((json) => Linea.fromJson(json)).toList();
  }

//----------------------------------------------------------
// END SECTION OF SEARCH ARTICLES
//----------------------------------------------------------
  //----------------------------------------------------------
// SECTION OF LOGIN
//----------------------------------------------------------

//obtener usuario mediante email y password
  static Future<String> postOrden(int cliente, double subtotal, double total,
      String articulos, String comentarios) async {
    preffs = await SharedPreferences.getInstance();
    String sucursal = preffs.getString("sucursal");

    //print(detalles);
    Map data = {
      'cliente': cliente,
      'sucursal': sucursal,
      'subtotal': subtotal,
      'total': total,
      'articulos': articulos,
      'comentarios': comentarios,
    };
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.post(Uri.parse(ROOTGUARDAORDEN),
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "https://pinturaspromex.com",
          'Access-Control-Allow-Credentials': 'true'
        },
        body: body);
    if (response.statusCode == 200) {
      // print(response.body);

      return "completado";
    } else {
      throw <user>[];
    }
  }

  static List<ordencompleta> parseOrdenCompleta(
      Map<String, dynamic> responseBody) {
    List<dynamic> detallesjson = responseBody[''];
    return detallesjson
        .map<ordencompleta>((json) => ordencompleta.fromJson(json))
        .toList();
  }

//----------------------------------------------------------
// END SECTION OF LOGIN
//----------------------------------------------------------

//----------------------------------------------------------
// SECTION OF SEARCH PROVIDER
//----------------------------------------------------------

//obtener usuario mediante email y password
  static Future<List<proveedores>> getProvedores() async {
    Map data = {
      // 'orden': num_orden
    };
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.get(Uri.parse(ROOTDATOSCOMBO), headers: {
      "Content-Type": "application/json",
      "Access-Control-Request-Headers": "https://pinturaspromex.com",
      "Access-Control-Request-Method": "GET, DELETE, HEAD, OPTIONS"
    });
    if (response.statusCode == 200) {
      //print(response.body);
      List<proveedores> resultado =
          parseProveedores(json.decode(response.body));

      return resultado;
    } else {
      throw <proveedores>[];
    }
  }

  static List<proveedores> parseProveedores(Map<String, dynamic> responseBody) {
    List<dynamic> detallesjson = responseBody['proveedores'];
    return detallesjson
        .map<proveedores>((json) => proveedores.fromJson(json))
        .toList();
  }

//obtener usuario mediante email y password
  static Future<List<banner>> getBanners() async {
    Map data = {
      // 'orden': num_orden
    };
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.get(Uri.parse(ROOTBANNERS), headers: {
      "Content-Type": "application/json",
      "Access-Control-Request-Headers": "https://pinturaspromex.com",
      "Access-Control-Request-Method": "GET, DELETE, HEAD, OPTIONS"
    });
    if (response.statusCode == 200) {
      //print(response.body);
      List<banner> resultado = parseBanners(json.decode(response.body));

      return resultado;
    } else {
      throw <proveedores>[];
    }
  }

  static List<banner> parseBanners(Map<String, dynamic> responseBody) {
    List<dynamic> detallesjson = responseBody['banners'];
    return detallesjson.map<banner>((json) => banner.fromJson(json)).toList();
  }

//----------------------------------------------------------
// END SECTION OF SEARCH PROVIDER
//----------------------------------------------------------

//----------------------------------------------------------
// SECTION OF SEARCH BUSCAORDENES
//----------------------------------------------------------

//obtener usuario mediante email y password
  static Future<List<ordenesBusqueda>> getOrdenes(String sucursal,
      String proveedor, DateTime fdesde, DateTime fhasta) async {
    preffs = await SharedPreferences.getInstance();
    String sucursal = preffs.getString("sucursal");
    Map data = {
      "sucursal": sucursal,
      "proveedor": proveedor,
      "fecha_desde": fdesde.toString(),
      "fecha_hasta": fhasta.toString()
    };
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.post(Uri.parse(ROOTBUSCAORDENES),
        headers: {"Content-Type": "application/json"}, body: body);
    if (response.statusCode == 200) {
      //print(response.body);
      List<ordenesBusqueda> resultado =
          parseOrdenesBusqueda(json.decode(response.body));

      return resultado;
    } else {
      throw <proveedores>[];
    }
  }

  static List<ordenesBusqueda> parseOrdenesBusqueda(
      Map<String, dynamic> responseBody) {
    List<dynamic> detallesjson = responseBody['ordenes_compra'];
    return detallesjson
        .map<ordenesBusqueda>((json) => ordenesBusqueda.fromJson(json))
        .toList();
  }

//----------------------------------------------------------
// END SECTION OF SEARCH BUSCAORDENES
//----------------------------------------------------------

//----------------------------------------------------------
// SECTION OF SEARCH CIUDADES
//----------------------------------------------------------

//obtener usuario mediante email y password
  static Future<List<ciudades>> getCiudades() async {
    Map data = {
      // 'orden': num_orden
    };
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.get(Uri.parse(ROOTDATOSCOMBO));
    if (response.statusCode == 200) {
      //print(response.body);
      List<ciudades> resultado = parseCiudades(json.decode(response.body));

      return resultado;
    } else {
      throw <user>[];
    }
  }

  static List<ciudades> parseCiudades(Map<String, dynamic> responseBody) {
    List<dynamic> detallesjson = responseBody['ciudades'];
    return detallesjson
        .map<ciudades>((json) => ciudades.fromJson(json))
        .toList();
  }

//----------------------------------------------------------
// END SECTION OF SEARCH CIUDADES
//----------------------------------------------------------
//----------------------------------------------------------
// SECTION OF SEARCH CLASE DE PROVEEDOR
//----------------------------------------------------------

//obtener usuario mediante email y password
  static Future<List<claseProvedor>> getClase() async {
    Map data = {
      // 'orden': num_orden
    };
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.get(Uri.parse(ROOTDATOSCOMBO));
    if (response.statusCode == 200) {
      //print(response.body);
      List<claseProvedor> resultado = parseClase(json.decode(response.body));

      return resultado;
    } else {
      throw <claseProvedor>[];
    }
  }

  static List<claseProvedor> parseClase(Map<String, dynamic> responseBody) {
    List<dynamic> detallesjson = responseBody['clases_proveedores'];
    return detallesjson
        .map<claseProvedor>((json) => claseProvedor.fromJson(json))
        .toList();
  }

//----------------------------------------------------------
// END SECTION OF SEARCH CLASE DE PROVEEDOR
//----------------------------------------------------------
//----------------------------------------------------------
// SECTION OF POST ORDEN
//----------------------------------------------------------

//obtener usuario mediante email y password
  static Future<List<altaProveedor>> postProveedor(
      altaProveedor proveedor) async {
    Map data = {
      "sucursal": proveedor.sucursal,
      "comprador": proveedor.comprador,
      "clase": proveedor.clase,
      "ciudad": proveedor.sucursal,
      "nombre": proveedor.nombre,
      "rfc": proveedor.rfc,
      "tax_id": proveedor.tax_id,
      "calle": proveedor.calle,
      "no_exterior": proveedor.no_exterior,
      "no_interior": proveedor.no_interior,
      "colonia": proveedor.colonia,
      "codigo_postal": proveedor.codigo_postal,
      "entre_calles": proveedor.entre_calles,
      "area": proveedor.area,
      "telefono": proveedor.telefono,
      "extension": proveedor.extension,
      "nombre_contacto": proveedor.nombre_contacto,
      "apellido_contacto": proveedor.apellido_contacto,
      "tipo_contacto": proveedor.tipo_contacto,
      "correo": proveedor.correo,
      "puesto": proveedor.puesto,
      "proveedor": proveedor.proveedor,
    };
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.post(Uri.parse(ROOTGUARDPROVEEDOR),
        headers: {"Content-Type": "application/json"}, body: body);
    if (response.statusCode == 200) {
      //print(response.body);
      List<altaProveedor> resultado =
          parseAltaProveedor(json.decode(response.body));

      return resultado;
    } else {
      throw <ordencompleta>[];
    }
  }

  static List<altaProveedor> parseAltaProveedor(
      Map<String, dynamic> responseBody) {
    List<dynamic> detallesjson = responseBody['orden_compra'];
    return detallesjson
        .map<altaProveedor>((json) => altaProveedor.fromJson(json))
        .toList();
  }

//----------------------------------------------------------
// END SECTION OF POST ORDEN
//----------------------------------------------------------
//----------------------------------------------------------
// SECTION OF SEARCH CLASE DE PROVEEDOR
//----------------------------------------------------------

//obtener usuario mediante email y password
  static Future<List<dynamic>> getPedidos(String usuario) async {
    Map data = {
      // 'orden': num_orden
    };
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.get(Uri.parse(ROOTGETPEDIDOS + usuario));
    if (response.statusCode == 200) {
      //print(response.body);
      List<dynamic> _resultado = [];
      List<Pedido> pedidos = parsePedidos(json.decode(response.body));
      List<detallePedido> detallePedidos =
          parseDetallePedidos(json.decode(response.body));
      _resultado.add(pedidos);
      _resultado.add(detallePedidos);
      return _resultado;
    } else {
      throw <claseProvedor>[];
    }
  }

  static List<Pedido> parsePedidos(Map<String, dynamic> responseBody) {
    List<dynamic> detallesjson = responseBody['pedidos'];
    return detallesjson.map<Pedido>((json) => Pedido.fromJson(json)).toList();
  }

  static List<detallePedido> parseDetallePedidos(
      Map<String, dynamic> responseBody) {
    List<dynamic> detallesjson = responseBody['detalles_pedidos'];
    return detallesjson
        .map<detallePedido>((json) => detallePedido.fromJson(json))
        .toList();
  }

//----------------------------------------------------------
// END SECTION OF SEARCH CLASE DE PROVEEDOR
//----------------------------------------------------------
}
