
import 'package:flutter/material.dart';

import '../models/category_fetch.dart';
import '../models/products_model.dart';

class HorizontalListWidget extends StatefulWidget {
  const HorizontalListWidget({super.key});

  @override
  State<HorizontalListWidget> createState() => _HorizontalListWidgetState();
}

class _HorizontalListWidgetState extends State<HorizontalListWidget> {
  final ProductFetch _productFetch = ProductFetch();
  final List<Color> _colors = [Colors.black87, Colors.black12];
  final List<double> _stops = [0.0, 0.8];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
        future: _productFetch.getProducts(),
        builder: (context, snapshot) {
          var data = snapshot.data;

          if (!snapshot.hasData) {
            return const Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.black,
              color: Colors.white10,
            ));
          }
          return SizedBox(
            height: 200,
            width: MediaQuery.maybeOf(context)!.size.width,
            child: ListView.builder(
                padding: const EdgeInsets.only(left: 10),
                itemCount: data!.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Stack(children: [
                          Container(
                            alignment: Alignment.bottomCenter,
                            height: 150,
                            width: 100,
                            decoration: BoxDecoration(
                              image:  DecorationImage(
                                  image: NetworkImage(snapshot.data![index].images[1]),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Container(
                            height: 150,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: _colors,
                                stops: _stops,
                              ),
                            ),
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              data[index].title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  );
                }),
          );
        });
  }
}
