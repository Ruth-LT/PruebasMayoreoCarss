import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icon.dart';
import 'package:one_page/app/colors.dart';
import 'package:one_page/app/text_styles.dart';
import 'package:one_page/models/articulosModel.dart';
import 'package:one_page/models/sucursalesModel.dart';
import 'package:one_page/navigation.dart';
import 'package:one_page/registerScreen.dart';
import 'package:one_page/responsive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clay_containers/clay_containers.dart';

import 'backend/database_connect.dart';
import 'home.dart';

class loginScreen extends StatefulWidget {
  final String nombre;
  loginScreen({Key key, this.nombre}) : super(key: key);

  List<articulos> get articulo => null;

  List<sucursales> get sucurales => null;

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  ScrollController scrollController = ScrollController();

  sucursales get sucursalSelected => null;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Wrap(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                      width: constraints.maxWidth,
                      height: 40,
                      padding: EdgeInsets.only(left: 20, top: 10),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(FontAwesomeIcons.circleArrowLeft),
                            color: Color(0xFF001F86),
                            splashRadius:
                                0.1,
                            iconSize: 40,
                            alignment: Alignment.topLeft,
                          ),
                        ],
                      ));
                },
              ),
            ),
            Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Inicia Sesion",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          color: Color(0xFF001F86),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 400,
                      height: 400,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(1000),
                          image: DecorationImage(
                            image: AssetImage("assets/Persona3d.png"),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ],
                )),
            Container(
              padding: EdgeInsets.only(left: 100, right: 100),
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClayContainer(
                    color: Colors.grey,
                    borderRadius: 40,
                    depth: 60,
                    emboss: true,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.user, color: Colors.white, size: 25),
                          SizedBox(width: 20),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Tu Correo',
                                hintStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ClayContainer(
                    color: Colors.grey,
                    borderRadius: 40,
                    depth: 60,
                    emboss: true,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.user, color: Colors.white, size: 25),
                          SizedBox(width: 20),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Tu Contraseña',
                                hintStyle: TextStyle(color: Colors.white,fontSize: 15),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ClayContainer(
                    color:
                        Color(0xFF001F86),
                    borderRadius: 30,
                    depth: 40,
                    child: InkWell(
                      child: Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          width: 300,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Color(0xFF001F86),
                              borderRadius: BorderRadius.circular(100)),
                          child: Text(
                            "Iniciar Sesion",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "¿No tienes una cuenta?",
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            _registerPageRouteBuilder(),
                          );
                        },
                        child: Text(
                          " Registrate",
                          style: TextStyle(
                              color: Color(0xFF001F86),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

PageRouteBuilder _registerPageRouteBuilder() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return registerScreen();
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}
