// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p4/widgets/donutfilterbar.dart';
import 'package:flutter_codelab_p4/widgets/donutpager.dart';

class DonutMainPage extends StatelessWidget {
  const DonutMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [DonutPager(), DonutFilterBar()],
    );
  }
}
