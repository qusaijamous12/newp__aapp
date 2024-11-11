
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradproject/controller/user_controller.dart';
import 'package:gradproject/models/announcment_model.dart';
import 'package:gradproject/shared/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _userController=Get.find<UserController>(tag: 'user_controller');



  @override
  void initState() {
    Future.delayed(Duration.zero,()async{
      await _userController.getAllAnnouncment();
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Obx(()=>Column(
      children: [
        // Removed the logo container here

        Padding(
          padding: const EdgeInsets.all(20.0),
          child: CarouselSlider(

              items: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(20)
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child:const Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJMuleu9jI4ckyd4_uoEzyPgEIDiHz_0curA&s'),fit: BoxFit.cover,)),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(20)
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child:const Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9u74cuvXEVo7blBeLU0Ue8QeLwDSg_g543Q&s'),fit: BoxFit.cover,)),

                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(20)
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuADGAhVAMK5jPhwH7Yq3vZclk9mg4d4ywhQ&s'),fit: BoxFit.cover,)),

              ],
              options: CarouselOptions(
                  height: 250,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval:const Duration(seconds: 3),
                  autoPlayAnimationDuration:const Duration(seconds: 1),
                  autoPlayCurve: Curves.easeInExpo,
                  scrollDirection: Axis.horizontal,
                  viewportFraction: 1 // we use it to solve the problem of images that occuer when we dont use it try to put insted of 1 0.4 and you will see the problem
              )),
        ),


          Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           const   Align(
                alignment: AlignmentDirectional.topStart,
                child:  Text(
                  'PNU SPORT CLUB',
                  style: TextStyle(
                    fontSize: 24,
                    color: kPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const  SizedBox(height: 20),
                Text(
                'announcements'.tr,
                style:const TextStyle(
                  fontSize: 22,
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ConditionalBuilder(
              condition: _userController.isLoading,
              builder: (context)=>const Center(child: CircularProgressIndicator(color: kPrimary,)),
              fallback: (context){
                if(_userController.announcmentModel.isNotEmpty){
                  return ListView.builder(

                    itemCount: _userController.announcmentModel.length,
                    itemBuilder: (context, index) =>buildAnnouncmentItem(_userController.announcmentModel[index]),
                  );
                }
                else {
                  return  Center(child:  Text('There_is _no_announcment'.tr));
                }
              }),
        ),

      ],
    ));
  }
  Widget buildAnnouncmentItem(AnnouncmentModel model)=>Card(
    margin:const EdgeInsets.all(8),
    child: ListTile(
      title: Text(
        '${model.title}',
        style:const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${model.date} At ${model.time}'),
          const SizedBox(height: 4),
          Text('${model.news}'),
        ],
      ),
    ),
  );
}
