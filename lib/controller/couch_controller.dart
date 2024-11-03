import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gradproject/controller/user_controller.dart';
import 'package:gradproject/models/class_model.dart';
import 'package:gradproject/views/couch_screen/create_class_screen.dart';
import 'package:gradproject/views/couch_screen/home_screen.dart';
import 'package:gradproject/views/couch_screen/myclass_screen.dart';

import '../shared/utils/utils.dart';

class CouchController extends GetxController{
  final _titles=RxList<String>([
    'Home Screen',
    'MyClasses Screen',
    'Create Class Screen',


  ]);
  final _currentIndex=RxInt(0);
  final _screens=RxList<Widget>(const[
    HomeScreen(),
    MyClassScreen(),
    CreateClassScreen(),


  ]);
  final _isLoading=RxBool(false);
  final _myClasses=RxList<ClassesModel>([]);
  final _userController=Get.find<UserController>(tag: 'user_controller');


  void changeCurrentIndex(int index){
    print('index is $index');
    _currentIndex(index);
  }

  Future createCouchClass ({required String couchName,required String classTime,required String classDate,required className,required String uid})async{
    _isLoading(true);
    FirebaseFirestore.instance.collection('classes').add({
      'couch_name':couchName,
      'class_date':classDate,
      'class_name':couchName,
      'uid':uid,
      'class_time':classTime

    }).then((value){
      Utils.MyToast(title: 'Create Class Success ! ');

    }).catchError((error){
      print('there is an error when create couch class !');
    });
    _isLoading(false);

  }
  
  Future getMyCoachClasses()async{
    _myClasses.clear();
    _isLoading(true);
   await FirebaseFirestore.instance.collection('classes').get().then((value){
      value.docs.forEach((element){
        if(element['uid']==_userController.userModel.uid){
          _myClasses.add(ClassesModel.fromJson(element.data()));
        }
        print('sss${_myClasses.length}');
      });


    }).catchError((error){
      print('there is an error when get my coach classes !');
    });
    _isLoading(false);
  }


  int get currentIndex=>_currentIndex.value;

  List<String> get titles=>_titles.value;
  List<Widget> get screens=>_screens.value;
  bool get isLoading=>_isLoading.value;
  List<ClassesModel> get myClassesModel=>_myClasses;
}