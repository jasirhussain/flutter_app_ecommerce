
import 'package:flutter/material.dart';

import '../profile/screens/profile_screen.dart';
import 'app_assets.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ));
          },
          child: const CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(ThemeAssets.profilepic),
          ),
        ),
        Image.asset(
          ThemeAssets.logo,
          height: 40,
        ),
        IconButton(
          iconSize: 30,
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
