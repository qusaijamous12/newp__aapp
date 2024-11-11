import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradproject/controller/home_controller.dart';
import 'package:gradproject/controller/user_controller.dart';
import 'package:gradproject/screens/welcome_screen.dart';
import 'package:gradproject/shared/colors.dart';
import 'package:gradproject/views/admin_screen/admin_home_screen.dart';
import 'package:gradproject/views/couch_screen/couch_home_screen.dart';
import 'package:gradproject/views/user_screen/chat_listing_screen.dart';
import 'package:gradproject/views/user_screen/contact_us.dart';
import 'package:gradproject/views/user_screen/profile_screen.dart';



class HomePage extends StatefulWidget {
  static const String screenRoute = 'home_page';

  const HomePage({Key ? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(); // Create the state
}

class _HomePageState extends State<HomePage> {
  final _homeController=Get.find<HomeController>(tag: 'home_controller');
  final _userController=Get.find<UserController>(tag: 'user_controller');

  @override
  Widget build(BuildContext context) {
    return Obx(()=>determineScreen());
  }
  Widget determineScreen(){
    if(_userController.userModel.status==0){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimary,
          title: Row(
            children: [
              Image.asset('assets/images/logosss.png', height: 40,width: 80,),
              const SizedBox(
                width: 10,
              ),
              Text(
                '${_homeController.titles[_homeController.currentIndex]}'.tr,
                style:const TextStyle(
                    color: Colors.white
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: (){
                  Get.to(()=>const ChatListingScreen(isUser: true,));
                },
                icon:const Icon(Icons.message,color: Colors.white,))
          ],

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

              ListTile(
                title: Text('account'.tr),
                onTap: () {
                  Get.to(()=>const ProfileScreen());
                },
              ),
              // New Sitting button in the drawer
              ListTile(
                title: Text('contact_us'.tr),
                onTap: () {
                  Get.to(()=>const ContactUs());
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
        body: _homeController.screens[_homeController.currentIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: BottomNavigationBar(
              backgroundColor: kPrimary,
              currentIndex: _homeController.currentIndex,
              onTap: (index){
                _homeController.changeCurrentIndex(index);
              },

              selectedItemColor: Colors.white,
              items: [
                BottomNavigationBarItem(icon:const Icon(
                  Icons.home,

                ),label: 'home'.tr),

                BottomNavigationBarItem(icon:const Icon(
                  Icons.class_,

                ),label: 'classes'.tr),
                BottomNavigationBarItem(icon:const Icon(
                  Icons.settings,

                ),label: 'setting'.tr),

              ]),
        ),

      );
    }
    else if(_userController.userModel.status==1){
      return const AdminHomeScreen();
    }
    return const CouchHomeScreen();
  }
}