import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradproject/views/user_screen/contact_us.dart';
import 'package:gradproject/screens/welcome_screen.dart';
import 'package:gradproject/shared/colors.dart';
import 'package:gradproject/views/user_screen/profile_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child:Column(
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder:(context,index)=>buildSettingItem(index) ,
                separatorBuilder: (context,index)=> Divider(
                  height: 2,
                  thickness: 2,
                  color: Colors.grey[300],
                ),
                itemCount: 6),
          )
        ],
      ),
    );
  }

  Widget buildSettingItem(int index){

    List<Map<String,dynamic>> design=[
      {
        'title':'Language','Icon':Icons.language,
      },
      {
        'title':'Edit Profile','Icon':Icons.edit,

      },
      {
        'title':'About App','Icon':Icons.info,

      },
      {
        'title':'Help','Icon':Icons.help,

      },
      {
        'title':'Contact Us','Icon':Icons.contact_page,

      },
      {
        'title':'Log Out','Icon':Icons.logout,

      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: GestureDetector(
        behavior:
        HitTestBehavior.translucent,
        onTap: (){
          switch(index){
            case 0:
              break;
            case 1:
              Get.to(()=>const ProfileScreen());
              break;
            case 2:
              break;
            case 3:
              break;
            case 4:
              Get.to(()=>const ContactUs());
            case 5:
              Get.offAll(()=>const WelcomeScreen());
              break;
          }
        },
        child: Row(
          children: [

             Icon(
              design[index]['Icon'],
              color: kPrimary,
              size: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              '${design[index]['title']}',
              style:const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
              ),

            ),
           const Spacer(),
            Icon(Icons.arrow_forward_ios,color: kPrimary,size: 30,),






          ],
        ),
      ),
    );

  }

}
