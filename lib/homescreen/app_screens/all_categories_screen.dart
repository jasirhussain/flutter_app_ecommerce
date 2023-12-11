import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_ecommerce/homescreen/app_screens/widget/grid_card.dart';
import 'package:flutter_app_ecommerce/homescreen/app_screens/widget/list_grid.dart';

class AllCategoryScreen extends StatefulWidget {
  const AllCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _appBAr(),
            Container(
              height: 50,
              color: const Color(0xFFFFE0E0),
              child: Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.red,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Center(
                    child: Text('Kozhikode - Malappuram'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return GridCard(
                    icon: 'assets/images/grid1.png',
                    title: "Ambulance",
                  );
                },
              ),
            ),
           ListGrid(image: 'assets/images/delivery 1.png',text: "Home",title: "Daily needs",),
           ListGrid(image:"assets/images/insurance (1) 1.png",text: "Maid",title: "Auto Mobiles",),
           ListGrid(image:"assets/images/maid 1.png",text: "Home Care",title: "Maid",)

         
     
          ],
        ),
      ),
    );
  }

  Widget _appBAr() {
    return SizedBox(
      height: 150.0,
      child: Stack(
        children: [
          Container(
            color: Colors.red,
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
                    // _scaffoldKey.currentState!.openDrawer();
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
