// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

import 'package:flutter_codelab_p4/classes.dart';
import 'package:flutter_codelab_p4/widgets/donutcard.dart';

class DonutList extends StatefulWidget {
  List<DonutModel>? donuts;
  DonutList({
    this.donuts,
  });

  @override
  State<DonutList> createState() => _DonutListState();
}

class _DonutListState extends State<DonutList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.donuts!.length,
        itemBuilder: (context, index) {
          DonutModel currentDonut = widget.donuts![index];
          return DonutCard(
            donutInfo: currentDonut,
          );
        });
  }
}
