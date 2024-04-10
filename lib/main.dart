import 'dart:io';
import 'package:flutter/material.dart';
import 'app/router.dart';
import 'app/theme.dart';
import 'videoplayer.dart';
import 'package:http/http.dart';
import 'dart:convert';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HttpOverrides.global = new MyHttpOverrides();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Mayoreo Carss Web',
      theme: themeData(context),
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

