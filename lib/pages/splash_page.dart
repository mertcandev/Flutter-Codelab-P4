// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p4/classes.dart';
import 'package:flutter_codelab_p4/pages/donutshop_main.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => DonutShopMain()));
    });
    
    return Scaffold(
      backgroundColor: Utils.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(Utils.donutLogoWhiteNoText, width: 100, height: 100),
            Image.network(Utils.donutLogoWhiteText, width: 150, height: 150)
          ],
        ),
      ),
    );
  }
}
