import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradproject/screens/welcome_screen.dart';
import 'package:gradproject/shared/colors.dart';
import 'package:gradproject/shared/strings.dart';
import 'controller/admin_controller.dart';
import 'controller/couch_controller.dart';
import 'controller/home_controller.dart';
import 'controller/user_controller.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _homeController=Get.find<HomeController>(tag: 'home_controller');
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      fallbackLocale: const Locale('en'),
      localizationsDelegates:const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      locale: Locale('${_homeController.currentLanguage}'),
      translations:  Strings(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomNavigationBarTheme:const BottomNavigationBarThemeData(
          backgroundColor: kPrimary
        )
      ),
      home:const WelcomeScreen(),
    );
  }
}


