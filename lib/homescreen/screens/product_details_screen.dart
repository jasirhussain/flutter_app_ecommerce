
import 'package:flutter/material.dart';

import '../../util/app_color.dart';
import '../../util/app_constants.dart';
import '../../util/app_padding.dart';
import '../widgets/horizontal_list_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String productName;
  final String productDescription;
  final int productPrice;
  final String productImageUrl;
  const ProductDetailsScreen(
      {super.key,
      required this.productName,
      required this.productDescription,
      required this.productPrice,
      required this.productImageUrl});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding / 2,
            ),
            child: Column(children: [
              const AppPadding(dividedBy: 2),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    image: DecorationImage(
                        image: NetworkImage(
                          widget.productImageUrl,
                        ),
                        fit: BoxFit.cover)),
                child: Image.network(
                  widget.productImageUrl,
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.productName,
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "£${widget.productPrice}",
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          "offer",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 17,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const AppPadding(dividedBy: 3),
                                Text(
                                  widget.productDescription,
                                  style: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                      overflow: TextOverflow.visible,
                                      decorationStyle:
                                          TextDecorationStyle.double,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const AppPadding(dividedBy: 4),
                            Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: 5,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Icon(Icons.star_rounded,
                                            size: 18,
                                            color: AppColor.primaryLight
                                                .withOpacity(.8));
                                      }),
                                ),
                                Text(
                                  '(${"5"})',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.secondaryLight),
                                ),
                              ],
                            ),
                            const AppPadding(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Related products',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                               const SizedBox(
                                    height: 200, child: HorizontalListWidget()),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ])));
  }
}
