import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../home.dart';

final GoRouter goRouter = GoRouter(

  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (BuildContext context, GoRouterState state) =>
          MaterialPage<void>(key: state.pageKey, child:  Home()),
    ),
    GoRoute(
      path: '/inicio',
      pageBuilder: (BuildContext context, GoRouterState state) =>
          MaterialPage<void>(key: state.pageKey, child:  Home()),
    ),

  ],
  urlPathStrategy: UrlPathStrategy.path,
);
