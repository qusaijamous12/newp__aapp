import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradproject/controller/couch_controller.dart';
import 'package:gradproject/controller/home_controller.dart';
import 'package:gradproject/shared/colors.dart';

import '../../screens/welcome_screen.dart';
import '../user_screen/chat_listing_screen.dart';

class CouchHomeScreen extends StatefulWidget {
  const CouchHomeScreen({super.key});

  @override
  State<CouchHomeScreen> createState() => _CouchHomeScreenState();
}

class _CouchHomeScreenState extends State<CouchHomeScreen> {
  final _couchController=Get.find<CouchController>(tag: 'couch_controller');
  final _homeController=Get.find<HomeController>(tag: 'home_controller');
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimary,
        centerTitle: true,
        title:  Row(
          children: [
            Image.asset('assets/images/logosss.png', height: 40,width: 80,),
            const SizedBox(
              width: 10,
            ),
            Text('${_couchController.titles[_couchController.currentIndex]}'.tr,style:const TextStyle(
                color: Colors.white
            ),),
          ],
        ),
        actions: [
          IconButton(
              onPressed: (){
                Get.to(()=>const ChatListingScreen(isUser: false,));
              },
              icon:const Icon(Icons.message,color: Colors.white,)),
          IconButton(
              onPressed: (){
                if(_homeController.currentLanguage=='en'){
                  _homeController.updateCurrentLanguage(const Locale('ar'));
                }
                else{
                  _homeController.updateCurrentLanguage(const Locale('en'));


                }

              },
              icon:const Icon(Icons.language,color: Colors.white,)),
        ],

      ),
      body: _couchController.screens[_couchController.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          currentIndex: _couchController.currentIndex,
          onTap: (index){
            _couchController.changeCurrentIndex(index);
          },
          items: [
            BottomNavigationBarItem(icon:const Icon(Icons.home),label: 'home'.tr,),
            BottomNavigationBarItem(icon:const Icon(Icons.class_),label: 'My_Classes'.tr,),
            BottomNavigationBarItem(icon:const Icon(Icons.create),label: 'Create_Class'.tr,)

          ]
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,

        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
              DrawerHeader(
              decoration:const BoxDecoration(
                color:  Color.fromARGB(170, 4, 131, 72),
              ),
              child: Text(
                'Menu'.tr,
                style:const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),

            // New Sitting button in the drawer
            ListTile(
              title: Text('logout'.tr),
              onTap: () {
                Get.offAll(()=>const WelcomeScreen());
              },
            ),
          ],
        ),
      ),
    ));
  }
}
