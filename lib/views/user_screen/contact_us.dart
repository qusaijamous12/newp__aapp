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
      appBar: AppBar(title:const Text('Contact Us',style: TextStyle(color: Colors.white),),backgroundColor: kPrimary,leading: IconButton(onPressed: (){
        Get.back();
      }, icon:const Icon(Icons.arrow_back_ios,color: Colors.white,)),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Text(
              'Contact Us',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
           const  SizedBox(height: 8),
            Text(
              'Get in touch with a member of our coaching staff.',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
           const   SizedBox(height: 16),
            Container(
              height: 150,
              padding: EdgeInsetsDirectional.all(10),
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
                decoration:const InputDecoration(
                  prefixIcon: Icon(Icons.email,color: Colors.white,),
                  hintText: 'Wtite you message here ...',
                 hintStyle: TextStyle(
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
                child: MyButton(color: kPrimary, title: 'Send Message', onPressed: (){

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