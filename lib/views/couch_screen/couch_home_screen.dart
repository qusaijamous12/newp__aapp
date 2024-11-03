import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradproject/controller/couch_controller.dart';
import 'package:gradproject/shared/colors.dart';

import '../../screens/welcome_screen.dart';

class CouchHomeScreen extends StatefulWidget {
  const CouchHomeScreen({super.key});

  @override
  State<CouchHomeScreen> createState() => _CouchHomeScreenState();
}

class _CouchHomeScreenState extends State<CouchHomeScreen> {
  final _couchController=Get.find<CouchController>(tag: 'couch_controller');
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
            Text('${_couchController.titles[_couchController.currentIndex]}',style:const TextStyle(
                color: Colors.white
            ),),
          ],
        ),
      ),
      body: _couchController.screens[_couchController.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          currentIndex: _couchController.currentIndex,
          onTap: (index){
            _couchController.changeCurrentIndex(index);
          },
          items:const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',),
            BottomNavigationBarItem(icon: Icon(Icons.class_),label: 'My Classes',),
            BottomNavigationBarItem(icon: Icon(Icons.create),label: 'Create Class',)

          ]
      ),
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

            // New Sitting button in the drawer
            ListTile(
              title:const Text('Logout'),
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
