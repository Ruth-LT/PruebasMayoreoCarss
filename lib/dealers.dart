import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';
import 'app/text_styles.dart';
import 'package:one_page/responsive.dart';

class Dealers extends StatefulWidget {
  Dealers({Key key}) : super(key: key);

  @override
  State<Dealers> createState() => _DealersState();
}

class _DealersState extends State<Dealers> {
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
      child: Wrap(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
            width: Responsive.isMobile(context)
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width * 0.5,
            height: Responsive.isMobile(context) ? 300 : 550,
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/Baw.jpeg"),
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
                  padding: const EdgeInsets.only(
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
                  padding:
                      const EdgeInsets.only(left: 30, top: 0, bottom: 0, right: 30),
                  child: Container(
                    padding: const EdgeInsets.only(left: 30),
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
                        width: Responsive.isMobile(context) ? 150 : 250,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, top: 20),
                          child: Container(
                            width: 160,
                            height: 40,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all<Color>(
                                  const Color(0xFF020202),
                                ),
                              ),
                              child: Text(
                                "Conoce Mas",
                                style: TextStyle(color: Colors.grey[300]),
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
                          padding: const EdgeInsets.only(left: 30, top: 20),
                          child: Container(
                            width: 160,
                            height: 40,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all<Color>(
                                  Colors.white,
                                ),
                                side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(
                                      color: Colors.grey[300],
                                      width:
                                      2.0), // Set the border color and width
                                ),
                              ),
                              child: const Text(
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
      ),
    );
  }
}
