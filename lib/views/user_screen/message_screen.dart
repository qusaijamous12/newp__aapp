import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradproject/controller/home_controller.dart';
import 'package:gradproject/controller/user_controller.dart';
import 'package:gradproject/models/chat_model.dart';
import 'package:gradproject/shared/utils/utils.dart';

import '../../shared/colors.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key,required this.receiverId});
  final String receiverId;

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final _userController=Get.find<UserController>(tag: 'user_controller');
  final _homeController=Get.find<HomeController>(tag: 'home_controller');
  @override
  void initState() {
    // Future.delayed(Duration.zero,()async{
    // await  _userController.getMessages(receiverId:widget.receiverId);
    //
    // });
    super.initState();
  }

  final _messageController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(

      builder: (BuildContext context) {
        _userController.getMessages(receiverId:widget.receiverId);


        return Scaffold(
          appBar: AppBar(
            title: Text('Chat_Screen'.tr,style:const TextStyle(color: Colors.white),),backgroundColor: kPrimary,leading: IconButton(onPressed: (){
            Get.back();
          }, icon:const Icon(Icons.arrow_back_ios,color: Colors.white,)),),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Obx(()=>Expanded(
                  child: Container(
                    padding:const EdgeInsetsDirectional.all(20),
                    decoration: BoxDecoration(
                        color: kPrimary.withOpacity(0.2),
                        borderRadius: BorderRadiusDirectional.circular(20)
                    ),
                    child: ListView.separated(
                        shrinkWrap: true,


                        itemBuilder: (context,index){
                          if(_userController.listChatModel[index].senderId!=_userController.uid)
                          {
                            return   buildMessage(_userController.listChatModel[index]);
                          }else{
                            return  buildMyMessage(_userController.listChatModel[index]);
                          }
                        },
                        separatorBuilder: (context,index)=>const SizedBox(
                          height: 20,
                        ),
                        itemCount: _userController.listChatModel.length),

                  ),
                )),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding:const EdgeInsetsDirectional.only(
                      start: 7
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer ,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey,
                          width: 1

                      ),
                      borderRadius: BorderRadius.circular(15 )
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          // DoctorCubit.get(context).openGalaryToSendImage();
                        },
                        child:const CircleAvatar(
                          child: Icon(Icons.image, color: Colors.grey,),
                          backgroundColor: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _messageController,
                          decoration: InputDecoration(
                              hintText: 'type_your_message_here'.tr,
                              border: InputBorder.none
                          ),
                        ),

                      ),
                      Container(
                        color: kPrimary,
                        height: 60,
                        width: 60,

                        child: IconButton(
                            onPressed: (){
                              if(_messageController.text.isNotEmpty){
                                _userController.sendMessage(receiverId: widget.receiverId, dateTime: DateTime.now().toString(), text: _messageController.text);
                                _messageController.clear();

                              }else{
                                Utils.MyToast(title: 'Message is Requierd');
                              }

                            },
                            icon:const Icon(
                              Icons.send,
                              color: Colors.white,

                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

        );
      },
    );
  }
  Widget buildMessage(ChatModel model)=> Align(
    alignment: AlignmentDirectional.centerStart,
    child: Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/219/219986.png'),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          padding:const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 5
          ),
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius:const BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(10),
                topStart: Radius.circular(10),
                topEnd: Radius.circular(10),



              )
          ),
          child: Text(
              '${model.text}',
            style:const TextStyle(
              fontSize: 18
            ),
          ),
        ),
      ],
    ),
  );
  Widget buildMyMessage(ChatModel model)=>  Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Row(

      textDirection: _homeController.currentLanguage=='en'?TextDirection.rtl:TextDirection.ltr,
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/219/219986.png'),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          padding:const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 5
          ),
          decoration:const BoxDecoration(
              color: kPrimary,
              borderRadius:const BorderRadiusDirectional.only(
                bottomStart: Radius.circular(10),
                topStart: Radius.circular(10),
                topEnd: Radius.circular(10),



              )
          ),
          child: Text(
              '${model.text}',
            style:const TextStyle(
              color: Colors.white,
              fontSize: 18
            ),
          ),
        ),
      ],
    ),
  );
}
