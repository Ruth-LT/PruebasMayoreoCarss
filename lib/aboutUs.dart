import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:one_page/models/articulosModel.dart';
import 'package:one_page/models/sucursalesModel.dart';
import 'package:one_page/widgets/menu.dart';

import 'backend/database_connect.dart';
import 'home.dart';
import 'nuevos.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  List<articulos> get articulo => null;

  List<sucursales> get sucurales => null;

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  ScrollController scrollController = ScrollController();

  sucursales get sucursalSelected => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[150],
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .5,
              height: MediaQuery.of(context).size.height,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .5,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
