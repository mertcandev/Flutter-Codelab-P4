// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p4/classes.dart';
import 'package:flutter_codelab_p4/widgets/donutshoppinglistrow.dart';

class DonutShoppingList extends StatefulWidget {

  List<DonutModel>? donutCart;
  DonutShoppingCartService? cartService;
  DonutShoppingList({ this.donutCart, this.cartService });

  @override
  State<DonutShoppingList> createState() => _DonutShoppingListState();
}

class _DonutShoppingListState extends State<DonutShoppingList> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  List<DonutModel> insertedItems = [];

  @override
  void initState() {
    super.initState();

    var future = Future(() {});
    for (var i = 0; i < widget.donutCart!.length; i++) {
      future = future.then((_) {
        return Future.delayed(const Duration(milliseconds: 125), () {
          insertedItems.add(widget.donutCart![i]);
          _key.currentState!.insertItem(i);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _key,
      initialItemCount: insertedItems.length,
      itemBuilder: (context, index, animation) {
        DonutModel currentDonut = widget.donutCart![index];

        return SlideTransition(
          position: Tween(
            begin: const Offset(0.0, 0.2),
            end: const Offset(0.0, 0.0),
          )
          .animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut
          )),
          child: FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0)
            .animate(CurvedAnimation(parent: animation, 
            curve: Curves.easeInOut)),
            child: DonutShoppingListRow(
              donut: currentDonut,
              onDeleteRow: () {
                widget.cartService!.removeFromCart(currentDonut);
              }
            )
          )
        );
      },
    );
  }
}