import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradproject/controller/home_controller.dart';
import 'package:gradproject/views/user_screen/about_app_screen.dart';
import 'package:gradproject/views/user_screen/contact_us.dart';
import 'package:gradproject/screens/welcome_screen.dart';
import 'package:gradproject/shared/colors.dart';
import 'package:gradproject/views/user_screen/membership_renewal_screen.dart';
import 'package:gradproject/views/user_screen/profile_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final _homeController=Get.find<HomeController>(tag: 'home_controller');
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
                itemCount: 7),
          )
        ],
      ),
    );
  }

  Widget buildSettingItem(int index){

    List<Map<String,dynamic>> design=[
      {
        'title':'language'.tr,'Icon':Icons.language,
      },
      {
        'title':'edit_profile'.tr,'Icon':Icons.edit,

      },
      {
        'title':'Membership_renewal'.tr,'Icon':Icons.monetization_on
      },
      {
        'title':'about_app'.tr,'Icon':Icons.info,

      },
      {
        'title':'help'.tr,'Icon':Icons.help,

      },
      {
        'title':'contact_us'.tr,'Icon':Icons.contact_page,

      },
      {
        'title':'logout'.tr,'Icon':Icons.logout,

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
              if(_homeController.currentLanguage=='en'){
                _homeController.updateCurrentLanguage(const Locale('ar'));
              }else{
                _homeController.updateCurrentLanguage(const Locale('en'));
              }
            case 1:
              Get.to(()=>const ProfileScreen());
              break;
            case 2:

              Get.to(()=>const MembershipRenewalScreen());
              break;
            case 3:
              Get.to(()=>const AboutAppScreen());
              break;
            case 5:
              Get.to(()=>const ContactUs());
            case 6:
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
