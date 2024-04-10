import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:one_page/backend/database_connect.dart';
import 'package:one_page/models/articulosModel.dart';
import 'package:one_page/models/categoriasModel.dart';
import 'package:one_page/productsdisplay.dart';
import 'package:one_page/responsive.dart';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';
import 'videoplayer.dart';
import 'carousel.dart';
import 'dealers2.dart';
import 'dealers.dart';
import 'dealers3.dart';
import 'footer.dart';
import 'products.dart';
import 'navigation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
//import para compartir
import 'package:share_plus/share_plus.dart';

//imports mailer para el envio de correos
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

List<String> list = ['One', 'Two', 'Three', 'Four'];

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

void copyUrl(String urlString) async {
  if (await canLaunch(urlString)) {
    await launch(urlString);
  } else {
    throw 'No se pudo lanzar $urlString';
  }
}

void copyToClipboard(BuildContext context) async {
  String currentUrl = Uri.base.toString();
  await Clipboard.setData(ClipboardData(text: currentUrl));
  final snackBar = SnackBar(
    content: Text('URL copiada al portapapeles: $currentUrl'),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void shareFacebook() async {
  String url = 'http://www.facebook.com/sharer.php?u=www.google.com&title=aaaa';
  if (await canLaunch(url)) {
    // Abrir el enlace
    await launch(url);
  } else {
    print('No se puede abrir Facebook.');
  }
}

void shareX() async {
  String url = 'https://twitter.com/intent/tweet?text=Caracoles%20hervidos%20Calamrdo&url=http://www.google.com';
  if (await canLaunch(url)) {
    // Abrir el enlace
    await launch(url);
  } else {
    print('No se puede abrir X.');
  }
}

void shareWhatsApp() async {
  String url = 'https://api.whatsapp.com/send?text=Caracoles%20hervidos%20Calamardo%20www.google.com';
  if (await canLaunch(url)) {
    // Abrir el enlace
    await launch(url);
  } else {
    print('No se puede abrir whatsApp.');
  }
}

void sendWhatsAppMessage() async {
  String phoneNumber = '6144160599';
  String message = 'Buenos dias!';
  String url = 'https://wa.me/$phoneNumber/?text=${Uri.encodeFull(message)}';
  if (await canLaunch(url)) {
    // Abrir el enlace
    await launch(url);
  } else {
    print('No se puede abrir WhatsApp.');
  }
}

class _HomeState extends State<Home> {

  // ScrollController scrollController = ScrollController();
  // double currentHeight = 0.0;

  TextEditingController contenidoDeCorreoController = TextEditingController();
  String dropdownValue = list.first;

  List<PlutoMenuItem> whiteHoverMenus = [];
  List<categorias> categoriasLista = [];
  List<articulos> ultimosArticulos = [];
  List<articulos> carrito = [];
  bool cargando = true;
  int currentPageIndex = 0;

  //proceso para crear y enviar el correo electronico
  void sendEmail() async {
    /*
    Si el correo es de gmail se necesita activar la verificacion
    en dos pasos en la cuenta de google y una vez dentro
    bajar hasta "contraseñas de aplicaciones" y generar una nueva

   */
    String username = 'crepypaster@gmail.com';
    String password = 'daop lzke llpi tbqy';

    /*
    se utiliza el smtpserver para configurar el
    servidor smtp
  */
    final smtpServer = gmail(username, password);

    /*
    El contenido del mensaje puede llevar
    from
    recipients
    ccrecipients.addAll
    subject
    text
    html
   */
    final message = Message()
      ..from = Address(username, 'Pedrito Sola')
      ..recipients.add('o.garcia.75@icloud.com')
      ..subject = 'Pat a Bob, pat a bob'
      ..text = contenidoDeCorreoController.text;

    try{
      final sendReport = await send(message, smtpServer);
      print('Mensaje enviado: ' + sendReport.toString());
    } on MailerException catch (e){
      print('Mensaje no enviado');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  @override
  void initState() {
    super.initState();

    getCategorias();
    getUltimosArticulos();

    // scrollController.addListener(() {
    //   setState(() {
    //     currentHeight = scrollController.offset;
    //   });
    // });
  }

  getCategorias() {
    DatabaseProvider.getCategorias().then((resultado) {
      try {
        setState(() {
          categoriasLista = resultado;

          List<PlutoMenuItem> itemsCategorias = [];

          categoriasLista.forEach((element) {
            List<PlutoMenuItem> itemsSublineas = [];

            element.sublineas.forEach((sublinea) {
              List<PlutoMenuItem> itemsFamilias = [];

              sublinea.familias.forEach((familia) {
                itemsFamilias.add(PlutoMenuItem(
                    title: familia.nombre_familia,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => productdisplay(
                                categoria: element,
                                sublinea: sublinea,
                                familia: familia,
                                carrito: carrito,
                                whiteHoverMenus: whiteHoverMenus,
                                categoriasLista: categoriasLista,
                                cargando: cargando)));
                  }));
              });

              itemsSublineas.add(PlutoMenuItem(
                title: sublinea.nombre_sublinea,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => productdisplay(
                              categoria: element,
                              sublinea: sublinea,
                              carrito: carrito,
                              whiteHoverMenus: whiteHoverMenus,
                              categoriasLista: categoriasLista,
                              cargando: cargando)));
                },
                children: itemsFamilias,
              ));
            });

            itemsCategorias.add(PlutoMenuItem(
                title: element.nombre_linea,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => productdisplay(
                              categoria: element,
                              carrito: carrito,
                              whiteHoverMenus: whiteHoverMenus,
                              categoriasLista: categoriasLista,
                              cargando: cargando)));
                },
                children: itemsSublineas));
          });

          whiteHoverMenus.add(PlutoMenuItem(
            title: 'Categorias',
            children: itemsCategorias,
          ));

          whiteHoverMenus.addAll(_makeMenus(context));

          cargando = false;
        });
      } catch (error) {}
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      getCategorias();
    });
  }

  getUltimosArticulos() {
    DatabaseProvider.getUltimosArticulos().then((resultado) {
      try {
        setState(() {
          ultimosArticulos = resultado;
        });
      } catch (error) {}
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      getCategorias();
    });
  }

  List<PlutoMenuItem> _makeMenus(BuildContext context) {
    return [
      // PlutoMenuItem(
      //   title: 'Categorias',
      //   children: [
      //     PlutoMenuItem(
      //       title: 'Afinacion',
      //       onTap: () {},
      //       children: [
      //         PlutoMenuItem(
      //           title: 'Cables para  Bujia',
      //           onTap: () {},
      //         ),
      //         PlutoMenuItem(
      //           title: 'Valvulas Pcv ',
      //           onTap: () {},
      //         ),
      //         PlutoMenuItem(
      //           title: 'Lubricantes',
      //           onTap: () {},
      //         ),
      //         PlutoMenuItem(
      //           title: 'FIltro Aceite',
      //           onTap: () {},
      //         ),
      //         PlutoMenuItem(
      //           title: 'Bujias',
      //           onTap: () {},
      //         ),
      //         PlutoMenuItem(
      //           title: 'Filtro de Gasolina',
      //           onTap: () {},
      //         ),
      //         PlutoMenuItem(
      //           title: 'Aditivios',
      //           onTap: () {},
      //         ),
      //         PlutoMenuItem(
      //           title: 'Anticongelantes',
      //           onTap: () {},
      //         ),
      //       ],
      //     ),
      //     PlutoMenuItem(
      //         title: 'Cables de Control de Mando ',
      //         onTap: () {},
      //         children: [
      //           PlutoMenuItem(
      //             title: 'Cable Para Acelerador',
      //             onTap: () {},
      //           ),
      //           PlutoMenuItem(
      //             title: 'Cable Selector de Velocidades',
      //             onTap: () {},
      //           ),
      //           PlutoMenuItem(
      //             title: 'Cable para Embrague',
      //             onTap: () {},
      //           ),
      //           PlutoMenuItem(
      //             title: 'Cable para Freno de Mano',
      //             onTap: () {},
      //           ),
      //           PlutoMenuItem(
      //             title: 'Cable Para Cofre',
      //             onTap: () {},
      //           ),
      //           PlutoMenuItem(
      //             title: 'Cable para Sobre Marcha',
      //             onTap: () {},
      //           ),
      //         ]),
      //     PlutoMenuItem(title: 'Carburacion ', onTap: () {}, children: [
      //       PlutoMenuItem(
      //         title: 'Carburadores',
      //         onTap: () {},
      //       ),
      //       PlutoMenuItem(
      //         title: 'Kem',
      //         onTap: () {},
      //       ),
      //       PlutoMenuItem(
      //         title: 'Carter',
      //         onTap: () {},
      //       ),
      //       PlutoMenuItem(
      //         title: 'Tomco',
      //         onTap: () {},
      //       ),
      //       PlutoMenuItem(
      //         title: 'Varese',
      //         onTap: () {},
      //       ),
      //       PlutoMenuItem(
      //         title: 'Tapon De Gasolina',
      //         onTap: () {},
      //       ),
      //     ]),
      //     PlutoMenuItem(
      //         title: 'Estetica Automotriz ',
      //         onTap: () {},
      //         children: [
      //           PlutoMenuItem(
      //             title: 'Cable Para Acelerador',
      //             onTap: () {},
      //           ),
      //           PlutoMenuItem(
      //             title: 'Cable Selector de Velocidades',
      //             onTap: () {},
      //           ),
      //           PlutoMenuItem(
      //             title: 'Cable para Embrague',
      //             onTap: () {},
      //           ),
      //           PlutoMenuItem(
      //             title: 'Cable para Freno de Mano',
      //             onTap: () {},
      //           ),
      //           PlutoMenuItem(
      //             title: 'Cable Para Cofre',
      //             onTap: () {},
      //           ),
      //           PlutoMenuItem(
      //             title: 'Cable para Sobre Marcha',
      //             onTap: () {},
      //           ),
      //         ]),
      //     PlutoMenuItem(title: 'Fuel Injection ', onTap: () {}, children: [
      //       PlutoMenuItem(
      //         title: 'Kem',
      //         onTap: () {},
      //       ),
      //       PlutoMenuItem(
      //         title: 'Injetech',
      //         onTap: () {},
      //       ),
      //       PlutoMenuItem(
      //         title: 'Uniflow',
      //         onTap: () {},
      //       ),
      //       PlutoMenuItem(
      //         title: 'Bombs Intran',
      //         onTap: () {},
      //       ),
      //     ]),
      //     PlutoMenuItem(
      //         title: 'Herramientas Mecanicas ',
      //         onTap: () {},
      //         children: [
      //           PlutoMenuItem(
      //             title: 'Trupers',
      //             onTap: () {},
      //           ),
      //           PlutoMenuItem(
      //             title: 'Mikels',
      //             onTap: () {},
      //           ),
      //         ]),
      //     PlutoMenuItem(
      //         title: 'Miscelaneos Chromite ',
      //         onTap: () {},
      //         children: [
      //           PlutoMenuItem(
      //             title: 'Chromite ',
      //             onTap: () {},
      //           ),
      //           PlutoMenuItem(
      //             title: 'Lodi',
      //             onTap: () {},
      //           ),
      //           PlutoMenuItem(
      //             title: 'Economico',
      //             onTap: () {},
      //           ),
      //         ]),
      //     PlutoMenuItem(title: 'Motos ', onTap: () {}, children: [
      //       PlutoMenuItem(
      //         title: 'Partes Para Moto',
      //         onTap: () {},
      //       ),
      //     ]),
      //     PlutoMenuItem(title: 'Obsoletos ', onTap: () {}, children: [
      //       PlutoMenuItem(
      //         title: 'Conseguidos',
      //         onTap: () {},
      //       ),
      //     ]),
      //     PlutoMenuItem(
      //         title: 'Partes Clutch/Freno',
      //         onTap: () {},
      //         children: [
      //           PlutoMenuItem(
      //             title: 'Balata Disco',
      //             onTap: () {},
      //           ),
      //           PlutoMenuItem(
      //             title: 'Taf',
      //             onTap: () {},
      //           ),
      //           PlutoMenuItem(
      //             title: 'Ho',
      //             onTap: () {},
      //           ),
      //           PlutoMenuItem(
      //             title: 'Numeros Originales',
      //             onTap: () {},
      //           ),
      //           PlutoMenuItem(
      //             title: 'Lusac',
      //             onTap: () {},
      //           ),
      //           PlutoMenuItem(
      //             title: 'Collarines',
      //             onTap: () {},
      //           ),
      //           PlutoMenuItem(
      //             title: 'Balata Tambor',
      //             onTap: () {},
      //           ),
      //           PlutoMenuItem(
      //             title: 'Kit Clutch',
      //             onTap: () {},
      //           ),
      //           PlutoMenuItem(
      //             title: 'Dorman',
      //             onTap: () {},
      //           ),
      //           PlutoMenuItem(
      //             title: 'Stop',
      //             onTap: () {},
      //           ),
      //         ]),
      //   ],
      // ),
      PlutoMenuItem(
        title: 'Inicio',
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        },
      ),
      // PlutoMenuItem(
      //   title: 'Productos',
      //   onTap: () {
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //             builder: (context) => productdisplay(
      //                 whiteHoverMenus: whiteHoverMenus,
      //                 categoriasLista: categoriasLista,
      //                 cargando: cargando)));
      //   },
      // ),
      // PlutoMenuItem(
      //   title: 'Sucursales',
      //   onTap: () {},
      // ),
      PlutoMenuItem(
        title: 'Conocenos',
        onTap: () {},
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF000000),
          onPressed: () {},
          child: InkWell(
              onTap: () {
                sendWhatsAppMessage();
              },
              child: const Icon(FontAwesomeIcons.whatsapp)), //
        ),
        body: [

          SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: contenidoDeCorreoController,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Escribe algo aquí...',
                    border: InputBorder.none,
                    filled: true,
                  ),
                ),
                ElevatedButton(
                  child: Text('Enviar correo'),
                  onPressed: sendEmail,
                ),
                ElevatedButton(
                  onPressed: () {
                    Share.share('Este es el texto que quiero compartir', subject: 'Asunto del mensaje');
                  },
                  child: Text('Compartir'),
                ),
                ElevatedButton(
                  onPressed: (){
                    shareFacebook();
                  },
                  child: Text('Compartir en facebook'),
                ),
                ElevatedButton(
                  onPressed: (){
                    shareX();
                  },
                  child: Text('Compartir en x'),
                ),
                ElevatedButton(
                  onPressed: (){
                    shareWhatsApp();
                  },
                  child: Text('Compartir en wasa'),
                ),
                ElevatedButton(
                  onPressed: () {
                    copyToClipboard(context);
                  },
                  child: Text('Copiar URL al portapapeles'),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 40),
                  child: const Text(
                    "Bienvenido a Carss Web",
                    style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFFB22B2B),
                        fontFamily: 'Opensans',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Wrap(
                  children: [
                    SizedBox(
                      height: Responsive.car(context) ? 420 : 450,
                      width: Responsive.car(context)
                          ? MediaQuery.of(context).size.width
                          : MediaQuery.of(context).size.width * 0.50,
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(
                                top: 40,
                                left: Responsive.isMobile(context) ? 10 : 0,
                              ),
                              child: Text(
                                "Encuentras las autopartes para tu carro",
                                style: TextStyle(
                                    fontSize: Responsive.isMobile(context)
                                        ? 15
                                        : 20,
                                    color: const Color(0xFF000000),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold),
                              )),
                          Container(
                              width: 420,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(
                                top: 20,
                                left: Responsive.isMobile(context) ? 40 : 0,
                              ),
                              child: Text(
                                "Busqueda por Vehiculo",
                                style: TextStyle(
                                  fontSize: Responsive.isMobile(context)
                                      ? 15
                                      : 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: Responsive.isMobile(context)
                                      ? null
                                      : FontWeight.bold,
                                  color: const Color(0xFF000000),
                                ),
                              )),
                          Container(
                            // color: Colors.greenAccent,
                            padding: const EdgeInsets.all(30),
                            width: 500,
                            height:
                            Responsive.isMobile(context) ? 250 : 300,
                            child: Wrap(
                              spacing: 40,
                              runSpacing: 20,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: Responsive.isMobile(context)
                                          ? 100
                                          : 180,
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        "Año",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF860E0E),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    DropdownMenu<String>(
                                      inputDecorationTheme:
                                      InputDecorationTheme(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2.0,
                                            ),
                                          )),
                                      width: Responsive.isMobile(context)
                                          ? 150
                                          : 200,
                                      initialSelection: list.first,
                                      onSelected: (String value) {
                                        setState(() {
                                          dropdownValue = value;
                                        });
                                      },
                                      dropdownMenuEntries: list
                                          .map<DropdownMenuEntry<String>>(
                                              (String value) {
                                            return DropdownMenuEntry<String>(
                                                value: value, label: value);
                                          }).toList(),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: Responsive.isMobile(context)
                                          ? 100
                                          : 180,
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        "Motor",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF860E0E),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    DropdownMenu<String>(
                                      inputDecorationTheme:
                                      InputDecorationTheme(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2.0,
                                            ),
                                          )),
                                      width: Responsive.isMobile(context)
                                          ? 150
                                          : 200,
                                      initialSelection: list.first,
                                      onSelected: (String value) {
                                        setState(() {
                                          dropdownValue = value;
                                        });
                                      },
                                      dropdownMenuEntries: list
                                          .map<DropdownMenuEntry<String>>(
                                              (String value) {
                                            return DropdownMenuEntry<String>(
                                                value: value, label: value);
                                          }).toList(),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: Responsive.isMobile(context)
                                          ? 100
                                          : 180,
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        "Marca",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF860E0E),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    DropdownMenu<String>(
                                      inputDecorationTheme:
                                      InputDecorationTheme(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2.0,
                                            ),
                                          )),
                                      width: Responsive.isMobile(context)
                                          ? 150
                                          : 200,
                                      initialSelection: list.first,
                                      onSelected: (String value) {
                                        setState(() {
                                          dropdownValue = value;
                                        });
                                      },
                                      dropdownMenuEntries: list
                                          .map<DropdownMenuEntry<String>>(
                                              (String value) {
                                            return DropdownMenuEntry<String>(
                                                value: value, label: value);
                                          }).toList(),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: Responsive.isMobile(context)
                                          ? 100
                                          : 180,
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        "Refaccion",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF860E0E),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    DropdownMenu<String>(
                                      inputDecorationTheme:
                                      InputDecorationTheme(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2.0,
                                            ),
                                          )),
                                      width: Responsive.isMobile(context)
                                          ? 150
                                          : 200,
                                      initialSelection: list.first,
                                      onSelected: (String value) {
                                        setState(() {
                                          dropdownValue = value;
                                        });
                                      },
                                      dropdownMenuEntries: list
                                          .map<DropdownMenuEntry<String>>(
                                              (String value) {
                                            return DropdownMenuEntry<String>(
                                                value: value, label: value);
                                          }).toList(),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: Responsive.isMobile(context)
                                          ? 100
                                          : 180,
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        "Modelo",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF860E0E),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    DropdownMenu<String>(
                                      inputDecorationTheme:
                                      InputDecorationTheme(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                              color: Colors.red,
                                              width: 2.0,
                                            ),
                                          )),
                                      width: Responsive.isMobile(context)
                                          ? 150
                                          : 200,
                                      initialSelection: list.first,
                                      onSelected: (String value) {
                                        setState(() {
                                          dropdownValue = value;
                                        });
                                      },
                                      dropdownMenuEntries: list
                                          .map<DropdownMenuEntry<String>>(
                                              (String value) {
                                            return DropdownMenuEntry<String>(
                                                value: value, label: value);
                                          }).toList(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: Responsive.car(context) ? 370 : 450,
                      width: Responsive.car(context)
                          ? MediaQuery.of(context).size.width
                          : MediaQuery.of(context).size.width * 0.40,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/CarroRefa.png"),
                          )),
                    ),
                  ],
                ),
                const VideoPlayerWidget(
                    videoUrl:
                    "https://mayoreocarss.com.mx/pruebas/VideoAlegria.mp4"),
                Products(
                    carrito: carrito,
                    ultimosArticulos: ultimosArticulos,
                    whiteHoverMenus: whiteHoverMenus,
                    categoriasLista: categoriasLista,
                    cargando: cargando),
                Dealers(),
                Dealers2(),
                Dealers3(),
                Carousel(),
                Footer()
              ],
            ),
          ),
          Dealers2(),
          Dealers3(),
          ][currentPageIndex],
        );
  }
}
