import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_ecommerce/authentication/screens/sign_up_screen.dart';
import 'package:flutter_app_ecommerce/homescreen/app_screens/all_categories_screen.dart';
import 'package:flutter_app_ecommerce/homescreen/app_screens/app_homescreen.dart';
import 'package:flutter_app_ecommerce/homescreen/screens/landing_screen.dart';
import 'package:flutter_app_ecommerce/util/appbar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'authentication/screens/sign_in_screen.dart';
import 'homescreen/screens/homescreen.dart';

void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: const Color(0xffffffff),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home:   AllCategoryScreen(),
    );
  }
}