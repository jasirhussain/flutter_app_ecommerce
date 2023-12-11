import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/app_color.dart';
import '../../util/app_padding.dart';
import '../widgets/elevated_button_widget.dart';
import '../widgets/sign_textfeild.dart';
import '../widgets/text_feild_form_items.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final fristnameController = TextEditingController(text: '');
  final lastnameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  final checkPasswordController = TextEditingController(text: '');

  bool _loading =false;

  DateTime date = DateTime.now();
  // CollectionReference firestore =
  //     FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .05),
          child: Column(
            children: [
              const AppPadding(
                multipliedBy: 1.5,
              ),
              const Text(
                'Create your Account',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              TextFieldItems(
                  controller: fristnameController,
                  text: 'Frist Name',
                  hintText: 'Enter your frist name'),
              TextFieldItems(
                  controller: lastnameController,
                  text: 'Last Name',
                  hintText: 'Enter your last name'),
              TextFieldItems(
                  controller: emailController,
                  text: 'Email',
                  hintText: 'Enter your email'),
              const AppPadding(
                dividedBy: 2,
              ),
              SignTextFeild(
                controller: passwordController,
                title: 'Password',
                hintText: '...........',
              ),
              const AppPadding(
                dividedBy: 2,
              ),
              SignTextFeild(
                controller: checkPasswordController,
                title: 'Re -enter Password',
                hintText: '...........',
              ),
              const AppPadding(),
              ElevationBiuttonWidget(
                onPressed: () async {
                  final fristName = fristnameController.text;
                  final lastName = lastnameController.text;

                  final email = emailController.text;
                  final password = passwordController.text;

                  try {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    await FirebaseFirestore.instance
                        .collection("User")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .set({
                      'fristName': fristName,
                      'lastName': lastName,
                      'uid': FirebaseAuth.instance.currentUser!.uid,
                      'email': email
                    });
                    print("object");
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          dismissDirection: DismissDirection.down,
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.red,
                          content: Text('Password is Weak'),
                        ),
                      );
                    } else if (e.code == 'email-already-in-use') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          dismissDirection: DismissDirection.down,
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.red,
                          content: Text(
                              'The account already exists for that email.'),
                        ),
                      );
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text(
                  _loading
                      ? "Signing up".toUpperCase()
                      : "sign up".toUpperCase(),
                ),
              ),
              // GetBuilder<AuthControler>(
              //   init: AuthControler(),
              //   initState: (_) {},
              //   builder: (controller) {
              //     return ElevationBiuttonWidget(
              //       onPressed: () {
              //         controller.signUp(
              //           fristnameController.text,
              //           lastnameController.text,
              //           emailController.text,
              //           passwordController.text,
              //           '${date.day}-${date.month}${date.year}',
              //         );
              //         // _signUp();
              //       },
              //       child: controller.isLoading.value
              //           ? const Center(
              //               child: SizedBox(
              //                 height: 30,
              //                 width: 30,
              //                 child: CircularProgressIndicator(
              //                   strokeWidth: 2,
              //                   color: Colors.white,
              //                 ),
              //               ),
              //             )
              //           : const Center(
              //               child: Text(
              //               'SignIn',
              //               style: TextStyle(
              //                   color: Colors.white,
              //                   fontSize: 16,
              //                   fontWeight: FontWeight.bold),
              //             )),
              //     );
              //   },
              // ),
              const AppPadding(
                multipliedBy: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account ?'),
                  InkWell(
                    onTap: () {
                      // Get.to(() => Signin());
                    },
                    child: Text(
                      'Log in',
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
