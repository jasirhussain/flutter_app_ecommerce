import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListGrid extends StatelessWidget {
 
final String image;
final String title;
final String text;
  const ListGrid({Key? key, required this.image, required this.text, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1,color: Colors.black12),
        borderRadius: BorderRadius.circular(10)), 
       margin: EdgeInsets.all(10),
       padding: EdgeInsets.all(8),
       width: double.infinity,
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
        
           Text(
             title,
             style: TextStyle(fontWeight: FontWeight.bold),

           ),
           SizedBox(
             height: 300,
             child: GridView.builder(
               scrollDirection: Axis.vertical,
               physics: NeverScrollableScrollPhysics(),
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 4,
                   mainAxisSpacing: 0,
                   crossAxisSpacing: 10,
                   childAspectRatio: 0.5),
               itemBuilder: (context, index) {
                 return Container(
                     child: Column(
                   children: [
                 
                    SizedBox(
                     height: 50,
                     child: Image.asset(image)),
                    
                     Text(text,style: TextStyle(fontSize: 12),)
                   ],
                 ));
               },
               shrinkWrap: true,
             ),
           ),
           
         ],
       ),
     );

  }
}