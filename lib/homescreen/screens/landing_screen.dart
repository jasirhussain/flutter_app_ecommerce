
import 'package:flutter/material.dart';

import '../../profile/screens/profile_screen.dart';
import '../../util/app_color.dart';
import 'favourate_screen.dart';
import 'homescreen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int selectedIndex = 0;
  List pages = [
    const HomeScreen(),
    const FavouriteScreen(),
    const ProfileScreen(),
  ];
  void onTapped(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: pages.elementAt(selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 4, spreadRadius: 2, color: Colors.grey.shade300)
          ],
          borderRadius: BorderRadius.circular(20),
          color: AppColor.surface,
        ),
        child: BottomNavigationBar(
          unselectedItemColor: AppColor.secondaryLight,
          elevation: 0,
          fixedColor: AppColor.background,
          backgroundColor: Colors.transparent,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favourite'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: selectedIndex,
          onTap: onTapped,
        ),
      ),
    );
  }
}

  // FutureBuilder<List<ProductModel>>(
  //             future: _productFetch.getProducts(),
  //             builder: (context, snapshot) {
  //               var data = snapshot.data;

  //               if (!snapshot.hasData) {
  //                 return const Center(
  //                     child: CircularProgressIndicator(
  //                   backgroundColor: Colors.black,
  //                   color: Colors.white10,
  //                 ));
  //               }
  //               return SizedBox(
  //                 height: 150,
  //                 width: MediaQuery.maybeOf(context)!.size.width,
  //                 child: ListView.builder(
  //                     padding: const EdgeInsets.only(left: 10),
  //                     itemCount: data!.length,
  //                     scrollDirection: Axis.horizontal,
  //                     shrinkWrap: true,
  //                     itemBuilder: (context, index) {
  //                       return Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: Stack(
  //                           children: [
  //                             Stack(children: [
  //                               Container(
  //                                 alignment: Alignment.bottomCenter,
  //                                 height: 100,
  //                                 width: 100,
  //                                 decoration: BoxDecoration(
  //                                   image: DecorationImage(
  //                                       image: NetworkImage(
  //                                           snapshot.data![index].images[0]),
  //                                       fit: BoxFit.fill),
  //                                   borderRadius: BorderRadius.circular(10),
  //                                 ),
  //                               ),
  //                               Container(
  //                                 height: 100,
  //                                 width: 100,
  //                                 decoration: BoxDecoration(
  //                                   borderRadius: BorderRadius.circular(8),
  //                                   gradient: LinearGradient(
  //                                     begin: Alignment.bottomCenter,
  //                                     end: Alignment.topCenter,
  //                                     colors: _colors,
  //                                     stops: _stops,
  //                                   ),
  //                                 ),
  //                                 alignment: Alignment.bottomCenter,
  //                                 child: Text(
  //                                   data[index].title,
  //                                   textAlign: TextAlign.center,
  //                                   style: const TextStyle(
  //                                     color: Colors.white,
  //                                     fontSize: 14,
  //                                   ),
  //                                 ),
  //                               ),
  //                             ]),
  //                           ],
  //                         ),
  //                       );
  //                     }),
  //               );
  //             }),