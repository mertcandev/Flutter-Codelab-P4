// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';

import 'package:flutter_codelab_p4/classes.dart';
import 'package:provider/provider.dart';

class DonutCard extends StatelessWidget {

  DonutModel? donutInfo;
  DonutCard({ this.donutInfo });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var donutService = Provider.of<DonutService>(context, listen: false);
        donutService.onDonutSelected(donutInfo!);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 150,
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.only(left: 10, top: 80, right: 10, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05), 
                  blurRadius: 10, 
                  offset: Offset(0.0, 4.0)
                )
              ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${donutInfo!.name}', 
                  style: TextStyle(
                    color: Utils.mainDark, 
                    fontWeight: FontWeight.bold, 
                    fontSize: 15
                  )
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Utils.mainColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.only(
                    left: 10, right: 10, top: 5, bottom: 5
                  ),
                  child: Text('\$${donutInfo!.price!.toStringAsFixed(2)}', 
                    style: TextStyle(
                      fontSize: 12, 
                      color: Colors.white, 
                      fontWeight: FontWeight.bold
                    )
                  )
                )
              ]
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: donutInfo!.name!,
              child: Image.network(
                  donutInfo!.imgUrl!, 
                  width: 150, height: 150, 
                  fit: BoxFit.contain
                )
              ),
          )
        ]
      ),
    );
  }
}