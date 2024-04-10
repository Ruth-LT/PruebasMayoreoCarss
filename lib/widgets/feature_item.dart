import 'package:flutter_next/flutter_next.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_page/models/articulosModel.dart';

import '../Screens/Home/detalleproducto_screen.dart';
import '../app/colors.dart';
import '../app/text_styles.dart';
import '../backend/database_connect.dart';
import '../models/feature_model.dart';

class FeatureItem extends StatefulWidget {
  final FeatureModel feature;
  final articulos articulo;
  const FeatureItem({Key key,  this.feature, this.articulo}) : super(key: key);

  @override
  State<FeatureItem> createState() => _FeatureItemState();
}

class _FeatureItemState extends State<FeatureItem>
    with TickerProviderStateMixin {
   AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HoverWidget(
        hoverDuration: Duration.zero,
        builder: (BuildContext context, bool isHovered) {
          if (isHovered) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
          return ScaleTransition(
            scale: Tween(begin: 1.0, end: 1.08).animate(_controller),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 700),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromRGBO(18, 66, 101, 0.08),
                    blurRadius: 15,
                    spreadRadius: isHovered ? 10 : 5,
                    offset: Offset(
                      2.0,
                      isHovered ? 6.0 : 2.0,
                    ),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: InkWell(onTap: (){
          Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) => DetalleProductoScreenWidget(
          articuloActual: widget.articulo,
          )));
          },child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      widget.articulo.foto_articulo!=null ? widget.articulo.foto_articulo: '',
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context,
                          Object
                          exception,
                          StackTrace
                          stackTrace) {
                        return Image.network(
                          DatabaseProvider
                              .PLACEHOLDER,
                          fit:
                          BoxFit.contain
                          ,height: 100,);
                      },
                    ).container(
                      height: 150 ,
                        padding: const EdgeInsets.only(top: 10, bottom: 20)),
                    Text(
                      widget.articulo.nombre_articulo!= null ? widget.articulo.nombre_articulo : '',
                      style: a(context).copyWith(
                          color: isHovered
                              ? context.primaryColor
                              : textPrimaryColor),
                    ).container(padding: const EdgeInsets.only(bottom: 15)),
                    Text(
                      widget.articulo.precio_base!= null ? "\$${NumberFormat("#,###,##0.00").format(widget.articulo.precio_base)}": '',
                      style: a(context).copyWith(
                          color: isHovered
                              ? context.primaryColor
                              : textPrimaryColor),
                    ).container(padding: const EdgeInsets.only(bottom: 15)),
                    Text(
                        "Existencias : ${widget.articulo.disponible}",
                      style: a(context).copyWith(
                          color: isHovered
                              ? context.primaryColor
                              : textPrimaryColor),
                    ).container(padding: const EdgeInsets.only(bottom: 15)),
                    // Text(widget.feature.description)
                  ]),
            ),
            ),
          );
        });
  }
}