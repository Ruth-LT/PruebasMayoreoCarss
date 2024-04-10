import '../app/fonts.dart';
import 'package:flutter_next/flutter_next.dart';
import 'package:flutter/material.dart';

import '../services/url_service.dart';

class CTASection extends StatelessWidget {
  const CTASection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
child: Column(
  children: [
    Container(
      color: Colors.red,
    ),
    Container(
      child: Row(
        children: [
          Expanded(child: Container(),),
          Container( color: Colors.blue,),
          SizedBox(
            width: 30,
          ),
          Container(),
          SizedBox(
            width: 30,
          ),
          Container(),
          Expanded(child: Container(),),
        ],
      ),
    )

  ],
),
    );
  }
}
