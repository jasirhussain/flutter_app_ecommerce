import 'package:flutter/material.dart';
import 'package:flutter_app_ecommerce/util/app_padding.dart';

class horizontalListView extends StatelessWidget {
  const horizontalListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      color: Colors.grey.shade200,
                      offset: const Offset(9, 4),
                      spreadRadius: 2),
                ],
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(15)),
            margin: const EdgeInsets.all(7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset(
                    'assets/images/grid1.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const AppPadding(dividedBy: 6),
                const Text('Ambulance')
              ],
            ),
          );
        },
      ),
    );
  }
}
