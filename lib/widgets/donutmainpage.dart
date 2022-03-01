// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p4/classes.dart';
import 'package:flutter_codelab_p4/widgets/donutfilterbar.dart';
import 'package:flutter_codelab_p4/widgets/donutlist.dart';
import 'package:flutter_codelab_p4/widgets/donutpager.dart';
import 'package:provider/provider.dart';

class DonutMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DonutPager(),
        DonutFilterBar(),
        Expanded(
          child: Consumer<DonutService>(
            builder: (context, donutService, child) {
              return DonutList(donuts: donutService.filteredDonuts);
            },
          )
        )
      ]
    );
  }
}
