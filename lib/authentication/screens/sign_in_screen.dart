
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_ecommerce/authentication/screens/sign_up_screen.dart';
import 'package:get/get.dart';

import '../../homescreen/screens/landing_screen.dart';
import '../../util/app_assets.dart';
import '../../util/app_color.dart';
import '../../util/app_padding.dart';
import '../widgets/elevated_button_widget.dart';
import '../widgets/sign_textfeild.dart';
import '../widgets/text_feild_form_items.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const AppPadding(multipliedBy: 2),
              Image.asset(
                ThemeAssets.logo,
                height: 80,
                width: 80,
              ),
              const Text(
                'Welcome!',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
              ),
              const Text(
                'login to your account',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
              TextFieldItems(
                  controller: emailController,
                  text: 'Email',
                  hintText: '123@gmail.com'),
              const AppPadding(
                dividedBy: 2,
              ),
              SignTextFeild(
                controller: passwordController,
                title: 'Password',
                hintText: '...........',
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    // Get.to( ForgotScreen());
                  },
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const AppPadding(dividedBy: 1),
              ElevationBiuttonWidget(
                onPressed: () async {
                  final email = emailController.text;
                  final password = passwordController.text;
                  try {
                    final credential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email, password: password);
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LandingScreen(),
                        ));
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            behavior: SnackBarBehavior.floating,
                            dismissDirection: DismissDirection.down,
                            duration: Duration(seconds: 3),
                            backgroundColor: Colors.red,
                            content: Text('No user found for that email.')),
                      );
                    } else if (e.code == 'wrong-password') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            behavior: SnackBarBehavior.floating,
                            dismissDirection: DismissDirection.down,
                            duration: Duration(seconds: 3),
                            backgroundColor: Colors.red,
                            content:
                                Text('Wrong password provided for that user.')),
                      );
                    }
                  }
                },
                child: _loading
                    ? const Center(
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : const Center(
                        child: Text(
                        'SignUp',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )),
              ),
              // GetBuilder<AuthControler>(
              //   init: AuthControler(),
              //   initState: (_) {},
              //   builder: (controller) {
              //     return
              //   },
              // ),
              const AppPadding(dividedBy: 1),
              // const SignupDivider(),
              const AppPadding(),

              const AppPadding(
                multipliedBy: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Didn\'t have an account ?'),
                  const SizedBox(
                    width: 3,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => SignUpScreen());
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: AppColor.primaryLight,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
