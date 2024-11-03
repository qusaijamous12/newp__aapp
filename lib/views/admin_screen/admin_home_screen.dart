import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradproject/controller/admin_controller.dart';
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
            Text('${_adminController.titles[_adminController.currentIndex]}',style:const TextStyle(color: Colors.white),),
          ],
        ),
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
          const  DrawerHeader(
            decoration: BoxDecoration(
              color: const Color.fromARGB(170, 4, 131, 72),
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title:const Text('Messages'),
            onTap: () {
              Get.to(()=>const MessageScreen()); // Close the drawer
            },
          ),

          ListTile(
            title:const Text('Log Out'),
            onTap: () {
               Get.offAll(()=>const WelcomeScreen());
            },
          ),
          ListTile(
            title:const Text('Announcment Screen'),
            onTap: () {
              Get.to(()=>const AnnouncmentScreen());
            },
          ),
          ListTile(
            title:const Text('Announcement Coach'),
            onTap: () {
              Get.to(()=>const CreateAnnouncmentCouch()); // Close the drawer
            },
          ),

        ],
      ),
    ),
    ));
  }
}
