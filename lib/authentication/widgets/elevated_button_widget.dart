import 'package:flutter/material.dart';

class ElevationBiuttonWidget extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;
  final Color? color;
  const ElevationBiuttonWidget({
     Key? key,
    this.onPressed,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
   return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            gradient: LinearGradient(
                colors: [Colors.cyan.shade200, const Color(0XFF25b4c7)]),
            boxShadow: [
              BoxShadow(
                spreadRadius: 0,
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 2,
                offset: const Offset(0, 2),
              ),
            ]),
        child: Center(child: child),
      ),
    );
  }
}
