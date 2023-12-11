import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {

 final String title ;
 final String icon;



const GridCard({Key? key, required this.title, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 5,
            color: Colors.grey.shade200,
            offset: const Offset(9, 4),
            spreadRadius: 2),
      ], color: Colors.red.shade100, borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: Image.asset(
            icon,
              fit: BoxFit.contain,
            ),
          ),
           Text(title)
        ],
      ),
    );
  }
}
