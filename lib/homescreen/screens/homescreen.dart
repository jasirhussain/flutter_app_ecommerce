import 'package:carousel_slider/carousel_slider.dart';


import 'package:flutter/material.dart';
import 'package:flutter_app_ecommerce/homescreen/screens/product_details_screen.dart';

import '../../util/app_assets.dart';
import '../../util/app_color.dart';
import '../../util/app_constants.dart';
import '../../util/app_padding.dart';
import '../../util/appbar.dart';
import '../models/category_fetch.dart';
import '../models/products_model.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 

  bool _isSelected = true;
  final ProductFetch _productFetch = ProductFetch();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(height:40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const HomeAppBar(),
                const AppPadding(dividedBy: 2),
                const SearchBarWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppConstants.defaultPadding / 3,
                  ),
                  child: CarouselSlider.builder(
                    itemCount: 10,
                    itemBuilder: (context, i, l) {
                      return Stack(
                        children: [
                          Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.width,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(ThemeAssets.banner1),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                        ],
                      );
                    },
                    options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1.0,
                      aspectRatio: 2,
                      onPageChanged: (index, _) {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          const AppPadding(dividedBy: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top products',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text('View all',
                          style: Theme.of(context).textTheme.titleSmall!),
                    )
                  ],
                ),
              ],
            ),
          ),
          FutureBuilder<List<ProductModel>>(
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
                  width: MediaQuery.maybeOf(context)!.size.width,
                  child: GridView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: data!.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {
                        return Transform.translate(
                            offset: Offset(0.0, index.isOdd ? 40 : 00),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailsScreen(
                                        productDescription: snapshot.data![index].description,
                                        productImageUrl:snapshot.data![index].images[0] ,
                                        productName: snapshot.data![index].title,
                                        productPrice: snapshot.data![index].price.toInt(),
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.surface,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          SizedBox(
                                            child: Image.network(
                                              snapshot.data![index].images[0],
                                              fit: BoxFit.fill,
                                              height: 150,
                                            ),
                                          ),
                                          const AppPadding(
                                            dividedBy: 2,
                                          ),
                                          // Align(
                                          //   alignment: Alignment.topRight,
                                          //   child: IconButton(
                                          //     onPressed: () {
                                          //       _isSelected = true;
                                          //     },
                                          //     icon: _isSelected
                                          //         ? Icon(
                                          //             Icons.favorite,
                                          //             color: AppColor.primaryLight,
                                          //           )
                                          //         : Icon(
                                          //             Icons.favorite_border_rounded,
                                          //             color: AppColor.primaryLight,
                                          //           ),
                                          //   ),
                                          // )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data![index].title,
                                              maxLines: 1,
                                              overflow: TextOverflow.clip,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "£${snapshot.data![index].price}",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: AppColor
                                                            .primaryLight,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(2),
                                                  height: 24,
                                                  width: 45,
                                                  decoration: BoxDecoration(
                                                      color: AppColor.primary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6)),
                                                  child: Center(
                                                    child: Text(
                                                      'offer',
                                                      style: TextStyle(
                                                        color: AppColor.surface,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ));
                      }),
                );
              }),
          AppPadding(
            multipliedBy: 5,
          )
          // const ListViewWidget()
        ])));
  }
}

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    super.key,
  });

  // final bool _isSelected;

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    bool _isSelected = false;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding / 2,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top products',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text('View all', style: Theme.of(context).textTheme.titleSmall!)
            ],
          ),
          GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                return Transform.translate(
                    offset: Offset(0.0, index.isOdd ? 40 : 00),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColor.surface,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    //  width: width,
                                    child: Image.asset(
                                      ThemeAssets.grid,
                                      fit: BoxFit.fill,
                                      height: 150,
                                    ),
                                  ),
                                  const AppPadding(
                                    dividedBy: 2,
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      onPressed: () {
                                        _isSelected = true;
                                      },
                                      icon: _isSelected
                                          ? Icon(
                                              Icons.favorite,
                                              color: AppColor.primaryLight,
                                            )
                                          : Icon(
                                              Icons.favorite_border_rounded,
                                              color: AppColor.primaryLight,
                                            ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "product_name",
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              '₹400',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: AppColor.primaryLight,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '₹200}',
                                              style: TextStyle(
                                                  color:
                                                      AppColor.secondaryLight,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(2),
                                          height: 24,
                                          width: 45,
                                          decoration: BoxDecoration(
                                              color: AppColor.primary,
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Center(
                                            child: Text(
                                              'offer',
                                              style: TextStyle(
                                                color: AppColor.surface,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ));
              }),
        ],
      ),
    );
  }
}


//  ListView.builder(
//                       padding: const EdgeInsets.only(left: 10),
//                       itemCount: data!.length,
//                       scrollDirection: Axis.vertical,
//                       shrinkWrap: true,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Stack(
//                             children: [
//                               Stack(children: [
//                                 Container(
//                                   alignment: Alignment.bottomCenter,
//                                   height: 200,
//                                   width: 200,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                         image: NetworkImage(
//                                             snapshot.data![index].images[0]),
//                                         fit: BoxFit.fill),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                 ),
//                                 Container(
//                                   height: 100,
//                                   width: 100,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(8),
//                                     gradient: LinearGradient(
//                                       begin: Alignment.bottomCenter,
//                                       end: Alignment.topCenter,
//                                       colors: _colors,
//                                       stops: _stops,
//                                     ),
//                                   ),
//                                   alignment: Alignment.bottomCenter,
//                                   child: Text(
//                                     data[index].title,
//                                     textAlign: TextAlign.center,
//                                     style: const TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ),
//                               ]),
//                             ],
//                           ),
//                         );
//                       }),