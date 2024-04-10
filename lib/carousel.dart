import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';
import 'app/text_styles.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatefulWidget {
  Carousel({Key key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  ScrollController scrollController = ScrollController();
  double currentHeight = 0.0;

  List<String> imgList = [
    'assets/APCM_LOGO.png',
    'assets/AROMATIZANTES.png',
    'assets/AUTOLITE.png',
    'assets/AXPRO.jpg',
    'assets/BAWLOGO.jpg',
    'assets/BESTCOOLING.png',
    'assets/CAHSA.jpg',
    'assets/CAUPLAS.png',
    'assets/DORMAN.jpg',
    'assets/erka.jpg',
    'assets/EUROFRICCION.jpg',
    'assets/fuji.png',
    'assets/GARLO.png',
    'assets/GASKET.jpg',
    'assets/GASSERVEI.png',
    'assets/GRCBALATAS.png',
    'assets/GRCLOGO.png',
    'assets/GSP.jpg',
    'assets/HELLAMEX.png',
    'assets/HOAUTOPARTES.jpg',
    'assets/HYPOWER.png',
    'assets/IMLOYA.jpg',
    'assets/INJETECH.png',
    'assets/KANADIAN.png',
    'assets/LODI.jpeg',
    'assets/LUCAS.jpg',
    'assets/MORESA.jpg',
    'assets/MOTORAD.jpg',
    'assets/MULTITOP.jpg',

    'assets/NGK.png',
    'assets/PEAK.jpeg',
    'assets/RACE.jpeg',
    'assets/RALOY.png',
    'assets/RODATECH.png',
    'assets/SAFETY.jpg',
    'assets/SOPORTESSTAR.png',
    'assets/STRUNKER.jpeg',
    'assets/TMP.jpg',
    'assets/TOP-ENGINE.png',
    'assets/TOTALPARTS.png',
    'assets/vehyco.jpg',
    'assets/WD.png',
  ];


  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      setState(() {
        currentHeight = scrollController.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        initialPage: 0,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.2,
      ),
        items: imgList.map((i) => Image.asset(i)
        ).toList(),

    );
  }
}