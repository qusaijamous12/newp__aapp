import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/admin_controller.dart';
import '../../shared/colors.dart';
import '../../shared/utils/utils.dart';
import '../../widegts/my_button.dart';

class CreateAnnouncmentCouch extends StatefulWidget {
  const CreateAnnouncmentCouch({super.key});

  @override
  State<CreateAnnouncmentCouch> createState() => _CreateAnnouncmentCouchState();
}

class _CreateAnnouncmentCouchState extends State<CreateAnnouncmentCouch> {
  final _adminController=Get.find<AdminController>(tag: 'admin_controller');
  final titleController=TextEditingController();
  final dateController=TextEditingController();
  final timeController=TextEditingController();
  final newsController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimary,
        leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon:const Icon(Icons.arrow_back_ios,color: Colors.white,)),
        title: Text(
          'announcements'.tr,
          style:const TextStyle(
            color: Colors.white,

          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding:const EdgeInsetsDirectional.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(
                'Please_Fill_the_following_fields'.tr,
                style:const TextStyle(
                    color: kPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: titleController,

                decoration: InputDecoration(
                    hintText: 'Enter_Announcment_Title'.tr,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    border:const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder:const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(170, 4, 131, 72),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder:const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    prefixIcon:const Icon(Icons.title,color: kPrimary,)
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: dateController,

                onTap: ()async{
                  DateTime now = DateTime.now();
                  DateTime firstDate = now; // Start from today
                  DateTime lastDate = DateTime(now.year + 1, now.month, now.day);

                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: now,
                    firstDate: firstDate,
                    lastDate: lastDate,
                  );

                  if (picked != null && picked != now) {

                    String formattedDate = "${picked.toLocal()}".split(' ')[0];
                    dateController.text = formattedDate;
                    setState(() {

                    });
                  }

                },
                decoration: InputDecoration(
                    hintText: 'Enter_Announcment_Date'.tr,
                    contentPadding:const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    border:const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder:const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(170, 4, 131, 72),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder:const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    prefixIcon:const Icon(Icons.date_range,color: kPrimary,)
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: timeController,
                onTap: (){
                  showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value){

                    timeController.text=value!.format(context).toString();
                    setState(() {

                    });
                  });
                },


                decoration: InputDecoration(
                    hintText: 'Enter_Announcment_Time'.tr,
                    contentPadding:const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder:const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(170, 4, 131, 72),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder:const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    prefixIcon:const Icon(Icons.timer,color: kPrimary,)
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: newsController,


                decoration: InputDecoration(
                    hintText: 'Enter_Announcment_News'.tr,
                    contentPadding:const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    border:const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    enabledBorder:const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(170, 4, 131, 72),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder:const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),

                    prefixIcon:const Icon(Icons.newspaper,color: kPrimary,)
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Obx(()=>ConditionalBuilder(
                    condition: _adminController.isLoading,
                    builder: (context)=>const Center(child: CircularProgressIndicator(color: kPrimary,)),
                    fallback: (context)=>Container(
                      width: double.infinity,
                      child: MyButton(
                          color: kPrimary,
                          title: 'Add'.tr,
                          onPressed: ()async{
                            if(titleController.text.isEmpty||dateController.text.isEmpty||timeController.text.isEmpty||newsController.text.isEmpty){
                              Utils.MyToast(title: 'All Fields are Required');
                            }
                            else{
                              await  _adminController.sendAnnouncmentForCoach(title: titleController.text, news: newsController.text, time: timeController.text, date:dateController.text );

                              timeController.clear();
                              dateController.clear();
                              titleController.clear();
                              newsController.clear();

                            }
                          }),
                    ))),
              )


            ],
          ),
        ),
      ),
    );
  }
}
