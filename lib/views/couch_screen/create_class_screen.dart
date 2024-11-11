import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradproject/controller/couch_controller.dart';
import 'package:gradproject/controller/user_controller.dart';
import 'package:gradproject/shared/colors.dart';
import 'package:gradproject/shared/utils/utils.dart';
import 'package:gradproject/widegts/my_button.dart';

class CreateClassScreen extends StatefulWidget {
  const CreateClassScreen({super.key});

  @override
  State<CreateClassScreen> createState() => _CreateClassScreenState();
}

class _CreateClassScreenState extends State<CreateClassScreen> {
  final className=TextEditingController();
  final classTime=TextEditingController();
  final classDate=TextEditingController();
  final coachName=TextEditingController();
  final _userController=Get.find<UserController>(tag: 'user_controller');
  final _couchController=Get.find<CouchController>(tag: 'couch_controller');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child:  SingleChildScrollView(
        child: Column(
          children: [
            Text(
                'Please fill the following_fields_to_Create_Class...'.tr,
              style:const TextStyle(
                color: kPrimary,
                fontWeight: FontWeight.w500,
                fontSize: 18
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: className,
        
              decoration: InputDecoration(
                  hintText: 'Enter_Your_Class_Name'.tr,
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
                      color:  Color.fromARGB(170, 4, 131, 72),
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
                  prefixIcon: Icon(Icons.drive_file_rename_outline,color: kPrimary,)
              ),
            ),
           const  SizedBox(
              height: 15,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: classTime,
              onTap: (){
                showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value){
                  classTime.text=value!.format(context).toString();
                  setState(() {
        
                  });
                });
              },
        
              decoration: InputDecoration(
                  hintText: 'Enter_Your_Class_Time'.tr,
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
                      color:  Color.fromARGB(170, 4, 131, 72),
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
                  prefixIcon:const Icon(Icons.watch_later,color: kPrimary,)
              ),
            ),
            const  SizedBox(
              height: 15,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: classDate,
        
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
                  classDate.text = formattedDate;
                  setState(() {
        
                  });
                }
        
              },
        
              decoration: InputDecoration(
                  hintText: 'Enter_Your_Class_Date'.tr,
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
                      color:  Color.fromARGB(170, 4, 131, 72),
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
            const  SizedBox(
              height: 15,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: coachName,
        
              decoration: InputDecoration(
                  hintText: 'Enter_Your_Name'.tr,
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
                      color:  Color.fromARGB(170, 4, 131, 72),
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
                  prefixIcon:const Icon(Icons.drive_file_rename_outline,color: kPrimary,)
              ),
            ),
            const  SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(()=>ConditionalBuilder(
                  condition: _couchController.isLoading,
                  builder: (context)=>const Center(child: CircularProgressIndicator(color: kPrimary,)),
                  fallback: (context)=>Container(
                      width: double.infinity,
        
        
                      child: MyButton(color: kPrimary, title: 'create'.tr, onPressed: (){
                        if(className.text.isEmpty||classDate.text.isEmpty||classTime.text.isEmpty||coachName.text.isEmpty){
                          Utils.MyToast(title: 'All Fields is required');
                        }
                        else{_couchController.createCouchClass(couchName: coachName.text, classTime: classTime.text, classDate: classDate.text, className: className.text, uid: _userController.userModel.uid!);
                          coachName.clear();
                          className.clear();
                          classDate.clear();
                          classTime.clear();
        
        
        
        
                        }
                      })))),
            )
        
          ],
        
        ),
      ),
    );
  }
}
