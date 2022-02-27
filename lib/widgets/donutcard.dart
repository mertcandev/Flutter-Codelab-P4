// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:flutter_codelab_p4/classes.dart';

class DonutCard extends StatelessWidget {
  DonutModel? donutInfo;
  DonutCard({this.donutInfo});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 150,
          alignment: Alignment.bottomLeft,
          margin:
              const EdgeInsets.only(top: 80, left: 10, right: 10, bottom: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0.0, 4.0))
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${donutInfo!.name}",
                style: const TextStyle(
                    color: Utils.mainDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                decoration: BoxDecoration(
                    color: Utils.mainColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "\$${donutInfo!.price!.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Image.network(
            donutInfo!.imgUrl!,
            width: 150,
            height: 150,
            fit: BoxFit.contain,
          ),
        )
      ],
    );
  }
}
