// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p4/pages/donutshop_main.dart';
import 'package:flutter_codelab_p4/pages/splash_page.dart';
import 'package:provider/provider.dart';

import 'classes.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => DonutBottomBarSelectionService(),
      ),
      ChangeNotifierProvider(
        create: (_) => DonutService(),
      )
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      navigatorKey: Utils.mainAppNav,
      routes: {
        "/": (context) => SplashPage(),
        "/main": (context) => DonutShopMain()
      },
    ),
  ));
}
