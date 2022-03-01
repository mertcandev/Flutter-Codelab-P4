// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_equal_for_default_values

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p4/classes.dart';
import 'package:flutter_codelab_p4/widgets/donutshoppingcartbadge.dart';
import 'package:provider/provider.dart';

class DonutShopDetails extends StatefulWidget {
  @override
  State<DonutShopDetails> createState() => _DonutShopDetailsState();
}

class _DonutShopDetailsState extends State<DonutShopDetails>
    with SingleTickerProviderStateMixin {
  DonutModel? selectedDonut;
  AnimationController? controller;
  Animation<double>? rotationAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: const Duration(seconds: 20), vsync: this)
          ..repeat();

    rotationAnimation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.linear));
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DonutService donutService =
        Provider.of<DonutService>(context, listen: false);
    selectedDonut = donutService.getSelecteDonut();

    return Scaffold(
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Utils.mainDark),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: SizedBox(
                width: 120, child: Image.network(Utils.donutLogoRedText)),
            actions: [DonutShoppingCartBadge()]),
        body: Column(children: [
          Container(
              height: MediaQuery.of(context).size.height / 2,
              child: Stack(clipBehavior: Clip.none, children: [
                Positioned(
                  top: -40,
                  right: -120,
                  child: Hero(
                      tag: selectedDonut!.name!,
                      child: RotationTransition(
                          turns: rotationAnimation!,
                          child: Image.network(selectedDonut!.imgUrl!,
                              width: MediaQuery.of(context).size.width * 1.25,
                              fit: BoxFit.contain))),
                )
              ])),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(
                      child: Text(selectedDonut!.name!,
                          style: TextStyle(
                              color: Utils.mainDark,
                              fontSize: 30,
                              fontWeight: FontWeight.bold))),
                  SizedBox(width: 50),
                  IconButton(
                      icon: Icon(Icons.favorite_outline),
                      color: Utils.mainDark,
                      onPressed: () {})
                ]),
                SizedBox(height: 10),
                Container(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Utils.mainDark,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text('\$${selectedDonut!.price!.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 20),
                Text(selectedDonut!.description!),
                Consumer<DonutShoppingCartService>(
                    builder: (context, cartService, child) {
                  if (!cartService.isDonutInCart(selectedDonut!)) {
                    return GestureDetector(
                        onTap: () {
                          cartService.addToCart(selectedDonut!);
                        },
                        child: Container(
                            margin: EdgeInsets.only(top: 20),
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: Utils.mainDark.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.shopping_cart,
                                      color: Utils.mainDark),
                                  SizedBox(width: 20),
                                  Text('Add To Cart',
                                      style: TextStyle(color: Utils.mainDark)),
                                ])));
                  }

                  return Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_rounded, color: Utils.mainDark),
                        SizedBox(width: 20),
                        Text('Added to Cart',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Utils.mainDark))
                      ],
                    ),
                  );
                })
              ],
            ),
          ))
        ]));
  }
}
