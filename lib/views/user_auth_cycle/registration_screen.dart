// ignore_for_file: avoid_print, unused_local_variable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradproject/controller/user_controller.dart';
import 'package:gradproject/views/user_auth_cycle/signin_screen.dart';
import 'package:gradproject/shared/utils/utils.dart';

import '../../shared/colors.dart';
import '../../widegts/my_button.dart';


class RegistrationScreen extends StatefulWidget {
  static const String screenRoute = 'registration_screen';

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
 // final _auth = FirebaseAuth.instance;
  final _userController=Get.find<UserController>(tag: 'user_controller');
  final emailController=TextEditingController();
  final nameController=TextEditingController();
  final passwordController=TextEditingController();
  final idNumberController=TextEditingController();
  final phoneController=TextEditingController();
  final ageController=TextEditingController();
  final collegeController=TextEditingController();
  bool isObsecure=true;



  String? isMember; 

  bool showSpinner = false;

  
  InputDecoration inputDecoration =const InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
    enabledBorder: OutlineInputBorder(
   borderSide: BorderSide(   color: const Color.fromARGB(170, 4, 131, 72), width: 1,
                    ),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 180,
                    child: Image.asset('assets/images/logosss.png'),
                  ),
                 const SizedBox(height: 10),

                  // Membership question
                  RadioListTile(
                    title: Text('member_of_princess_nourah_university'.tr),
                    value: 'yes',
                    groupValue: isMember,
                    onChanged: (value) {
                      print('value is $value');
                      setState(() {
                        isMember = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('No_I_am_not_a_member'.tr),
                    value: 'no',
                    groupValue: isMember,
                    onChanged: (value) {
                      setState(() {
                        isMember = value;
                      });
                    },
                  ),
                 const SizedBox(height: 10),

                  // Full Name input field
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: nameController,

                    decoration: InputDecoration(
                        hintText: 'Enter_your_Full_Name'.tr,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(170, 4, 131, 72),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        prefixIcon:const Icon(Icons.person,color: kPrimary,)
                    ),
                  ),
                 const SizedBox(height: 8),



                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,

                    decoration: InputDecoration(
                        hintText: 'enter_your_email'.tr,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(170, 4, 131, 72),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        prefixIcon:const Icon(Icons.email_outlined,color: kPrimary,)
                    ),
                  ),
                  const SizedBox(height: 8),


                  // Password input field
                  TextField(
                    obscureText: isObsecure,
                    controller: passwordController,

                    decoration:  InputDecoration(
                        hintText: 'enter_your_password'.tr,
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
                            color: Color.fromARGB(170, 4, 131, 72),
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
                        prefixIcon:const Icon(Icons.lock_outline,color: kPrimary,),
                        suffixIcon: InkWell(
                            onTap: () {
                              isObsecure=!isObsecure;
                              setState(() {

                              });
                            },
                            child: Icon(isObsecure?Icons.visibility_off_outlined:Icons.visibility_outlined,color: kPrimary,))
                    ),
                  ),
                 const SizedBox(height: 8),




                  // ID Number input field
                  if(isMember=='yes')...[
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: idNumberController,

                      decoration: InputDecoration(
                          hintText: 'Enter_your_ID_Number'.tr,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color.fromARGB(170, 4, 131, 72),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          prefixIcon:const Icon(Icons.numbers,color: kPrimary,)
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      keyboardType: TextInputType.text,
                      controller: collegeController,

                      decoration: InputDecoration(
                          hintText: 'Enter your college name'.tr,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color.fromARGB(170, 4, 131, 72),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          prefixIcon:const Icon(Icons.numbers,color: kPrimary,)
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],


                  // Phone Number input field
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: phoneController,

                    decoration: InputDecoration(
                        hintText: 'Enter_your_Phone_Number'.tr,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(170, 4, 131, 72),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        prefixIcon:const Icon(Icons.numbers,color: kPrimary,)
                    ),
                  ),
                const  SizedBox(height: 8),

                  // Age input field
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: ageController,

                    decoration: InputDecoration(
                        hintText: 'Enter_your_Age'.tr,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color.fromARGB(170, 4, 131, 72),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        prefixIcon:const Icon(Icons.numbers,color: kPrimary,)
                    ),
                  ),
                 const SizedBox(height: 10),

                  Obx(()=>ConditionalBuilder(
                    condition: _userController.isLoading,
                    builder: (context)=>const Center(child: CircularProgressIndicator(backgroundColor: kPrimary,)),
                    fallback: (context)=>MyButton(
                      color: const Color.fromARGB(170, 4, 131, 72),
                      title: 'register'.tr,
                      onPressed: () async {

                        if(isMember=='yes'){
                          if(emailController.text.isEmpty||passwordController.text.isEmpty||phoneController.text.isEmpty||nameController.text.isEmpty||idNumberController.text.isEmpty||ageController.text.isEmpty||collegeController.text.isEmpty){
                            Utils.MyToast(title: 'All fields are required');
                          }else{
                           await _userController.createAccount(collegeName: collegeController.text,email: emailController.text, password: passwordController.text, phoneNumber: phoneController.text, userName: nameController.text, status: 0, idNumber: idNumberController.text, age: ageController.text).then((value){
                              emailController.clear();
                              passwordController.clear();
                              phoneController.clear();
                              ageController.clear();
                              idNumberController.clear();
                              nameController.clear();
                            });
                            emailController.clear();
                            passwordController.clear();
                            phoneController.clear();
                            nameController.clear();
                            idNumberController.clear();
                            ageController.clear();
                          }

                        }
                        else{
                          if(nameController.text.isEmpty||emailController.text.isEmpty||passwordController.text.isEmpty||phoneController.text.isEmpty||ageController.text.isEmpty){
                            Utils.MyToast(title: 'All fields are required');
                          }else{
                          await  _userController.createAccount(email: emailController.text, password: passwordController.text, phoneNumber: phoneController.text, userName: nameController.text, status: 0, age: ageController.text);

                          }
                        }



                      },
                    ),)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                       Text(
                          'Already_have_an_account_?'.tr
                      ),
                      TextButton(
                          onPressed: (){
                            Get.off(()=>const SignInScreen());
                          },
                          child: Text(
                            'sign_in'.tr,
                            style:const TextStyle(
                                color: kPrimary
                            ),
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}