import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradproject/controller/user_controller.dart';
import 'package:gradproject/models/user_model.dart';
import 'package:gradproject/views/user_screen/message_screen.dart';

import '../../shared/colors.dart';

class ChatListingScreen extends StatefulWidget {
  const ChatListingScreen({super.key,required this.isUser});
  final bool isUser;


  @override
  State<ChatListingScreen> createState() => _ChatListingScreenState();
}

class _ChatListingScreenState extends State<ChatListingScreen> {
  final _userController=Get.find<UserController>(tag: 'user_controller');

  @override
  void initState() {
    if(widget.isUser){
      Future.delayed(Duration.zero,()async{
        await _userController.getAllCoaches();

      });
    }
    else{
      Future.delayed(const Duration(seconds:1 ),()async{
        await _userController.getAllUsers();
        if(mounted){
          setState(() {

          });
        }

      });

    }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      appBar: AppBar(
        title: Text('Chat_Screen'.tr,style:const TextStyle(color: Colors.white),),backgroundColor: kPrimary,leading: IconButton(onPressed: (){
        Get.back();
      }, icon:const Icon(Icons.arrow_back_ios,color: Colors.white,)),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ConditionalBuilder(
                condition: _userController.isLoading,
                builder: (context)=>const Center(child: CircularProgressIndicator(color: kPrimary,)),
                fallback: (context)=>Expanded(
                  child: ListView.separated(

                      itemBuilder: (context,index)=>buildUserItem(widget.isUser? _userController.listCoaches[index]:_userController.listUsers[index]),
                      separatorBuilder: (context,index)=>Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Divider(
                          height: 1,
                          thickness: 2,
                          color: Colors.grey[200],
                        ),
                      ),
                      itemCount:widget.isUser? _userController.listCoaches.length:_userController.listUsers.length),
                ))

          ],
        ),
      ),
    ));
  }
  Widget buildUserItem(UserModel user)=> GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: (){
      Get.to(()=> MessageScreen(receiverId:user.uid! ,));
    },
    child: Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/219/219986.png'),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${user.userName}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                ),
              ),
              Text(
                '${user.phoneNumber}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
        ),
       const Spacer(),
        Text(
          '${user.idNumber}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style:const TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.w500
          ),
        ),


      ],
    ),
  );

}
