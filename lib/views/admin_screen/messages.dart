import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradproject/controller/admin_controller.dart';
import 'package:gradproject/models/message_model.dart';
import 'package:gradproject/shared/colors.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final _adminController=Get.find<AdminController>(tag: 'admin_controller');

  @override
  void initState() {
    Future.delayed(Duration.zero,()async{
      await _adminController.getAllMessages();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimary,
        title: Text(
          'Chat_Screen'.tr,
          style:const TextStyle(
            color: Colors.white
          ),

        ),
        leading: IconButton(onPressed: (){Get.back();}, icon:const Icon(Icons.arrow_back_ios,color: Colors.white,)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.all(20),
        child: Column(
          children: [
     
            Obx(()=>ConditionalBuilder(
                condition: _adminController.isLoading,
                builder: (context)=>const Center(child: CircularProgressIndicator(color: kPrimary,)),
                fallback: (context){
                  if(_adminController.allMessages.isNotEmpty){
                    return ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context,index)=>buildMessageItem(_adminController.allMessages[index]),
                        separatorBuilder: (context,index)=>const SizedBox(height: 15,),
                        itemCount: _adminController.allMessages.length);
                  }
                  else {
                    return const Center(child: Text('There is No Messages',style: TextStyle(
                        color: kPrimary,
                        fontSize: 25,
                        fontWeight: FontWeight.w500
                    ),));
                  }
                }))
            
          ],
        ),
      ),
    );
  }

  Widget buildMessageItem(MessageModel model)=> Card(
    elevation: 20,
    child: Container(
      padding:const EdgeInsetsDirectional.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(20)
      ),
      child:  Row(
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
                  '${model.name}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:const TextStyle(
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  'Message Info :${model.message} ',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:const TextStyle(
                      fontWeight: FontWeight.w500
                  ),
                ),
                 Text(
                  'User Id :${model.userId} ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
