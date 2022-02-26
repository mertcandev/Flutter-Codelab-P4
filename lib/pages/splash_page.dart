// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p4/classes.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController? donutController;
  Animation<double>? rotationAnimation;

  @override
  void initState() {
    super.initState();
    donutController =
        AnimationController(duration: Duration(seconds: 3), vsync: this)
          ..repeat();

    rotationAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: donutController!, curve: Curves.linear));
  }

  @override
  void dispose() {
    donutController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Utils.mainAppNav.currentState!.pushReplacementNamed('/main');
    });

    return Scaffold(
      backgroundColor: Utils.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RotationTransition(
                turns: rotationAnimation!,
                child: Image.network(Utils.donutLogoWhiteNoText,
                    width: 100, height: 100)),
            Image.network(Utils.donutLogoWhiteText, width: 150, height: 150)
          ],
        ),
      ),
    );
  }
}
