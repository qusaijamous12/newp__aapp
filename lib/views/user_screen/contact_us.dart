import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradproject/controller/user_controller.dart';
import 'package:gradproject/shared/colors.dart';
import 'package:gradproject/shared/utils/utils.dart';
import 'package:gradproject/widegts/my_button.dart';

class ContactUs extends StatefulWidget {
  static const String screenRoute = 'contact_us';

  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _userController=Get.find<UserController>(tag: 'user_controller');

  final messageController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('contact_us'.tr,style:const TextStyle(color: Colors.white),),backgroundColor: kPrimary,leading: IconButton(onPressed: (){
        Get.back();
      }, icon:const Icon(Icons.arrow_back_ios,color: Colors.white,)),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'contact_us'.tr,
              style:const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
           const  SizedBox(height: 8),
            Text(
              'Get_in_touch_with_a_member_of_our_coaching_staff.'.tr,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
           const   SizedBox(height: 16),
            Container(
              height: 150,
              padding:const EdgeInsetsDirectional.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimary.withOpacity(0.4),
                borderRadius: BorderRadiusDirectional.circular(20)
              ),
              child: TextFormField(
                style:const TextStyle(
                  color: Colors.white
                ),
                controller: messageController,
                decoration: InputDecoration(
                  prefixIcon:const Icon(Icons.email,color: Colors.white,),
                  hintText: 'Write you_message_here'.tr,
                 hintStyle:const TextStyle(
                   color: Colors.white
                 ),
                  border: InputBorder.none

                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: AlignmentDirectional.center,
              child: Container(
                width: double.infinity,
                child: MyButton(color: kPrimary, title: 'send_message'.tr, onPressed: (){

                  if(messageController.text.isNotEmpty){
                    _userController.sendContactUsMessage(message: messageController.text);
                    messageController.clear();

                  }
                  else{
                    Utils.MyToast(title: 'Message is required');
                      }


                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}