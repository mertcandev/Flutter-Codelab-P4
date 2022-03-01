// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_codelab_p4/classes.dart';
import 'package:provider/provider.dart';

class DonutFilterBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Consumer<DonutService>(
        builder: (context, donutService, child) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  donutService.filterBarItems.length, (index) {

                    DonutFilterBarItem item = donutService.filterBarItems[index];

                    return  GestureDetector(
                      onTap: () { 
                        donutService.filteredDonutsByType(item.id!);
                      },
                      child: Container(
                        child: Text('${item.label!}', 
                        style: TextStyle(
                          color: donutService.selectedDonutType == item.id ? 
                          Utils.mainColor : Colors.black, fontWeight: FontWeight.bold)
                        )
                      )
                    );
                  }
                )
              ),
              SizedBox(height: 10),
              Stack(
                children: [
                  AnimatedAlign(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    alignment: alignmentBasedOnTap(donutService.selectedDonutType),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3 - 20,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Utils.mainColor,
                        borderRadius: BorderRadius.circular(20)
                      )
                    )
                  )
                ],
              )
            ]
          );
        }
      )
    );
  }

  Alignment alignmentBasedOnTap(filterBarId) {
    
    switch(filterBarId) {
      case 'classic':
        return Alignment.centerLeft;
      case 'sprinkled':
        return Alignment.center;
      case 'stuffed':
        return Alignment.centerRight;
      default:
        return Alignment.centerLeft;
    }
  }
}

