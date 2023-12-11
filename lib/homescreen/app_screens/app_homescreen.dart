import 'package:flutter/material.dart';
import 'package:flutter_app_ecommerce/homescreen/app_screens/widget/horizontal_listview.dart';
import 'package:flutter_app_ecommerce/util/app_color.dart';
import 'package:flutter_app_ecommerce/util/app_constants.dart';
import 'package:flutter_app_ecommerce/util/app_padding.dart';

class AppHomeScreen extends StatefulWidget {
  const AppHomeScreen({super.key});

  @override
  State<AppHomeScreen> createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
        height: 60,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildBottomNavBarItem(
              Icons.home,
              0,
            ),
            _buildBottomNavBarItem(
              Icons.search,
              1,
            ),
            _buildBottomNavBarItem(
              Icons.person,
              2,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding / 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppPadding(multipliedBy: 4.5),
                // const LocationSelect(),
                const horizontalListView(),
                const AppPadding(dividedBy: 4),
                const gridViewAllCategories(),
                const AppPadding(dividedBy: 2),
                bannerImage(context),
                const AppPadding(dividedBy: 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 10),
                      child: Text(
                        "Mobiles",
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: AppColor.primary,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 145,
                      child: ListView.builder(
                        itemCount: 10,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return Container(
                            margin: const EdgeInsets.all(4),
                            padding: const EdgeInsets.all(7),
                            height: 145,
                            width: 120,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              children: [
                                SizedBox(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    child: Image.asset(
                                      "assets/images/banner.png",
                                      height: 70,
                                      width: 120,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const AppPadding(dividedBy: 6),
                                Text(
                                  "ABC Mobiles",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: AppColor.primary,
                                          fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text("2.5 km  ",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          size: 15,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          "4.5 ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                  color: AppColor.primary),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const AppPadding(dividedBy: 2),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.defaultPadding / 2,
                        vertical: AppConstants.defaultPadding / 2,
                      ),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Color(0XFFFFFFFF),
                          borderRadius: BorderRadius.all(Radius.circular(18))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Popular services",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                    color: AppColor.primary,
                                    fontWeight: FontWeight.bold),
                          ),
                          const AppPadding(dividedBy: 2),
                          GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: 8,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      mainAxisSpacing: 15,
                                      crossAxisSpacing: 15,
                                      childAspectRatio: 0.9999),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'assets/images/car.png',
                                        fit: BoxFit.contain,
                                        height: 37,
                                        width: 37,
                                      ),
                                      Text(
                                        "Automobiles",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                color: AppColor.primary,
                                                fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                );
                              }),
                          const AppPadding(dividedBy: 2),
                        ],
                      ),
                    ),
                    bannerImage(context),
                    const AppPadding(dividedBy: 2),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.defaultPadding / 2,
                        vertical: AppConstants.defaultPadding / 2,
                      ),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Color(0XFFFFFFFF),
                          borderRadius: BorderRadius.all(Radius.circular(18))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Trending",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                    color: AppColor.primary,
                                    fontWeight: FontWeight.bold),
                          ),
                          const AppPadding(dividedBy: 2),
                          GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: 8,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      mainAxisSpacing: 15,
                                      crossAxisSpacing: 15,
                                      childAspectRatio: 0.9999),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        'assets/images/mrng.png',
                                        fit: BoxFit.contain,
                                        height: 37,
                                        width: 37,
                                      ),
                                      Text(
                                        "Home decor",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                color: AppColor.primary,
                                                fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                );
                              }),
                          const AppPadding(dividedBy: 2),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          _appBAr(),
        ],
      ),
    );
  }

  SizedBox bannerImage(BuildContext context) {
    return SizedBox(
      height: 145,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        "assets/images/banner.png",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildBottomNavBarItem(
    IconData icon,
    int index,
  ) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Icon(
          icon,
          color: index == _selectedIndex
              ? AppColor.secondaryLight
              : AppColor.primary,
        ));
  }

  Widget _appBAr() {
    return SizedBox(
      height: 150.0,
      child: Stack(
        children: [
          Container(
            color: Colors.amber,
            width: MediaQuery.of(context).size.width,
            height: 120.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 26,
                  ),
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                ),
                const Spacer(),
                const Center(
                  child: Text(
                    'Home',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(
                    Icons.notifications_outlined,
                    size: 26,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Positioned(
            top: 90.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: const Offset(0, 5),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(17.0),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class gridViewAllCategories extends StatelessWidget {
  const gridViewAllCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding / 2,
        vertical: AppConstants.defaultPadding / 2,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Color(0XFFFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(18))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quick Access",
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: AppColor.primary, fontWeight: FontWeight.bold),
          ),
          const AppPadding(dividedBy: 2),
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: 12,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.86),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/car.png',
                        fit: BoxFit.contain,
                        height: 37,
                        width: 37,
                      ),
                      Text(
                        "Automobiles",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.green, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      )
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}

  