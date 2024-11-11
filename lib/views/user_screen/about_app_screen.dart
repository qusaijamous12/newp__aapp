import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/colors.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About_App '.tr,style:const TextStyle(color: Colors.white),),backgroundColor: kPrimary,leading: IconButton(onPressed: (){
        Get.back();
      }, icon:const Icon(Icons.arrow_back_ios,color: Colors.white,)),),
      body:Column(
        children: [
          Expanded(child: Image.asset('assets/images/about_app.png',height:500,fit: BoxFit.fill,width: double.infinity,)),
          const Expanded(
            child:  Padding(
              padding:  EdgeInsets.all(20.0),
              child: Text('About Us Welcome to the University Sports Club app! Here you will find everything you need to stay healthy and fit. Our app aims to promote a healthy and active lifestyle among students and staff. And to facilitate communication and knowledge of the latest events and activities. We offer a wide range of sporting activities, from casual games to competitive teams, all in a fun and inclusive environment. Our Mission To encourage fitness, teamwork and sportsmanship while providing opportunities for students to enjoy a variety of sporting activities, stay healthy and make new friends. Join us to stay active, stay healthy and create lasting memories as part of our vibrant university community!',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                ),),
            ),
          ),
        ],
      ) ,

    );
  }
}
