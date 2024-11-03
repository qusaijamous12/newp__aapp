import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradproject/controller/admin_controller.dart';
import 'package:gradproject/controller/couch_controller.dart';
import 'package:gradproject/controller/home_controller.dart';
import 'package:gradproject/controller/user_controller.dart';
import 'package:gradproject/screens/welcome_screen.dart';
import 'package:gradproject/shared/colors.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(UserController(),tag: 'user_controller');
  Get.put(HomeController(),tag: 'home_controller');
  Get.put(AdminController(),tag: 'admin_controller');
  Get.put(CouchController(),tag: 'couch_controller');


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomNavigationBarTheme:const BottomNavigationBarThemeData(
          backgroundColor: kPrimary
        )
      ),
      home: WelcomeScreen(),
    );
  }
}


