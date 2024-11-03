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
           const Text(
                'Please fill the following fields to Create Class...',
              style: TextStyle(
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
        
              decoration:const InputDecoration(
                  hintText: 'Enter Your Class Name',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(170, 4, 131, 72),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
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
        
              decoration:const InputDecoration(
                  hintText: 'Enter Your Class Time',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(170, 4, 131, 72),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  prefixIcon: Icon(Icons.watch_later,color: kPrimary,)
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
        
              decoration:const InputDecoration(
                  hintText: 'Enter Your Class Date',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(170, 4, 131, 72),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  prefixIcon: Icon(Icons.date_range,color: kPrimary,)
              ),
            ),
            const  SizedBox(
              height: 15,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: coachName,
        
              decoration:const InputDecoration(
                  hintText: 'Enter Your Name',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(170, 4, 131, 72),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
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
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(()=>ConditionalBuilder(
                  condition: _couchController.isLoading,
                  builder: (context)=>const Center(child: CircularProgressIndicator(color: kPrimary,)),
                  fallback: (context)=>Container(
                      width: double.infinity,
        
        
                      child: MyButton(color: kPrimary, title: 'Create', onPressed: (){
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
