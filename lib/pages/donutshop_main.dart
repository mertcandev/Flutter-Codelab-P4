// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p4/classes.dart';
import 'package:flutter_codelab_p4/widgets/donutbottombar.dart';
import 'package:flutter_codelab_p4/widgets/donutmainpage.dart';
import 'package:flutter_codelab_p4/widgets/donutsidemenu.dart';

class DonutShopMain extends StatelessWidget {
  const DonutShopMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: DonutSideMenu(),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Utils.mainDark),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Image.network(Utils.donutLogoRedText, width: 120),
        ),
        body: Column(
          children: [
            Expanded(
              child: Navigator(
                initialRoute: "/main",
                key: Utils.mainListNav,
                onGenerateRoute: (RouteSettings settings) {
                  Widget page;

                  switch (settings.name) {
                    case "/main":
                      page = DonutMainPage();
                      break;
                    case "/favorites":
                      page = Center(child: Text("favorites"));
                      break;
                    case "/shoppingcart":
                      page = Center(child: Text("shopping cart"));
                      break;
                    default:
                      page = Center(child: Text("main"));
                      break;
                  }
                  return PageRouteBuilder(
                      pageBuilder: (_, __, ___) => page,
                      transitionDuration: Duration(seconds: 0));
                },
              ),
            ),
            DonutBottomBar()
          ],
        ));
  }
}
