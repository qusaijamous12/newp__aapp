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
                    title:const Text(' Member of Princess Nourah University'),
                    value: 'yes',
                    groupValue: isMember,
                    onChanged: (value) {
                      setState(() {
                        isMember = value as String?;
                      });
                    },
                  ),
                  RadioListTile(
                    title:const Text('No, I am not a member'),
                    value: 'no',
                    groupValue: isMember,
                    onChanged: (value) {
                      setState(() {
                        isMember = value as String?;
                      });
                    },
                  ),
                 const SizedBox(height: 10),

                  // Full Name input field
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: nameController,

                    decoration:const InputDecoration(
                        hintText: 'Enter your Full Name',
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
                        prefixIcon: Icon(Icons.person,color: kPrimary,)
                    ),
                  ),
                 const SizedBox(height: 8),



                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,

                    decoration:const InputDecoration(
                        hintText: 'Enter your Email',
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
                        prefixIcon: Icon(Icons.email_outlined,color: kPrimary,)
                    ),
                  ),
                  const SizedBox(height: 8),


                  // Password input field
                  TextField(
                    obscureText: isObsecure,
                    controller: passwordController,

                    decoration:  InputDecoration(
                        hintText: 'Enter your password',
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
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: idNumberController,

                    decoration:const InputDecoration(
                        hintText: 'Enter your ID Number',
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
                        prefixIcon: Icon(Icons.numbers,color: kPrimary,)
                    ),
                  ),
                 const SizedBox(height: 8),

                  // Phone Number input field
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: phoneController,

                    decoration:const InputDecoration(
                        hintText: 'Enter your Phone Number',
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
                        prefixIcon: Icon(Icons.numbers,color: kPrimary,)
                    ),
                  ),
                const  SizedBox(height: 8),

                  // Age input field
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: ageController,

                    decoration:const InputDecoration(
                        hintText: 'Enter your Age',
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
                        prefixIcon: Icon(Icons.numbers,color: kPrimary,)
                    ),
                  ),
                 const SizedBox(height: 10),

                  Obx(()=>ConditionalBuilder(
                    condition: _userController.isLoading,
                    builder: (context)=>const Center(child: CircularProgressIndicator(backgroundColor: kPrimary,)),
                    fallback: (context)=>MyButton(
                      color: const Color.fromARGB(170, 4, 131, 72),
                      title: 'Register',
                      onPressed: () async {
                        if(emailController.text.isEmpty||passwordController.text.isEmpty||phoneController.text.isEmpty||nameController.text.isEmpty||idNumberController.text.isEmpty||ageController.text.isEmpty){
                          Utils.MyToast(title: 'All fields are required');
                        }else{
                          _userController.createAccount(email: emailController.text, password: passwordController.text, phoneNumber: phoneController.text, userName: nameController.text, status: 0, idNumber: idNumberController.text, age: ageController.text).then((value){
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



                      },
                    ),)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                          'Already have an account ? '
                      ),
                      TextButton(
                          onPressed: (){
                            Get.off(()=>const SignInScreen());
                          },
                          child:const Text(
                            'Sign In',
                            style: TextStyle(
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