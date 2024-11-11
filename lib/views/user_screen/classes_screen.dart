import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradproject/controller/user_controller.dart';
import 'package:gradproject/models/class_model.dart';
import 'package:gradproject/shared/colors.dart';
import 'package:gradproject/widegts/my_button.dart';

class ClassesScreen extends StatefulWidget {
  const ClassesScreen({super.key});

  @override
  State<ClassesScreen> createState() => _ClassesScreenState();
}

class _ClassesScreenState extends State<ClassesScreen> {

  bool isMyClasses=false;
  final _userController=Get.find<UserController>(tag: 'user_controller');
  @override
  void initState() {
    Future.delayed(Duration.zero,()async{
      await _userController.getAllClasses();
    });
    Future.delayed(Duration.zero,()async{
      await _userController.getMyAcceptedClasses();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    isMyClasses=!isMyClasses;
                    setState(() {

                    });

                  },
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    height: 50,
                    decoration: BoxDecoration(
                      color: isMyClasses?Colors.white:kPrimary,
                      borderRadius: BorderRadiusDirectional.circular(20)
                    ),

                    child: Text(
                      'classes'.tr,
                      style: TextStyle(
                        color: isMyClasses?kPrimary:Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    isMyClasses=!isMyClasses;
                    setState(() {

                    });

                  },
                  child: Container(
                    alignment: AlignmentDirectional.center,

                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(20),
                      color: isMyClasses?kPrimary:Colors.white,
                    ),
                    child: Text(
                      'My_Classes'.tr,
                      style: TextStyle(
                          color: isMyClasses?Colors.white:kPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        if(!isMyClasses)
        Expanded(
          child: Obx(()=>ConditionalBuilder(
              condition: _userController.isLoading,
              builder: (context)=>const Center(child: CircularProgressIndicator()),
              fallback: (context){
                if(_userController.classesModel.isNotEmpty){
                  return ListView.separated(
                      padding:const EdgeInsetsDirectional.all(20),
                      itemBuilder: (context,index)=>buildClassItem(_userController.classesModel[index]),
                      separatorBuilder: (context,index)=>const SizedBox(
                        height: 10,
                      ),
                      itemCount: _userController.classesModel.length);
                }
                else{
                  return const Center(child:  Text('There is No Classes ! '));
                }
              })),
        ),
        if(isMyClasses)
          Expanded(
            child: ConditionalBuilder(condition: _userController.isLoading, builder: (context)=>const Center(child: CircularProgressIndicator(color: kPrimary,)), fallback: (context){
              if(_userController.myAcceptClasses.isNotEmpty){
                return ListView.separated(
                    padding:const EdgeInsetsDirectional.all(20),
                    itemBuilder: (context,index)=>buildClassItem(_userController.myAcceptClasses[index],isButton: false),
                    separatorBuilder: (context,index)=>const SizedBox(
                      height: 10,
                    ),
                    itemCount: _userController.myAcceptClasses.length);
              }
              else {
                return const Center(child: Text('You Dont Have Any Classes',style: TextStyle(color: kPrimary),));
              }
            }),
          )
      ],
    );
  }

  Widget buildClassItem(ClassesModel model,{bool isButton=true})=> Container(
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
                  'Class Title :${model.className}'.tr,
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
                  'Coach Name :${model.couchName??model.className}'.tr,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style:const TextStyle(
                      color: kPrimary,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const Spacer(),
                 Text(
                    'Time for The Class :${model.classDate} At ${model.classTime}'.tr,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style:const TextStyle(
                        color: kPrimary,
                        fontWeight: FontWeight.bold
                    )
                ),
               const SizedBox(
                  height: 10,
                ),
                if(isButton)
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          _userController.acceptClasses(classTitle: model.className!, className: model.className!, classTime: model.classTime!, classDate: model.classDate!,uid:model.uid!);
                        },
                        child: Container(
                          height: 35,
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                            color: kPrimary,
                            borderRadius: BorderRadiusDirectional.circular(20)
                          ),
                          child: Text('accept'.tr,
                          style:const TextStyle(
                            color: Colors.white
                          ),),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        height: 35,
                        alignment: AlignmentDirectional.center,
                        decoration: BoxDecoration(
                            color: const Color(0xff2e386b),
                            borderRadius: BorderRadiusDirectional.circular(20)
                        ),
                        child: Text('decline'.tr,
                          style:const TextStyle(
                              color: Colors.white
                          ),),
                      ),
                    ),
                  ],
                )


              ],
            ),
          ),
        )
      ],
    ),
  );
}
