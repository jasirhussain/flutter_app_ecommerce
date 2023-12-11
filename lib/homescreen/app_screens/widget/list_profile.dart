import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListProfile extends StatelessWidget {
  const ListProfile({Key? key, required this.text, required this.onTap}) : super(key: key);

 final String text;
 final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: onTap,
     child: Container(
      
      margin: EdgeInsets.all(10),
      decoration:BoxDecoration(borderRadius:BorderRadius.circular(10),
      
      border: Border.all(width: 1,color:Colors.black12)
       ),
      height: 50,
      width: double.infinity,
      child: Center(child: Text(text,style: TextStyle(fontWeight: FontWeight.bold),)),
     ),
   );
  }
}