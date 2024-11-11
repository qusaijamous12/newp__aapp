import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradproject/controller/user_controller.dart';

import '../../shared/colors.dart';

class MembershipRenewalScreen extends StatefulWidget {
  const MembershipRenewalScreen({super.key});

  @override
  State<MembershipRenewalScreen> createState() => _MembershipRenewalScreenState();
}

class _MembershipRenewalScreenState extends State<MembershipRenewalScreen> {
  final _userController=Get.find<UserController>(tag: 'user_controller');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Membership_renewal'.tr,style:const TextStyle(color: Colors.white),),backgroundColor: kPrimary,leading: IconButton(onPressed: (){
        Get.back();
      }, icon:const Icon(Icons.arrow_back_ios,color: Colors.white,)),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              padding:const EdgeInsetsDirectional.all(15),
              decoration:const BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(20),
                  bottomEnd: Radius.circular(20)
                ),
                color: kPrimary
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/219/219986.png'),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Text
                      (
                      'Hello ${_userController.userModel.userName}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
           Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                  Text(
                    'Please Chose The Way that You want_to_make_Renewal_using_it'.tr,
                    style:const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
        
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    children: [
                      Image.network('https://cdn4.iconfinder.com/data/icons/vector-brand-logos/40/Apple_Pay-512.png',height: 150,width: 150,fit: BoxFit.fill,),
                      const SizedBox(
                        width: 20,
                      ),
                     const Text(
                        'Apply Pay',style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: (){},
                          icon:const Icon(Icons.arrow_forward_ios,color: Colors.black,))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    children: [
                      Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQP5mcINyo_1AKdaoR7m5EjUc02LKdzIpRAH6E2OQuspovJ7OlBn4T0KCRDHV7bcnJzR8k&usqp=CAU',height: 150,width: 150,fit: BoxFit.fill,),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'Visa',style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                      ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: (){},
                          icon:const Icon(Icons.arrow_forward_ios,color: Colors.black,))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    children: [
                      Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/MasterCard_Logo.svg/1280px-MasterCard_Logo.svg.png',height: 150,width: 150,fit: BoxFit.fill,),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'Master Card',style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                      ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: (){},
                          icon:const Icon(Icons.arrow_forward_ios,color: Colors.black,))
                    ],
                  ),
                ),

              ],
            ),
          )
          ],
        ),
      ),


    );
  }
}
