import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gradproject/shared/colors.dart';

class Utils{

 static Future<bool?> MyToast({required String title})async{

  return await  Fluttertoast.showToast(
        msg: "${title}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: kPrimary,
        textColor: Colors.white,
        fontSize: 16.0
    );

  }

}