import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:one_page/Screens/Home/products/contact_section.dart';
import 'package:one_page/Screens/Home/products/sucural_section.dart';
import 'package:one_page/Screens/Home/products_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../backend/database_connect.dart';
import '../../constants.dart';
import '../../home.dart';
import '../../models/articulosModel.dart';
import '../../models/detalleCarritoModel.dart';
import '../../models/sucursalesModel.dart';
import '../../models/userModel.dart';
import '../../responsive.dart';
import '../../views/contact_section.dart';
import '../../views/footer_section.dart';
import '../../widgets/menu.dart';
import 'products/product_section.dart';

class CarritoScreen extends StatefulWidget {
  List<articulos> articulo;
  List<sucursales> sucurales;
  List<user> usuario;

  CarritoScreen({Key key, this.articulo, this.sucurales, this.usuario})
      : super(key: key);

  @override
  _CarritoScreenState createState() => _CarritoScreenState();
}

class _CarritoScreenState extends State<CarritoScreen> {
  List<articulos> listadeArticulos = [];
  List<detalleCarrito> detalleCarritos;
  user usuarioFinal;
  SharedPreferences preffs;
  sucursales sucursalSelected;


  initState() {
    super.initState();

    _currentSession();
  }
  _getHome() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProductsScreenWidget()));
  }
  _currentSession() async {
    preffs = await SharedPreferences.getInstance();
    List<String> carrito = preffs.getStringList("carrito");

    carrito.forEach((element) {
      print(element);
      setState(() {
        if(detalleCarritos==null){
          detalleCarritos = [];
        }
        detalleCarritos.add(detalleCarrito.fromJson(json.decode(element)));
      });
    });
    DatabaseProvider.getSucursales(1).then((value) {
      value.forEach((element) {
        if (element.sucursal.replaceAll(" ", "") ==
            preffs.getString("sucursal")) {
          sucursalSelected = element;

        }
      });
      setState(() {
        widget.sucurales = value;
      });
    });
  }

  _deleteFromCarrito(int index) async {
    List<String> carritoFinal = [];
    detalleCarritos.removeAt(index);
    detalleCarritos.forEach((element) {
      String jsonUser = jsonEncode(element);
      carritoFinal.add(jsonUser);
    });
    preffs = await SharedPreferences.getInstance();
    preffs.setStringList("carrito", carritoFinal);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CarritoScreen()));
  }
  _enviarPedido() async {
    preffs = await SharedPreferences.getInstance();
    String usuario = preffs.getString("user");
    String password = preffs.getString("password");
    double totalOrden = 0.0;
    String splitArticulos  = "";
    detalleCarritos.forEach((element) {
      totalOrden = totalOrden + element.total;
      splitArticulos = splitArticulos +
          element.clave_articulo.toString() + "|" +
          element.cantidad.toString()+"|"+
          element.precio_base.toString()+"|"+
          element.precio_base.toString()+"|"+
          element.total.toString()+"|"+
          element.total.toString()+"Ç";
    });
    DatabaseProvider.getUserByEmailPassword(usuario, password).then((value) {
      if (value.status) {
        print("valor de usuario: "+value.usuario.toString());
        // print(json.encode(value));
        setState(() {
          usuarioFinal = value;
        });

        DatabaseProvider.postOrden(usuarioFinal.usuario,totalOrden,totalOrden,splitArticulos,"").then((value) {
          preffs.setStringList("carrito",[]);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Home()));
        });
      } else {

      }
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DatabaseProvider.menuDrawer(context, widget.articulo, widget.sucurales, sucursalSelected),
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

                    detalleCarritos!=null ?
                    Container(

                        alignment: Alignment.topCenter,
                        height: MediaQuery.of(context).size.height,
                        color: kDarkblueColor,
                        child:
                        Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                MediaQuery.of(context).size.width * .2,
                                0,
                                MediaQuery.of(context).size.width * .2,
                                0),
                            child: SingleChildScrollView(
                                child:
                                Column(
                                  children: <Widget>[
                                    ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: detalleCarritos.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, listViewIndex) {

                                          return Padding(
                                              padding:
                                              EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  0, 10, 0, 10),
                                              child: Container( decoration: BoxDecoration(
                                                  color: kWhiteColor,
                                                  borderRadius:
                                                  BorderRadius.all(Radius.circular(30))), child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            12, 0, 12, 0),
                                                        child: Container(
                                                          height:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                              0.1,
                                                          decoration: BoxDecoration(
                                                              color: Colors.white,
                                                              borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                      30))),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                            child: Image.network(
                                                              detalleCarritos[listViewIndex].ubicacion_URL!= null ? detalleCarritos[listViewIndex].ubicacion_URL : "",
                                                              fit: BoxFit.cover, errorBuilder: (BuildContext context,  Object exception, StackTrace stackTrace) {

                                                              return Image.asset("assets/products/iPhone/iphone1.jpeg",
                                                                  fit: BoxFit.cover
                                                              );
                                                            },
                                                              loadingBuilder: (BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                                                                if (loadingProgress == null) return child;
                                                                return Image.asset("assets/products/iPhone/iphone1.jpeg",
                                                                    fit: BoxFit.cover
                                                                );
                                                              },),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          alignment:
                                                          AlignmentDirectional
                                                              .centerStart,
                                                          // width:
                                                          // MediaQuery.of(context).size.width * .6,
                                                          child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                    detalleCarritos[listViewIndex]
                                                                        .nombre_articulo,
                                                                    maxLines: 2,
                                                                    textAlign:
                                                                    TextAlign.start,
                                                                    overflow: TextOverflow
                                                                        .ellipsis,
                                                                    style: GoogleFonts.getFont(
                                                                      'Poppins',
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                      fontSize: 15,
                                                                      color: kDarkblueColor,)
                                                                ),
                                                                Text(detalleCarritos[listViewIndex].cantidad.toString(),
                                                                    textAlign:
                                                                    TextAlign.start,
                                                                    style: GoogleFonts.getFont(
                                                                      'Poppins',
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                      fontSize: 15,
                                                                      color: kDarkblueColor,
                                                                    )
                                                                )
                                                              ]),
                                                        ),
                                                      ),
                                                      Container(
                                                        // width:
                                                        // MediaQuery.of(context).size.width * 0.7,
                                                        alignment:
                                                        AlignmentDirectional
                                                            .center,
                                                        height: 80,
                                                        child: Text(
                                                          "\$"+NumberFormat("#,###,##0.00").format(detalleCarritos[listViewIndex].total),
                                                          style: GoogleFonts.getFont(
                                                              'Poppins',
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              fontSize: 15,
                                                              color: kDarkblueColor),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            12, 0, 12, 0),child:Container(
                                                        // width:
                                                        // MediaQuery.of(context).size.width * 0.7,
                                                        height: 80,
                                                        child: InkWell (
                                                          onTap: (){
                                                            _deleteFromCarrito(listViewIndex);
                                                          },
                                                          child: Icon(
                                                            Icons.delete,
                                                            color:
                                                            kDarkblueColor,
                                                          ),
                                                        ),
                                                      ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                              )
                                          )
                                          ;
                                        }),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          _enviarPedido();
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text('Enviar pedido ',
                                                style: GoogleFonts.getFont('Poppins',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: kDarkblueColor)),
                                            Icon(Icons.send, color: kDarkblueColor,),
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
                                )
                            )
                        )
                    )

                        : Container(
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(10, 15, 10, 0),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [Image.network(
                                      "https://aichisa.com.mx/images/empty-cart.png",
                                      width: 250,
                                    ),]
                                ),
                              ),

                              Text(
                                "No se encontro nada en el carrito",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont('Poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: MediaQuery.of(context).size.height *.03,
                                    color: kWhiteColor),
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
