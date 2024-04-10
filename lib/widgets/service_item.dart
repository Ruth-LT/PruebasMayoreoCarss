import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icon.dart';

import '../Screens/Home/products_screen.dart';
import '../app/colors.dart';
import '../app/fonts.dart';
import '../models/lineaModel.dart';
import '../models/service_model.dart';
import 'package:flutter_next/flutter_next.dart';
import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  final Linea lineaModel;
  const ServiceItem({Key key,  this.lineaModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoverWidget(
      builder: (BuildContext context, bool isHovered) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(18, 66, 101, 0.08),
              blurRadius: 15,
              spreadRadius: isHovered ? 10 : 2,
              offset: Offset(
                isHovered ? 2 : 0,
                isHovered ? 6.0 : 2.0,
              ),
            ),
          ],
        ),
        child: InkWell(onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductsScreenWidget(
                    lineas: lineaModel,
                  )));
        },child: Column(
          children: [
            lineaModel.ubicacion_URL!="" ?
            SizedBox(
              width: 250,
              child: Stack(
                children: [
                  Align(
                    child: Image.network(
                      lineaModel.ubicacion_URL,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                  ),

                ],
              ),
            ) :
            Text(
              lineaModel.nombre_linea,
              style: const TextStyle(
                  fontFamily: Fonts.raleway,
                  color: textPrimaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 30),
              textAlign: TextAlign.center,
            ).container(padding: const EdgeInsets.only(top: 10, bottom: 15)),

          ],
        )).container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60)),
      ),
    );
  }
}
