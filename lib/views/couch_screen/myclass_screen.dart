import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/couch_controller.dart';
import '../../models/class_model.dart';
import '../../shared/colors.dart';

class MyClassScreen extends StatefulWidget {
  const MyClassScreen({super.key});

  @override
  State<MyClassScreen> createState() => _MyClassScreenState();
}

class _MyClassScreenState extends State<MyClassScreen> {
  final _coachController=Get.find<CouchController>(tag: 'couch_controller');
  
  @override
  void initState() {
    Future.delayed(Duration.zero,()async{
      print('sssss');
      await _coachController.getMyCoachClasses();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Obx(()=>Column(
      children: [
        Expanded(
          child: ConditionalBuilder(
              condition: _coachController.isLoading,
              builder: (context)=>const Center(child: CircularProgressIndicator(color: kPrimary,)),
              fallback: (context){
                if(_coachController.myClassesModel.isNotEmpty){
                  return ListView.separated(
                      padding:const EdgeInsetsDirectional.all(20),
                      itemBuilder:(context,index)=>buildClassItem(_coachController.myClassesModel[index]) ,
                      separatorBuilder: (context,index)=>const SizedBox(
                        height: 10,
                      ),
                      itemCount: _coachController.myClassesModel.length);
                }
                else {
                  return const Center(
                    child: Text('You Dont Have Any Classes ! ',style: TextStyle(
                        color: kPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                    ),),
                  );
                }
              }),
        )
      ],
    ));
  }

  Widget buildClassItem(ClassesModel model)=> Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:BorderRadiusDirectional.circular(15)

    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Row(
      children: [
        const  Image(
            height: 150,
            width: 150,
            fit: BoxFit.cover,
            image: NetworkImage('https://d2o2hgyhrq7n36.cloudfront.net/sites/default/files/styles/2013_masthead/public/crop/pictures/primary_landing_group_exercise_0.jpg.webp?itok=2mwkyloD')),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            padding:const EdgeInsetsDirectional.all(5),
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Class Title :${model.className}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style:const TextStyle(
                      color: kPrimary,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Coach Name :${model.couchName??model.className}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style:const TextStyle(
                      color: kPrimary,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const Spacer(),
                Text(
                    'Time for the Class : ${model.classDate} At ${model.classTime}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style:const TextStyle(
                        color: kPrimary,
                        fontWeight: FontWeight.bold
                    )
                ),


              ],
            ),
          ),
        )
      ],
    ),
  );
}
