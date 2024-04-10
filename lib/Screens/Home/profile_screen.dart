import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_page/Screens/Home/products/contact_section.dart';
import 'package:one_page/Screens/Home/products/sucural_section.dart';
import 'package:one_page/Screens/Home/products_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../backend/database_connect.dart';
import '../../constants.dart';
import '../../home.dart';
import '../../models/articulosModel.dart';
import '../../models/sucursalesModel.dart';
import '../../models/userModel.dart';
import '../../responsive.dart';
import '../../views/contact_section.dart';
import '../../views/footer_section.dart';
import '../../widgets/menu.dart';
import 'products/product_section.dart';

class ProfileScreen extends StatefulWidget {
  List<articulos> articulo;
  List<sucursales> sucurales;
  List<user> usuario;

  ProfileScreen({Key key, this.articulo, this.sucurales, this.usuario})
      : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<articulos> listadeArticulos = [];
  sucursales sucursalSelected;
  TextEditingController emailAddressLoginController;
  TextEditingController passwordLoginController;
  bool passwordLoginVisibility;
  user usuarioFinal;
  SharedPreferences preffs;

  initState() {
    super.initState();
    emailAddressLoginController = TextEditingController();
    passwordLoginController = TextEditingController();
    passwordLoginVisibility = false;
    _getArticulos();

    _currentSession();
  }
  _getHome() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProductsScreenWidget()));
  }
  _currentSession() async {
    preffs = await SharedPreferences.getInstance();
    String usuario = preffs.getString("user");
    String password = preffs.getString("password");
    DatabaseProvider.getUserByEmailPassword(usuario, password).then((value) {
      if (value.status) {
        print("valor de usuario: "+value.usuario.toString());
        // print(json.encode(value));
        preffs.setString("user", emailAddressLoginController.text);
        preffs.setString("password", passwordLoginController.text);

        setState(() {
          usuarioFinal = value;
        });
      } else {

      }
    });
  }
  _closeSession() async {
    preffs = await SharedPreferences.getInstance();
    preffs.setString("user", emailAddressLoginController.text);
    preffs.setString("password", passwordLoginController.text);
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()));
  }

  _initSession() async {
    preffs = await SharedPreferences.getInstance();
    DatabaseProvider.getUserByEmailPassword(
        emailAddressLoginController.text, passwordLoginController.text)
        .then((value) {
      print(value.usuario);
      print(value.nombre_persona);
      if (value.mensaje != "") {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Ocurrio un problema'),
            content: Text(value.mensaje),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        // print(json.encode(value));
        preffs.setString("user", emailAddressLoginController.text);
        preffs.setString("password", passwordLoginController.text);

        Navigator.push(
          context,
            MaterialPageRoute(builder: (context) => Home()));
      }
    }).onError((error, stackTrace) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('ERROR'),
          content:
          const Text('Error de conexión o busqueda en la base de datos'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    });
  }


  _getArticulos() async {
    var preffs = await SharedPreferences.getInstance();
    String sucursal = preffs.getString("sucursal");
    if (sucursal == null) {
      preffs.setString("sucursal", "1");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProfileScreen()));
    }
  }
  // _getSucursalSelected() async {
  //   var preffs = await SharedPreferences.getInstance();
  //
  //   widget.sucurales.forEach((element) {
  //     if (element.sucursal.replaceAll(" ", "") ==
  //         preffs.getString("sucursal")) {
  //       setState(() {
  //         sucursalSelected = element;
  //       });
  //
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DatabaseProvider.menuDrawer(context, widget.articulo, widget.sucurales,  sucursalSelected),
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
                    usuarioFinal==null ?
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height,
                      color: kDarkblueColor,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            MediaQuery.of(context).size.width * .2,
                            0,
                            MediaQuery.of(context).size.width * .2,
                            0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Bienvenido de nuevo, Inicia sesion para realizar un pedido",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont('Poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: MediaQuery.of(context).size.height *.03,
                                    color: kWhiteColor),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: TextFormField(
                                  controller: emailAddressLoginController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Escribe tu usuario',
                                    labelStyle: GoogleFonts.getFont(
                                      'Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: kDarkblueColor,
                                    ),
                                    hintText: 'Escribe tu usuario',
                                    hintStyle: GoogleFonts.getFont(
                                      'Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: kDarkblueColor,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                                    prefixIcon: Icon(
                                      Icons.supervised_user_circle_outlined,
                                      color: kDarkblueColor,
                                      size: 25,
                                    ),
                                  ),
                                  style: GoogleFonts.getFont(
                                    'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                child: TextFormField(
                                  controller: passwordLoginController,
                                  obscureText: !passwordLoginVisibility,
                                  decoration: InputDecoration(
                                    labelText: 'Escribe tu contraseña',
                                    labelStyle: GoogleFonts.getFont(
                                      'Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: kDarkblueColor,
                                    ),
                                    hintText: 'Escribe tu contraseña',
                                    hintStyle: GoogleFonts.getFont(
                                      'Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: kDarkblueColor,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: kDarkblueColor,
                                      size: 25,
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                            () => passwordLoginVisibility =
                                        !passwordLoginVisibility,
                                      ),
                                      child: Icon(
                                        passwordLoginVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: kDarkblueColor,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  style: GoogleFonts.getFont(
                                    'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    _initSession();
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Iniciar Sesión',
                                          style: GoogleFonts.getFont('Poppins',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: kDarkblueColor)),
                                      Icon(Icons.login, color: kDarkblueColor,),
                                    ],
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kWhiteColor,
                                    shape: StadiumBorder(),
                                  ),
                                ),
                              ),
                              Text(
                                "Versión 1.0.1",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont('Poppins',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    color: kWhiteColor),
                              ),
                              Text(
                                "MDS Sistemas",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont('Poppins',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                    color: kWhiteColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )  : Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height,
                      color: kDarkblueColor,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            MediaQuery.of(context).size.width * .2,
                            0,
                            MediaQuery.of(context).size.width * .2,
                            0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Bienvenido de nuevo ¿Deseas salir?",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont('Poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: MediaQuery.of(context).size.height *.03,
                                    color: kWhiteColor),
                              ),

                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    _closeSession();
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Cerrar Sesión',
                                          style: GoogleFonts.getFont('Poppins',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: kDarkblueColor)),
                                      Icon(Icons.logout, color: kDarkblueColor,),
                                    ],
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kWhiteColor,
                                    shape: StadiumBorder(),
                                  ),
                                ),
                              ),
                              Text(
                                "Versión 1.0.1",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont('Poppins',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    color: kWhiteColor),
                              ),
                              Text(
                                "MDS Sistemas",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont('Poppins',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                    color: kWhiteColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ContactSection(

                    ),
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
