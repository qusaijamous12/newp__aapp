import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradproject/controller/admin_controller.dart';
import 'package:gradproject/controller/home_controller.dart';
import 'package:gradproject/screens/welcome_screen.dart';
import 'package:gradproject/shared/colors.dart';
import 'package:gradproject/views/admin_screen/create_announcment_couch.dart';
import 'package:gradproject/views/admin_screen/create_announcment_screen.dart';
import 'package:gradproject/views/admin_screen/messages.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  final _adminController=Get.find<AdminController>(tag: 'admin_controller');
  final _homeController=Get.find<HomeController>(tag: 'home_controller');
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimary,
        title: Row(
          children: [
            Image.asset('assets/images/logosss.png', height: 40,width: 80,),
            const SizedBox(
              width: 10,
            ),
            Text('${_adminController.titles[_adminController.currentIndex]}'.tr,style:const TextStyle(color: Colors.white),),
          ],
        ),
        actions: [
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
        centerTitle: true,

      ),
      body: _adminController.screens[_adminController.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: kPrimary,
          currentIndex: _adminController.currentIndex,
          onTap: (index){
            _adminController.changeCurrentIndex(index);
          },
          selectedItemColor: Colors.white,
          items:const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.sports_gymnastics),label: 'Coaches'),
            BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle_outlined),label: 'Users'),

          ]),
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
          ListTile(
            title: Text('Messages'.tr),
            onTap: () {
              Get.to(()=>const MessageScreen()); // Close the drawer
            },
          ),

          ListTile(
            title: Text('Announcment_Screen'.tr),
            onTap: () {
              Get.to(()=>const AnnouncmentScreen());
            },
          ),
          ListTile(
            title: Text('Announcement_Coach'.tr),
            onTap: () {
              Get.to(()=>const CreateAnnouncmentCouch()); // Close the drawer
            },
          ),
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
