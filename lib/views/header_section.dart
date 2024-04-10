import 'package:go_router/go_router.dart';

import '../app/fonts.dart';
import 'package:flutter_next/flutter_next.dart';
import 'package:flutter/material.dart';

import '../generated/assets.dart';
import '../widgets/navigation_drawer.dart';

class HeaderSection extends StatelessWidget {
  final ScrollController scrollController;
  final List<String> titles;
  final Map<String, GlobalKey> keyList;
  const HeaderSection(
      {Key key,
      this.scrollController,
      this.keyList = const {},
       this.titles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationDrawers(
      padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: context.isMobile ? 20 : context.width * 0.05),
      scrollController: scrollController,
      color: Colors.white,
      childrens: [
        ...titles.map((String e) =>
            HoverWidget(builder: (BuildContext context, bool isHovered) {
              return Text(e,
                      style: TextStyle(
                          fontFamily: Fonts.openSans,
                          fontSize: 14,
                          color: isHovered
                              ? context.primaryColor
                              : const Color(0xFF16507B)))
                  .container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      margin: const EdgeInsets.only(left: 30))
                  .onTap(() {
                if (keyList[e] != null && keyList[e]?.currentContext != null) {
                  Scrollable.ensureVisible(keyList[e].currentContext,
                      duration: const Duration(milliseconds: 300));
                  if (context.width <= 992) {
                    Navigator.pop(context);
                  }
                } else {}
              });
            })),
        NextButton(
          borderRadius: BorderRadius.circular(4),
          color: context.primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          margin: const EdgeInsets.only(left: 30),
          onPressed: () {
            Scrollable.ensureVisible(keyList["Home"]?.currentContext ?? context,
                duration: const Duration(milliseconds: 800),
                curve: Curves.linear);
          },
          child: const Text('Productos'),
          style: const TextStyle(
              fontFamily: Fonts.poppins,
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w300),
        ),
      ],
      leading:  Row(
        children: [
          Image.network(
            'https://pinturaspromex.com/resources/logo.png',
            height: 80,
            fit: BoxFit.fill,
          ),
        ],
      ).onTap(() {
        GoRouter.of(context).push('/');
      }),
    );
  }
}
