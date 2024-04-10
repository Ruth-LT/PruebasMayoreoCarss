import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:one_page/backend/database_connect.dart';
import 'package:one_page/home.dart';
import 'package:one_page/loginScreen.dart';
import 'package:one_page/models/articulosModel.dart';
import 'package:one_page/models/categoriasModel.dart';
import 'package:one_page/productdescription.dart';
import 'package:one_page/productsdisplay.dart';
import 'package:one_page/registerScreen.dart';
import 'package:one_page/responsive.dart';
import 'package:one_page/shoppingscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';
import 'app/text_styles.dart';

class Navigation extends StatefulWidget {
  List<articulos> carrito;
  List<PlutoMenuItem> whiteHoverMenus;
  List<categorias> categoriasLista;
  bool cargando;
  Navigation(
      {Key key,
      this.carrito,
      this.whiteHoverMenus,
      this.categoriasLista,
      this.cargando})
      : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.notifications_sharp)),
            label: 'Notifications',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.messenger_sharp),
            ),
            label: 'Messages',
          ),
        ],
      ),
      body: [
        /// Home page
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'Home page',
              ),
            ),
          ),
        ),

        /// Notifications page
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 1'),
                  subtitle: Text('This is a notification'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 2'),
                  subtitle: Text('This is a notification'),
                ),
              ),
            ],
          ),
        ),

        /// Messages page
        ListView.builder(
          reverse: true,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Hello',
                  ),
                ),
              );
            }
            return Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Hi!',

                ),
              ),
            );
          },
        ),
      ][currentPageIndex],
    );
  }

  //@override
  // Widget build(BuildContext context) {
  //   return Container(
  //     color: Colors.grey,
  //     child: Column(
  //       children: [
  //         Container(
  //             alignment: Alignment.center,
  //             padding: EdgeInsets.only(
  //                 left: Responsive.isMobile(context)
  //                     ? 10
  //                     : MediaQuery.of(context).size.width * 0.1,
  //                 right: Responsive.isMobile(context)
  //                     ? 10
  //                     : MediaQuery.of(context).size.width * 0.1,
  //                 top: Responsive.isMobile(context) ? 15 : 20,
  //                 bottom: 20),
  //             width: MediaQuery.of(context).size.width,
  //             color: const Color(0xFF111111),
  //             child: Row(
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   InkWell(
  //                     child: (MediaQuery.of(context).size.width) >= 1000
  //                         ? Row(
  //                             children: const [
  //                               Text(
  //                                 "Siguenos en : ",
  //                                 style: TextStyle(
  //                                   color: Color(0xFFFFFFFF),
  //                                   fontFamily: 'Poppins',
  //                                 ),
  //                               ),
  //                               SizedBox(
  //                                 width: 10,
  //                               ),
  //                               FaIcon(
  //                                 FontAwesomeIcons.facebook,
  //                                 color: Color(0xFFAFAFAF),
  //                               ),
  //                             ],
  //                           )
  //                         : Row(
  //                             children: const [
  //                               FaIcon(
  //                                 FontAwesomeIcons.facebook,
  //                                 color: Color(0xFFAFAFAF),
  //                               ),
  //                             ],
  //                           ),
  //                   ),
  //                   const SizedBox(
  //                     width: 5,
  //                   ),
  //                   const InkWell(
  //                     child: Text(
  //                       "Contactanos",
  //                       style: TextStyle(
  //                         color: Color(0xFFFFFFFF),
  //                         fontFamily: 'Poppins',
  //                       ),
  //                     ),
  //                   ),
  //                   const SizedBox(
  //                     width: 10,
  //                   ),
  //                   Expanded(
  //                     child: Container(),
  //                   ),
  //                   Container(
  //                     child: InkWell(
  //                       onTap: () {
  //                         Navigator.of(context).push(_createRoute1());
  //                       },
  //                       child: Row(
  //                         children: [
  //                           (MediaQuery.of(context).size.width) >= 1000
  //                               ? Row(children: const [
  //                                   FaIcon(
  //                                     FontAwesomeIcons.circleUp,
  //                                     color: Color(0xFFAFAFAF),
  //                                   ),
  //                                   SizedBox(
  //                                     width: 5,
  //                                   ),
  //                                   Text(
  //                                     "Registrate",
  //                                     style: TextStyle(
  //                                       color: Color(0xFFFFFFFF),
  //                                       fontFamily: 'Poppins',
  //                                     ),
  //                                   ),
  //                                 ])
  //                               : Row(children: const [
  //                                   FaIcon(
  //                                     FontAwesomeIcons.plus,
  //                                     color: Color(0xFFAFAFAF),
  //                                   ),
  //                                   SizedBox(
  //                                     width: 5,
  //                                   ),
  //                                   Text(
  //                                     "",
  //                                     style: TextStyle(
  //                                       color: Color(0xFF3F3F3F),
  //                                     ),
  //                                   ),
  //                                 ]),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   const SizedBox(
  //                     width: 20,
  //                   ),
  //                   Container(
  //                     child: InkWell(
  //                       onTap: () {
  //                         Navigator.of(context).push(_createRoute());
  //                       },
  //                       child: Row(
  //                         children: [
  //                           (MediaQuery.of(context).size.width) >= 1000
  //                               ? Row(children: const [
  //                                   FaIcon(
  //                                     FontAwesomeIcons.rightToBracket,
  //                                     color: Color(0xFFAFAFAF),
  //                                   ),
  //                                   SizedBox(
  //                                     width: 5,
  //                                   ),
  //                                   Text(
  //                                     "Inicia Sesion",
  //                                     style: TextStyle(
  //                                       color: Color(0xFFFFFFFF),
  //                                       fontFamily: 'Poppins',
  //                                     ),
  //                                   ),
  //                                 ])
  //                               : Row(children: const [
  //                                   FaIcon(
  //                                     FontAwesomeIcons.rightToBracket,
  //                                     color: Color(0xFFAFAFAF),
  //                                   ),
  //                                   SizedBox(
  //                                     width: 5,
  //                                   ),
  //                                   Text(
  //                                     "",
  //                                     style: TextStyle(
  //                                       color: Color(0xFF3F3F3F),
  //                                     ),
  //                                   ),
  //                                 ]),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ])),
  //         Container(
  //           color: Colors.white,
  //           child: Column(
  //             children: [
  //               Container(
  //                   width: MediaQuery.of(context).size.width,
  //                   // height: MediaQuery.of(context).size.height * .1,
  //                   color: Colors.transparent,
  //                   child: Padding(
  //                     padding: EdgeInsets.only(
  //                         left: Responsive.isMobile(context)
  //                             ? 10
  //                             : MediaQuery.of(context).size.width * 0.1,
  //                         right: Responsive.isMobile(context)
  //                             ? 10
  //                             : MediaQuery.of(context).size.width * 0.1,
  //                         top: 15,
  //                         bottom: 20),
  //                     child: Row(
  //                       children: [
  //                         InkWell(
  //                           onTap: () {
  //                             Navigator.push(
  //                                 context,
  //                                 MaterialPageRoute(
  //                                     builder: (context) => Home()));
  //                           },
  //                           child: Container(
  //                             width: 100,
  //                             height: 35,
  //                             decoration: const BoxDecoration(
  //                                 image: DecorationImage(
  //                               image: AssetImage("assets/LogoMayoreo.jpg"),
  //                             )),
  //                           ),
  //                         ),
  //                         const SizedBox(
  //                           width: 20,
  //                         ),
  //                         Expanded(
  //                           child: Container(
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(50.0),
  //                               boxShadow: [
  //                                 BoxShadow(
  //                                   color: Colors.grey.withOpacity(0.5),
  //                                   spreadRadius: 2,
  //                                   blurRadius: 5,
  //                                   offset: Offset(0, 3),
  //                                 ),
  //                               ],
  //                               color: Colors.white,
  //                             ),
  //                             child: TextField(
  //                               decoration: InputDecoration(
  //                                 hintStyle: TextStyle(
  //                                   color: Colors.black,
  //                                   fontSize:
  //                                       Responsive.isMobile(context) ? 13 : 15,
  //                                   fontFamily: 'Poppins',
  //                                 ),
  //                                 hintText: "Buscar Articulo",
  //                                 labelStyle: const TextStyle(
  //                                   color: Colors.black,
  //                                   fontSize: 15,
  //                                 ),
  //                                 border: OutlineInputBorder(
  //                                   borderRadius: BorderRadius.circular(50),
  //                                   borderSide: const BorderSide(
  //                                     width: 0,
  //                                     style: BorderStyle.none,
  //                                   ),
  //                                 ),
  //                                 filled: true,
  //                                 contentPadding: const EdgeInsets.symmetric(
  //                                     vertical: 15, horizontal: 20),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                         const SizedBox(
  //                           width: 10,
  //                         ),
  //                         Container(
  //                           child: InkWell(
  //                               child: Row(
  //                             children: [
  //                               (MediaQuery.of(context).size.width) >= 1000
  //                                   ? Row(children: const [
  //                                       FaIcon(
  //                                         FontAwesomeIcons.opencart,
  //                                         color: Color(0xFF000000),
  //                                       ),
  //                                       SizedBox(
  //                                         width: 5,
  //                                       ),
  //                                       Text(
  //                                         "Busqueda por vehiculo",
  //                                         style: TextStyle(
  //                                           color: Color(0xFF000000),
  //                                           fontFamily: 'Poppins',
  //                                         ),
  //                                       ),
  //                                     ])
  //                                   : Row(children: const [
  //                                       FaIcon(
  //                                         FontAwesomeIcons.carSide,
  //                                         color: Color(0xFF0E0E0E),
  //                                       ),
  //                                       SizedBox(
  //                                         width: 5,
  //                                       ),
  //                                       Text(
  //                                         "",
  //                                         style: TextStyle(
  //                                           color: Color(0xFF000000),
  //                                         ),
  //                                       ),
  //                                     ]),
  //                             ],
  //                           )),
  //                         ),
  //                         const SizedBox(
  //                           width: 10,
  //                         ),
  //                         Container(
  //                           child: InkWell(
  //                               onTap: () {
  //                                 Navigator.push(
  //                                     context,
  //                                     MaterialPageRoute(
  //                                         builder: (context) => Shoppingscreen(
  //                                             carrito: widget.carrito,
  //                                             whiteHoverMenus:
  //                                                 widget.whiteHoverMenus,
  //                                             categoriasLista:
  //                                                 widget.categoriasLista,
  //                                             cargando: widget.cargando)));
  //                               },
  //                               child: Row(
  //                                 children: [
  //                                   (MediaQuery.of(context).size.width) >= 1000
  //                                       ? Row(children: const [
  //                                           FaIcon(
  //                                             FontAwesomeIcons.cartShopping,
  //                                             color: Color(0xFF020202),
  //                                           ),
  //                                           SizedBox(
  //                                             width: 5,
  //                                           ),
  //                                           Text(
  //                                             "Mi Carrito",
  //                                             style: TextStyle(
  //                                               color: Color(0xFF050505),
  //                                               fontFamily: 'Poppins',
  //                                             ),
  //                                           ),
  //                                         ])
  //                                       : Row(children: const [
  //                                           FaIcon(
  //                                             FontAwesomeIcons.cartShopping,
  //                                             color: Color(0xFF000000),
  //                                           ),
  //                                           SizedBox(
  //                                             width: 5,
  //                                           ),
  //                                           Text(
  //                                             "",
  //                                             style: TextStyle(
  //                                               color: Color(0xFF000000),
  //                                             ),
  //                                           ),
  //                                         ]),
  //                                 ],
  //                               )),
  //                         ),
  //                         // Expanded(child: Container(),),
  //                       ],
  //                     ),
  //                   )),
  //               Container(
  //                 margin: const EdgeInsets.only(bottom: 18),
  //                 height: 20,
  //                 color: Colors.transparent,
  //                 child: Row(
  //                   children: [
  //                     Expanded(
  //                       flex: Responsive.isMobile(context) ? 0 : 1,
  //                       child: Container(
  //                         color: Colors.transparent,
  //                       ),
  //                     ),
  //                     Expanded(
  //                       flex: 4,
  //                       child: widget.cargando
  //                           ? LinearProgressIndicator(
  //                               color: Colors.red[800],
  //                               backgroundColor: Colors.blue[800],
  //                             )
  //                           : PlutoMenuBar(
  //                               itemStyle: PlutoMenuItemStyle(
  //                                 textStyle: TextStyle(
  //                                   color: const Color(0xFF000000),
  //                                   fontSize:
  //                                       Responsive.isMobile(context) ? 12 : 15,
  //                                 ),
  //                               ),
  //                               height: 30,
  //                               backgroundColor: Colors.white,
  //                               borderColor: Colors.transparent,
  //                               mode: PlutoMenuBarMode.hover,
  //                               menus: widget.whiteHoverMenus,
  //                             ),
  //                     ),
  //                     Expanded(
  //                       flex: Responsive.isMobile(context) ? 0 : 1,
  //                       child: Container(
  //                         color: Colors.transparent,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => loginScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _createRoute1() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => registerScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
