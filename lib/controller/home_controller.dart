import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradproject/views/user_screen/home_page.dart';
import 'package:gradproject/views/user_screen/classes_screen.dart';
import 'package:gradproject/views/user_screen/home_screen.dart';
import 'package:gradproject/views/user_screen/profile_screen.dart';
import 'package:gradproject/views/user_screen/setting_screen.dart';

class HomeController extends GetxController{

  final _titles=RxList<String>([
    'Home Screen',
    'Classes Screen',
    'Setting Screen',


  ]);
  final _currentIndex=RxInt(0);
  final _screens=RxList<Widget>(const[
    HomeScreen(),
    ClassesScreen(),
    SettingScreen(),


  ]);

  void changeCurrentIndex(int index){
    print('index is $index');
    _currentIndex(index);
  }

  int get currentIndex=>_currentIndex.value;

  List<String> get titles=>_titles.value;
  List<Widget> get screens=>_screens.value;


}