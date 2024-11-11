import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradproject/views/user_screen/home_page.dart';
import 'package:gradproject/views/user_auth_cycle/registration_screen.dart';
import 'package:gradproject/views/user_auth_cycle/signin_screen.dart';

import '../widegts/my_button.dart';


class WelcomeScreen extends StatefulWidget {
  static const String screenRoute = 'welcome_screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(
                  height: 180,
                   child:Image.asset('assets/images/logosss.png', height: 25),

                ),
               const Text(
                  'PNU SPORT CLUBS',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Color(0xff2e386b),
                  ),
                ),
              ],
            ),
          const  SizedBox(height: 30),

            MyButton(
                 color: const Color.fromARGB(170, 4, 131, 72),
              title: 'sign_in'.tr,
              onPressed: () {
              Get.off(()=>const SignInScreen());
              },
            ),

            MyButton(      
               color: const Color.fromARGB(170, 4, 131, 72),
              title: 'sign_up'.tr,
              onPressed: () {
                 Get.off(()=>const RegistrationScreen());
              },
            ),


            // MyButton(
            //       color: const Color.fromARGB(170, 4, 131, 72),
            //   title: 'Explore',
            //   onPressed: () {
            //    Get.off(()=>const HomePage());
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}