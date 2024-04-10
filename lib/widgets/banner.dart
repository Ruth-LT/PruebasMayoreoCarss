import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:one_page/backend/database_connect.dart';

import '../constants.dart';
import '../models/bannersModel.dart';

//change the name of class
class HeroBanner extends StatefulWidget {
  const HeroBanner({Key key}) : super(key: key);

  @override
  _HeroBannerState createState() => _HeroBannerState();
}

class _HeroBannerState extends State<HeroBanner> {
  int index = 0;
  List<banner> listaBanners = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBanners();
    }
  _getBanners(){
    DatabaseProvider.getBanners().then((value) {
setState(() {
  listaBanners = value;
});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        CarouselSlider(
            items:[
    SliderCard(
    title: 'Refacciones',
        image: _size.width < _size.height ? "https://aichisa.com.mx/images/abro.png" : "https://aichisa.com.mx/images/abroweb.png",
        press: () {}),
    SliderCard(
    title: 'Refacciones',
    image: _size.width < _size.height ? "https://aichisa.com.mx/images/gates.png" : "https://aichisa.com.mx/images/gatesweb.png",
    press: () {}),
    SliderCard(
    title: 'Refacciones',
    image: _size.width < _size.height ?"https://aichisa.com.mx/images/skf.png" : "https://aichisa.com.mx/images/skfweb.png",
    press: () {}),
    SliderCard(
    title: 'Refacciones',
    image: _size.width < _size.height ? "https://aichisa.com.mx/images/tmk.png" : "https://aichisa.com.mx/images/tmkweb.png",
    press: () {})],

            options: CarouselOptions(
                height: _size.width
                    == 300
                    ? _size.height
                    : _size.width > 700
                        ? _size.width * .29
                        : _size.width  * .55,
                // aspectRatio: 16 / 9,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (int p, CarouselPageChangedReason) {
                  setState(() {
                    index = p;
                  });
                })),
        DotsIndicator(
          dotsCount: 4,
          position: index.toDouble(),
          decorator: DotsDecorator(
            activeColor: kPrimaryColor.withOpacity(0.5),
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        )
      ],
    );
  }
}

class SliderCard extends StatelessWidget {
  const SliderCard({
    Key key,
     this.title,
     this.image,
     this.press,
  }) : super(key: key);
  final String title, image;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(),
      child:

              Image.network(

                image,
                height: _size.width >= 500 ? 400  : 200,
                width: _size.width,
                fit: BoxFit.cover,
              ),
          //   ],
          // )),
      //   ],
      // ),
    );
  }
}
