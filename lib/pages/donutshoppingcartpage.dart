// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p4/classes.dart';
import 'package:flutter_codelab_p4/widgets/donutshoppinglist.dart';
import 'package:provider/provider.dart';

class DonutShoppingCartPage extends StatefulWidget {
  @override
  State<DonutShoppingCartPage> createState() => _DonutShoppingCartPageState();
}

class _DonutShoppingCartPageState extends State<DonutShoppingCartPage>
    with SingleTickerProviderStateMixin {
  AnimationController? titleAnimation;

  @override
  void initState() {
    super.initState();

    titleAnimation = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this)
      ..forward();
  }

  @override
  void dispose() {
    titleAnimation!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          FadeTransition(
              opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                  parent: titleAnimation!, curve: Curves.easeInOut)),
              child: Image.network(Utils.donutTitleMyDonuts, width: 170)),
          Expanded(child: Consumer<DonutShoppingCartService>(
              builder: (context, cartService, child) {
            if (cartService.cartDonuts.isEmpty) {
              return Center(
                  child: SizedBox(
                      width: 200,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart,
                                color: Colors.grey[300], size: 50),
                            SizedBox(height: 20),
                            Text('You don\'t have any items on your cart yet!',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.grey))
                          ])));
            }

            return DonutShoppingList(
              donutCart: cartService.cartDonuts,
              cartService: cartService,
            );
          })),
          Consumer<DonutShoppingCartService>(
              builder: (context, cartService, child) {
            return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  cartService.cartDonuts.isEmpty
                      ? SizedBox()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total',
                                style: TextStyle(color: Utils.mainDark)),
                            Text(
                                '\$${cartService.getTotal().toStringAsFixed(2)}',
                                style: TextStyle(
                                    color: Utils.mainDark,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30))
                          ],
                        ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Material(
                          color: cartService.cartDonuts.isEmpty
                              ? Colors.grey[200]
                              : Utils.mainColor.withOpacity(0.2),
                          child: InkWell(
                              splashColor: Utils.mainDark.withOpacity(0.2),
                              highlightColor: Utils.mainDark.withOpacity(0.5),
                              onTap: cartService.cartDonuts.isEmpty
                                  ? null
                                  : () {
                                      cartService.clearCart();
                                    },
                              child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, bottom: 10, left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.delete_forever,
                                          color: cartService.cartDonuts.isEmpty
                                              ? Colors.grey
                                              : Utils.mainDark),
                                      Text('Clear Cart',
                                          style: TextStyle(
                                              color:
                                                  cartService.cartDonuts.isEmpty
                                                      ? Colors.grey
                                                      : Utils.mainDark))
                                    ],
                                  )))))
                ]);
          })
        ]));
  }
}
