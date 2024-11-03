import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradproject/controller/user_controller.dart';
import 'package:gradproject/views/user_auth_cycle/registration_screen.dart';
import 'package:gradproject/shared/colors.dart';

import '../../shared/utils/utils.dart';
import '../../widegts/my_button.dart';


class SignInScreen extends StatefulWidget {
  static const String screenRoute='sigin_screen';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
 final emailController=TextEditingController();
 final passwordController=TextEditingController();
 final _userController=Get.find<UserController>(tag: 'user_controller');

 bool isObsecure=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
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
                   const SizedBox(height: 50),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,

                      decoration:const InputDecoration(
                        hintText: 'Enter your Email',
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
                        prefixIcon: Icon(Icons.email_outlined,color: kPrimary,)
                      ),
                    ),
                   const SizedBox(height: 8),
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
                   const SizedBox(height: 10),
                    Obx(()=>ConditionalBuilder(
                        condition: _userController.isLoading,
                        builder: (context)=>const Center(child: CircularProgressIndicator(backgroundColor: kPrimary,)) ,
                        fallback: (context)=>MyButton(
                          color: const Color.fromARGB(170, 4, 131, 72),
                          title: 'Sign in',
                          onPressed: ()async {
                            if(emailController.text.isNotEmpty&&passwordController.text.isNotEmpty){
                              _userController.loginInWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value){
                                emailController.clear();
                                passwordController.clear();
                              });
                            }
                            else{
                              Utils.MyToast(title: 'Email and Password is required');
                            }


                          },
                        ))),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                       const Text(
                          'Don\'t have an account ? '
                        ),
                        TextButton(
                            onPressed: (){
                              Get.off(()=>const RegistrationScreen());
                            },
                            child:const Text(
                              'Sign Up',
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
      ),
    );
  }
}