import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../controller/admin_controller.dart';
import '../../models/user_model.dart';
import '../../shared/colors.dart';

class CoachesScreen extends StatefulWidget {
  const CoachesScreen({super.key});

  @override
  State<CoachesScreen> createState() => _CoachesScreenState();
}

class _CoachesScreenState extends State<CoachesScreen> {
  final _adminController = Get.find<AdminController>(tag: 'admin_controller');

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await _adminController.getAllCoaches();
    });
  }


  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:const EdgeInsetsDirectional.all(20),
      child: Obx(()=>ConditionalBuilder(
          condition: _adminController.isLoading,
          builder: (context)=>const Center(child: CircularProgressIndicator(color: kPrimary,)),
          fallback: (context)=>Column(
            children: [
              if(_adminController.allCoaches.isNotEmpty)
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context,index)=>buildAdminItem(_adminController.allCoaches[index]),
                  separatorBuilder: (context,index)=>Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 1,
                      thickness: 2,
                      color: Colors.grey[200],
                    ),
                  ),
                  itemCount: _adminController.allCoaches.length),
              if(_adminController.allCoaches.isEmpty)
              const  Text('There is no Coaches !',style: TextStyle(color: kPrimary,fontSize: 25,fontWeight: FontWeight.w500),)

            ],
          ))),
    );
  }

  Widget buildAdminItem(UserModel model)=> Row(
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

