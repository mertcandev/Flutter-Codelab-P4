// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p4/classes.dart';
import 'package:provider/provider.dart';

class DonutBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(30),
        child: Consumer<DonutBottomBarSelectionService>(
            builder: (context, bottomBarSelectionService, child) {
          return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(Icons.trip_origin,
                        color: bottomBarSelectionService.tabSelection == 'main'
                            ? Utils.mainDark
                            : Utils.mainColor),
                    onPressed: () {
                      bottomBarSelectionService.setTabSelection('main');
                    }),
                IconButton(
                    icon: Icon(Icons.favorite,
                        color: bottomBarSelectionService.tabSelection ==
                                'favorites'
                            ? Utils.mainDark
                            : Utils.mainColor),
                    onPressed: () {
                      bottomBarSelectionService.setTabSelection('favorites');
                    }),
                Consumer<DonutShoppingCartService>(
                    builder: (context, cartService, child) {
                  int cartItems = cartService.cartDonuts.length;

                  return Container(
                      constraints: BoxConstraints(minHeight: 70),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: cartItems > 0
                              ? (bottomBarSelectionService.tabSelection! ==
                                      'shopping'
                                  ? Utils.mainDark
                                  : Utils.mainColor)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(50)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            cartItems > 0
                                ? Text('$cartItems',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14))
                                : SizedBox(height: 17),
                            SizedBox(height: 10),
                            Icon(Icons.shopping_cart,
                                color: cartItems > 0
                                    ? Colors.white
                                    : (bottomBarSelectionService
                                                .tabSelection! ==
                                            'shopping'
                                        ? Utils.mainDark
                                        : Utils.mainColor))
                          ]));
                })
              ]);
        }));
  }
}
