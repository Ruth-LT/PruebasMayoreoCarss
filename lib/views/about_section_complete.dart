import 'package:one_page/app/fonts.dart';
import 'package:one_page/home.dart';
import '../app/text_styles.dart';
import 'package:flutter_next/flutter_next.dart';
import 'package:flutter/material.dart';
import '../backend/database_connect.dart';
import '../ordered_list.dart';
import 'details_sections.dart';
import 'video_section.dart';

class AboutSectionComplete extends StatelessWidget {
  const AboutSectionComplete({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Color.fromRGBO(255, 255, 255, 0.8),
                  BlendMode.lighten),
              image: AssetImage('assets/hero-bg.jpg'),
              fit: BoxFit.fill)),
      // color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NextRow(
              padding:
                  EdgeInsets.symmetric(horizontal: context.isMobile ? 20 : 40),
              children: [
                NextCol(
                    sizes: 'col-12 col-lg-12',
                    child: Column(
                      children: [


                        NextRow(children: [
                          NextCol(
                            margin: EdgeInsets.only(top: 60),
                              sizes: 'col-12 col-lg-6 col-md-12',
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [

                                  Image.asset('assets/samsung1.jpeg',
                                    fit: BoxFit.cover,
                                    height: 250,),
                                  Image.asset('assets/samsung2.jpeg',
                                    fit: BoxFit.cover,
                                    height: 250,),

                                ],
                              )),

                          NextCol(margin: EdgeInsets.only(top: 20,),
                              sizes: 'col-12 col-lg-6 col-md-12',
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Bienvenido',
                                    style: SectionTitle.h2(context),
                                    textAlign: TextAlign.center,
                                  ),
Padding(padding: EdgeInsets.only(right: 20, top: 50), child:
                                  Text(
                              "Aichisa",
                                    style: h2(context).copyWith(fontWeight: FontWeight.bold, fontSize: 20) ,
                                    textAlign: TextAlign.justify,
                                  ),
                                  ),


                                ],
                              ))
                        ])
                      ],
                    ).fadeIn(
                      initialPosition: 50,
                      variant: NextFadeInVariant.fadeInTop,
                    )),
              ]),
          // const DetailsSection()
          //     .container(padding: const EdgeInsets.symmetric(vertical: 60)),
          // const VideoSection()
        ],
      ).container(padding: const EdgeInsets.only(top: 60)),
    );
  }
}
