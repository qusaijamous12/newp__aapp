import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradproject/controller/admin_controller.dart';
import 'package:gradproject/controller/user_controller.dart';
import 'package:gradproject/models/user_model.dart';
import 'package:gradproject/shared/colors.dart';
import 'package:loading_overlay/loading_overlay.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final _adminController=Get.find<AdminController>(tag: 'admin_controller');

  @override
  void initState() {
   Future.delayed(Duration.zero,()async{

     await  _adminController.getAllUsers();

   });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:const EdgeInsetsDirectional.all(20),
      child: Obx(()=>ConditionalBuilder(
          condition: _adminController.isLoading,
          builder: (context)=>const Center(child: CircularProgressIndicator(color: kPrimary,)),
          fallback: (context)=>Column(
        children: [
          if(_adminController.allUsers.isNotEmpty)
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context,index)=>buildUserItem(_adminController.allUsers[index]),
              separatorBuilder: (context,index)=>Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Divider(
                  height: 1,
                  thickness: 2,
                  color: Colors.grey[200],
                ),
              ),
              itemCount: _adminController.allUsers.length),
          if(_adminController.allUsers.isEmpty)
          const  Text('There is no Users !',style: TextStyle(color: kPrimary,fontSize: 25,fontWeight: FontWeight.w500),)

        ],
      ))),
    );
  }

  Widget buildUserItem(UserModel model)=> Row(
    children: [
      const CircleAvatar(
        radius: 40,
        backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/219/219986.png'),
      ),
      const SizedBox(
        width: 10,
      ),
      Text(
        '${model.userName}',
        style:const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500
        ),
      )
    ],
  );
}
