import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';
import 'app/text_styles.dart';
import 'package:one_page/responsive.dart';

class Dealers2 extends StatefulWidget {
  Dealers2({Key key}) : super(key: key);

  @override
  State<Dealers2> createState() => _Dealers2State();
}

class _Dealers2State extends State<Dealers2> {
  ScrollController scrollController = ScrollController();
  double currentHeight = 0.0;

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
    return Container(
      color: Colors.grey[300],
      width: MediaQuery.of(context).size.width,
      child: Responsive.isMobile(context)
          ? Wrap(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 30),
                  width: Responsive.isMobile(context)
                      ? MediaQuery.of(context).size.width
                      : MediaQuery.of(context).size.width * 0.5,
                  height: Responsive.isMobile(context) ? 300 : 550,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/GSP.jpeg"),
                    )),
                  ),
                ),
                Container(
                  width: Responsive.isMobile(context)
                      ? MediaQuery.of(context).size.width
                      : MediaQuery.of(context).size.width * 0.5,
                  height: Responsive.isMobile(context) ? 300 : 550,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: 30,
                        ),
                        width: 500,
                        height: 80,
                        child: Text(
                          "La pasión por el progreso y la valiente innovación ",
                          style: TextStyle(
                            fontSize: Responsive.isMobile(context) ? 18 : 26,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 30, top: 0, bottom: 0, right: 30),
                        child: Container(
                          padding: EdgeInsets.only(left: 30),
                          width: 500,
                          height: 80,
                          child: Text(
                            "Centenares de patentes han sido registradas para la creación de tecnologías avanzadas ",
                            style: TextStyle(
                              fontSize: Responsive.isMobile(context) ? 15 : 18,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Wrap(
                        children: [
                          InkWell(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: Responsive.isMobile(context) ? 170 : 250,
                              child: Padding(
                                padding: EdgeInsets.only(left: 30, top: 20),
                                child: Container(
                                  width: 160,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                        Color(0xFF020202),
                                      ),
                                    ),
                                    child: Text(
                                      "Conoce Mas",
                                      style:
                                      TextStyle(color: Colors.grey[300]),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: Responsive.isMobile(context) ? 170 : 250,
                              child: Padding(
                                padding: EdgeInsets.only(left: 30, top: 20),
                                child: Container(
                                  width: 160,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                        Colors.white,
                                      ),
                                      side: MaterialStateProperty.all<
                                          BorderSide>(
                                        BorderSide(
                                            color: Colors.grey[300],
                                            width:
                                            2.0), // Set the border color and width
                                      ),
                                    ),
                                    child: Text(
                                      "Ver Productos",
                                      style: TextStyle(
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          : Wrap(
              children: [
                Container(
                  width: Responsive.isMobile(context)
                      ? MediaQuery.of(context).size.width
                      : MediaQuery.of(context).size.width * 0.5,
                  height: Responsive.isMobile(context) ? 300 : 550,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: 30,
                        ),
                        width: 500,
                        height: 80,
                        child: Text(
                          "La pasión por el progreso y la valiente innovación ",
                          style: TextStyle(
                            fontSize: Responsive.isMobile(context) ? 18 : 26,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 30, top: 0, bottom: 0, right: 30),
                        child: Container(
                          padding: EdgeInsets.only(left: 30),
                          width: 500,
                          height: 80,
                          child: Text(
                            "Centenares de patentes han sido registradas para la creación de tecnologías avanzadas ",
                            style: TextStyle(
                              fontSize: Responsive.isMobile(context) ? 15 : 18,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Wrap(
                        children: [
                          InkWell(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: 250,
                              child: Padding(
                                padding: EdgeInsets.only(left: 30, top: 20),
                                child: Container(
                                  width: 160,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                        Color(0xFF020202),
                                      ),
                                    ),
                                    child: Text(
                                      "Conoce Mas",
                                      style:
                                      TextStyle(color: Colors.grey[300]),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: Responsive.isMobile(context) ? 170 : 250,
                              child: Padding(
                                padding: EdgeInsets.only(left: 30, top: 20),
                                child: Container(
                                  width: 160,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                        Colors.white,
                                      ),
                                      side: MaterialStateProperty.all<
                                          BorderSide>(
                                        BorderSide(
                                            color: Colors.grey[300],
                                            width:
                                            2.0), // Set the border color and width
                                      ),
                                    ),
                                    child: Text(
                                      "Ver Productos",
                                      style: TextStyle(
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30),
                  width: Responsive.isMobile(context)
                      ? MediaQuery.of(context).size.width
                      : MediaQuery.of(context).size.width * 0.5,
                  height: Responsive.isMobile(context) ? 300 : 550,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/GSP.jpeg"),
                    )),
                  ),
                ),
              ],
            ),
    );
  }
}
