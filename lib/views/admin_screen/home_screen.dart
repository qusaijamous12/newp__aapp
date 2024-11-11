import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradproject/controller/admin_controller.dart';
import 'package:gradproject/controller/user_controller.dart';
import 'package:gradproject/shared/colors.dart';
import 'package:gradproject/widegts/my_button.dart';

import '../../shared/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _adminController=Get.find<AdminController>(tag: 'admin_controller');
  final _userController=Get.find<UserController>(tag: 'user_controller');
  final _nameController=TextEditingController();
  final _ageController=TextEditingController();
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
  final _majorController=TextEditingController();
  final _coachId=TextEditingController();
  final _phoneController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:const EdgeInsetsDirectional.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello Admin ${_userController.userModel.userName}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style:const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: kPrimary
            ),

          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Please Fill the_following_data_to add a Coach'.tr,
            style: TextStyle(
              color: Colors.grey[500],
              fontWeight: FontWeight.w500,
              fontSize: 16
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: _nameController,

            decoration: InputDecoration(
                hintText: 'Enter_Coach_Name'.tr,
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
          const SizedBox(
            height: 15,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,

            decoration: InputDecoration(
                hintText: 'Enter_Coach_Email'.tr,
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
                prefixIcon:const Icon(Icons.email,color: kPrimary,)
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: _ageController,

            decoration: InputDecoration(
                hintText: 'Enter_Coach_Age'.tr,
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
          const SizedBox(
            height: 15,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: _majorController,

            decoration: InputDecoration(
                hintText: 'Enter_Coach_Major'.tr,
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
                prefixIcon:const Icon(Icons.sports_gymnastics,color: kPrimary,)
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: _passwordController,

            decoration: InputDecoration(
                hintText: 'Enter_Coach_Password'.tr,
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
                prefixIcon: Icon(Icons.lock_outline,color: kPrimary,)
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: _phoneController,

            decoration: InputDecoration(
                hintText: 'Enter_Coach_Phone'.tr,
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
          const SizedBox(
            height: 15,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: _coachId,

            decoration: InputDecoration(
                hintText: 'Enter_Coach_Id'.tr,
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
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Obx(()=>ConditionalBuilder(
                condition: _userController.isLoading,
                builder: (context)=>const Center(child: CircularProgressIndicator(color: kPrimary,)),
                fallback: (context)=>Container(
                  width: double.infinity,
                  child: MyButton(
                      color: kPrimary,
                      title: 'Add_Coach'.tr,
                      onPressed: (){
                        if(_emailController.text.isEmpty||_passwordController.text.isEmpty||_majorController.text.isEmpty||_passwordController.text.isEmpty||_ageController.text.isEmpty||_nameController.text.isEmpty){
                          Utils.MyToast(title: 'All Fields are Required');
                        }
                        else{
                          _userController.createAccount(
                              email: _emailController.text,
                              password: _passwordController.text
                              , phoneNumber:_phoneController.text ,
                              userName: _nameController.text,
                              status: 2, idNumber: _coachId.text,
                              major:_majorController.text,
                              age: _ageController.text);
                          _emailController.clear();
                          _passwordController.clear();
                          _passwordController.clear();
                          _nameController.clear();
                          _coachId.clear();
                          _majorController.clear();
                          _ageController.clear();


                        }



                      }),
                ))),
          )


        ],
      ),
    );
  }
}
