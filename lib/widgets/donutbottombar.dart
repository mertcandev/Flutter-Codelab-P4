// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p4/classes.dart';
import 'package:provider/provider.dart';

class DonutBottomBar extends StatelessWidget {
  const DonutBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Consumer<DonutBottomBarSelectionService>(
        builder: ((context, bottomBarSelectionService, child) {
          return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.trip_origin,
                    color: bottomBarSelectionService.tabSelection == "main"
                        ? Utils.mainDark
                        : Utils.mainColor,
                  ),
                  onPressed: () {
                    bottomBarSelectionService.setTabSelection("main");
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Utils.mainColor,
                  ),
                  onPressed: () {
                    bottomBarSelectionService.setTabSelection("favorites");
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Utils.mainColor,
                  ),
                  onPressed: () {
                    bottomBarSelectionService.setTabSelection("shoppingcart");
                  },
                )
              ]);
        }),
      ),
    );
  }
}
