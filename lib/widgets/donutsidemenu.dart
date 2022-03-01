// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p4/classes.dart';

class DonutSideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Utils.mainDark,
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: EdgeInsets.only(top: 40),
                child: Image.network(Utils.donutLogoWhiteNoText, width: 100)),
            Image.network(Utils.donutLogoWhiteText, width: 150)
          ],
        ));
  }
}
