import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gradproject/models/message_model.dart';
import 'package:gradproject/models/user_model.dart';
import 'package:gradproject/views/admin_screen/coaches.dart';
import 'package:gradproject/views/admin_screen/home_screen.dart';
import 'package:gradproject/views/admin_screen/users.dart';

import '../shared/utils/utils.dart';

class AdminController extends GetxController{

  final _titles=RxList<String>([
    'Home_Screen',
    'Coaches_Screen',
    'Users_Screen',


  ]);
  final _currentIndex=RxInt(0);
  final _screens=RxList<Widget>(const[
    HomeScreen(),
    CoachesScreen(),
    UserScreen(),


  ]);
  final _allUsers=RxList<UserModel>([]);
  final _allCoaches=RxList<UserModel>([]);

  final _allMessages=RxList<MessageModel>([]);

  final _isLoading=RxBool(false);

  void changeCurrentIndex(int index){
    print('index is $index');
    _currentIndex(index);
  }

  Future getAllUsers()async{
    _allUsers.clear();
    _isLoading(true);
    await FirebaseFirestore.instance.collection('users').get().then((value){
      value.docs.forEach((element){
       if(element['status']==0){
         _allUsers.add(UserModel.fromJson(element.data()));
       }

      });
    }).catchError((error){
      print('there is an error when get all users !!!');
    });

    _isLoading(false);
  }

  Future getAllCoaches()async{
    _allCoaches.clear();
    _isLoading(true);

    await FirebaseFirestore.instance.collection('users').get().then((value){
      value.docs.forEach((element){
        if(element['status']==2){
          _allCoaches.add(UserModel.fromJson(element.data()));
        }

      });
    }).catchError((error){
      print('there is an error when get all coaches !!!');
    });

    _isLoading(false);
  }

  Future getAllMessages()async{
    _isLoading(true);
    await FirebaseFirestore.instance.collection('messages').get().then((value){

      value.docs.forEach((element){
        _allMessages.add(MessageModel.fromJson(element.data()));
      });

    }).catchError((error){
      print('there is an error when get all messages !!');
    });

    _isLoading(false);

  }

  Future sendAnnouncmentForUsers({required String title,required String date,required String time,required String news})async{
    _isLoading(true);
    await FirebaseFirestore.instance.collection('announcment').add({
      'time':time,
      'title':title,
      'news':news,
      'date':date



    }).then((value){
      Utils.MyToast(title: 'Send Success ! ');

    }).catchError((error){
      print('there is an error in send announcment ! ');
    });
    _isLoading(false);

  }

  Future sendAnnouncmentForCoach({required String title,required String date,required String time,required String news})async{
    _isLoading(true);
    await FirebaseFirestore.instance.collection('announcment_coach').add({
      'time':time,
      'title':title,
      'news':news,
      'date':date



    }).then((value){
      Utils.MyToast(title: 'Send Success ! ');

    }).catchError((error){
      print('there is an error in send announcment ! ');
    });
    _isLoading(false);

  }



  int get currentIndex=>_currentIndex.value;

  List<String> get titles=>_titles;
  List<Widget> get screens=>_screens;
  List<UserModel> get allUsers=>_allUsers;
  bool get isLoading=>_isLoading.value;
  List<UserModel> get allCoaches=>_allCoaches;
  List<MessageModel> get allMessages=>_allMessages;


}