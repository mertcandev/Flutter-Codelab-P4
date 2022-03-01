// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

import 'package:flutter_codelab_p4/classes.dart';
import 'package:flutter_codelab_p4/widgets/donutcard.dart';

class DonutList extends StatefulWidget {
  List<DonutModel>? donuts;

  DonutList({ this.donuts });

  @override
  State<DonutList> createState() => _DonutListState();
}

class _DonutListState extends State<DonutList> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  List<DonutModel> insertedItems = [];

  @override 
  void initState() {
    super.initState();

    var future = Future(() {});
    for (var i = 0; i < widget.donuts!.length; i++) {
      future = future.then((_) {
        return Future.delayed(const Duration(milliseconds: 125), () {
          insertedItems.add(widget.donuts![i]);
          _key.currentState!.insertItem(i);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _key,
      scrollDirection: Axis.horizontal,
      initialItemCount: insertedItems.length,
      itemBuilder: (context, index, animation) {
        
        DonutModel currentDonut = widget.donuts![index];

        return SlideTransition(
          position: Tween(
            begin: const Offset(0.2, 0.0),
            end: const Offset(0.0, 0.0),
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
          child: FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0)
            .animate(CurvedAnimation(
              parent: animation, curve: Curves.easeInOut)
            ),
            child: DonutCard(donutInfo: currentDonut)
          )
        );
      }
    );
  }
}