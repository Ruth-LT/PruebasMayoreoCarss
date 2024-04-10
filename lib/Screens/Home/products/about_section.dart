import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../backend/database_connect.dart';
import '../../../constants.dart';
import '../../../models/articulosModel.dart';
import '../../../models/detalleCarritoModel.dart';
import '../../../models/detallePedidoModel.dart';
import '../../../models/familiasModel.dart';
import '../../../models/lineaModel.dart';
import '../../../models/pedidoModel.dart';
import '../../../models/sublineaModel.dart';
import '../../../responsive.dart';
import '../categories_screen.dart';
import '../detalleproducto_screen.dart';

class AboutSectionWidget extends StatefulWidget {
  final Sublinea sublineaActual;
  final Linea lineaActual;
  final Familias familia;
  final List<articulos> articulo;
  const AboutSectionWidget(
      {Key key,
      this.sublineaActual,
      this.lineaActual,
      this.articulo,
      this.familia})
      : super(key: key);

  ProductSection createState() => ProductSection();
}

class ProductSection extends State<AboutSectionWidget> {
  //Your code here
  int countPages = 1;
  int countProducts = 0;
  TextEditingController busquedaController;
  List<Pedido> pedidosCliente = [];
  List<detallePedido> detallesPedidos = [];
  List<articulos> articulosLista = [];
  List<Sublinea> sublineaLista = [];
  List<Linea> lineaLista = [];
  List<detalleCarrito> detalleCarritoList = [];
  double totalOrden = 0.0;
  bool busqueda;

  @override
  void initState() {
    super.initState();
    // _getCategorias();
    // _getUltimosCuatro();
  }

  // _getCategorias() {
  //   DatabaseProvider.getSublineas(widget.sublineaActual.linea).then((lineasResult) {
  //     setState(() {
  //       sublineaLista = lineasResult;
  //     });
  //   });
  // }

  //
  // _getUltimosCuatro() {
  //   print(widget.sublineaActual.sublinea);
  //   DatabaseProvider.getArticulosPaginaSublinea(1,20,countPages, int.parse(widget.familia.familia)).then((articulosResult) {
  //     setState(() {
  //       articulosLista = articulosResult;
  //     });
  //   });
  //   print(articulosLista.length);
  // }

  @override
  Widget build(BuildContext context) {
    bool isHover = false;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 20,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(

                  child: Image.network(
                    DatabaseProvider.ABOUTIMAGE,
                    height: 400,
                    width: 400,
                    fit: BoxFit.contain,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace stackTrace) {
                      return Image.network(
                        DatabaseProvider.PLACEHOLDER,
                        height: 400,
                        width: 400,
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child:  Container(
                  width: Responsive.isDesktop(context)
                      ? MediaQuery.of(context).size.width * .4
                      : MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,

                    // borderRadius: BorderRadius.circular(20),
                    // border: Border.all(
                    //     color: kgreyColor, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 20,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          // decoration: const BoxDecoration(
                          //     border: Border(
                          //         bottom: BorderSide(color: kSecondaryColor, width: 3))),
                          child: Text(
                            "Nosotros",
                            maxLines: 2,
                            style: GoogleFonts.sourceSansPro(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Nuestra empresa fue fundada en 1978 iniciando operaciones en un "
                              "pequeño establecimiento en la Ciudad de Puebla dos años mas "
                              "tarde cambio sus instalaciones al municipio de Tlalnepantla "
                              "en el Estado de México a partir de ese momento ha experimentado"
                              " un crecimiento constante hasta ubicarnos en más de 5,000 m2"
                              " donde fabricamos pinturas y recubrimientos arquitectónicos,"
                              " industriales, automotivos y otras especialidades que se "
                              "comercializan a todo lo largo de nuestro país a través de más "
                              "de 200 distribuidores, tiendas de autoservicios y tiendas propias."
                              " Actualmente el Grupo cuenta con tres plantas ubicadas en el Estado de México, Chihuahua y Guerrero."
                              " \n \n A demás tenemos centros de distribución en Chihuahua, Chih, Cd. Juárez Chih, Hermosillo, Guadalajara"
                              " Jalisco., Tlalnepantla, Córdoba Ver, Puebla Pue., Ciudad de México, Iguala Gro., Tlaxcala, León Gto., "
                              "Cuajimalpa, Zumpango, Sinaloa, Morelia, Tuxtla Gutiérrez, Villahermosa, San Luis Potosí, Tampico, Tamaulipas, "
                              "entre muchos otros.\n \n Para el año 2007 buscamos afianzar nuestra capacidad comercial por medio una cadena sólida "
                              "de distribución basada en Bodegas directas de fábrica, distribuidores Master, distribuidores exclusivos, "
                              "minoristas y puntos de venta.\n \nNuestra planta tiene una capacidad de producción de 12 millones de litros "
                              "anuales respaldada siempre por un estricto control de calidad tanto de materias primas como de producto terminado."
                              " Con el compromiso de todos los que formamos parte de la gran familia PROMEX seguimos día a día trabajando para"
                              " lograr nuestra visión la cual fue establecida pensando en la satisfacción de nuestros clientes y en mantener un"
                              "\n \nCrecimiento sostenido que nos permita estar siempre en la mente de los consumidores",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 200,

                          style: GoogleFonts.sourceSansPro(
                              fontSize: 18, fontWeight: FontWeight.w600, ),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]);
  }
}
