import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:gradproject/models/announcment_model.dart';
import 'package:gradproject/models/class_model.dart';
import 'package:gradproject/models/user_model.dart';
import 'package:gradproject/views/user_screen/home_page.dart';

import '../shared/utils/utils.dart';

class UserController extends GetxController{

  final _uid=RxString('');
  final _isLoading=RxBool(false);
  final _userModel=Rx<UserModel>(UserModel());
  final _announcmentModel=RxList<AnnouncmentModel>([]);
  final _classesModel=RxList<ClassesModel>([]);
  final _myAcceptClasses=RxList<ClassesModel>([]);
  final _announcmentCoachModel=RxList<AnnouncmentModel>([]);



  Future loginInWithEmailAndPassword({required String email,required String password})async{
    _isLoading(true);


   await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value)async{
      if(value.user!.uid!=null){
        _uid(value.user!.uid);
        await getUserData(uid: _uid.value);




      }
      Utils.MyToast(title: 'Login Success');

    }).catchError((error){

      Utils.MyToast(title: 'Login Failed');

      print('There is an error is sign in method !');


    });
    _isLoading(false);

  }

  Future getUserData({required dynamic uid})async {

    await FirebaseFirestore.instance.collection('users').doc(uid).get().then((value){
      if(value.data()!=null) {
        _userModel(UserModel.fromJson(value.data()!));

        Get.offAll(()=>const HomePage());
      }

    }).catchError((error){
      print('There is an error when get userData');
      // emit(GetUserDataErrorState());
    });

  }

  Future createAccount({required String email,required String password,required String phoneNumber,required String userName,required int status,required String idNumber,required String age,final String ?major})async{
    _isLoading(true);

    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value)async{
      _uid(value.user?.uid);
      await FirebaseFirestore.instance.collection('users').doc(value.user!.uid).set({
        'uid':value.user!.uid,
        'email':email,
        'user_name':userName,
        'phone_number':phoneNumber,
        'status':status,
        'age':age,
        'major':'${major??''}',
        'idNumber':idNumber
      }).then((value){
        // loginModel=LoginModel(userName, email, status, lattiude, longtitude, phoneNumber,uid);
        //
        // emit(RegisterSuccessState());
        // emit(AddDataToFireStoreSuccessState());
        Utils.MyToast(title: 'Register Success');
      }).catchError((error){

        print('there is an error in add the data to firestore $error');

        // emit(AddDataToFireStoreErrorState());
      });




    }).catchError((error){
      Utils.MyToast(title: 'Register Failed');
      print('there is an error in register $error');


    });
    _isLoading(false);

  }

  Future sendContactUsMessage({required String message})async{

    await FirebaseFirestore.instance.collection('messages').add({
      'message':message,
      'name':_userModel.value.userName,
      'user_id':_userModel.value.idNumber,

    }).then((value){
      Utils.MyToast(title: 'Send Message Success');

    }).catchError((error){
      Utils.MyToast(title: 'Send Message Failed ! ');
      print('there is an error in sending the message');
    });

  }
  
  Future getAllAnnouncment()async{
    _announcmentModel.clear();
    _isLoading(true);
    await FirebaseFirestore.instance.collection('announcment').get().then((value){
      value.docs.forEach((element){
        _announcmentModel.add(AnnouncmentModel.fromJson(element.data()));
      });
      print('asasasa${_announcmentModel.length}');

    }).catchError((error){
      print('there is an error when get all announcment');
    });
    _isLoading(false);
  }

  Future getAllCoachAnnouncment()async{
    _announcmentCoachModel.clear();
    _isLoading(true);
    await FirebaseFirestore.instance.collection('announcment_coach').get().then((value){
      value.docs.forEach((element){
        _announcmentCoachModel.add(AnnouncmentModel.fromJson(element.data()));
      });

    }).catchError((error){
      print('there is an error when get all announcment');
    });
    _isLoading(false);
  }



  Future getAllClasses()async{
    List<ClassesModel>x  =[];
    _classesModel.clear();
    _isLoading(true);
    await FirebaseFirestore.instance.collection('classes').get().then((value)async{
      value.docs.forEach((element){
        _classesModel.add(ClassesModel.fromJson(element.data()));
      });
      final myClassesSnapshot = await FirebaseFirestore.instance.collection('users').doc(uid).collection('myClasses').get();
      final myClassesIds = myClassesSnapshot.docs.forEach((element){

        x.add(ClassesModel.fromJson(element.data()));
      });

      _classesModel.removeWhere((element)=>x.contains(element.uid));

      // classesModel.removeWhere((classModel) => myClassesIds.contains(classModel.uid));


    }).catchError((error){
      print('there is an error when get all classes !');
    });
    _isLoading(false);

  }

  Future acceptClasses({required String classTitle,required String className,required String classTime,required String classDate,required String uid})async{
    await FirebaseFirestore.instance.collection('users').doc(_uid.value).collection('myClasses').add({
      'class_title':classTitle,
      'class_name':className,
      'class_date':classDate,
      'class_time':classTime,
      'uid':uid

    }).then((value){
      Utils.MyToast(title: 'Accepted success ');
      getMyAcceptedClasses();

    }).catchError((error){
      print('there is an error when accept the class ! ');
    });
  }

  Future getMyAcceptedClasses()async{
    _isLoading(true);
    _myAcceptClasses.clear();
    await FirebaseFirestore.instance.collection('users').doc(userModel.uid).collection('myClasses').get().then((value){
      value.docs.forEach((element){
        _myAcceptClasses.add(ClassesModel.fromJson(element.data()));
      });
      print('sssss${_myAcceptClasses.length}');

    }).catchError((error){
      print('there is an in get my accepted classes ! ');
    });
    _isLoading(false);
  }


  String get uid=>_uid.value;
  bool get isLoading=>_isLoading.value;
  UserModel get userModel=>_userModel.value;
  List<AnnouncmentModel> get announcmentModel=>_announcmentModel;
  List<AnnouncmentModel> get announcmentCoachModel=>_announcmentCoachModel;

  List<ClassesModel> get classesModel=>_classesModel;
  List<ClassesModel> get myAcceptClasses=>_myAcceptClasses;

}