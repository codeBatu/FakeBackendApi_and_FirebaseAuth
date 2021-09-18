import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sample01/core/utily/constat.dart';
import 'package:sample01/view/login/login_page_view.dart';

class Register {
  void registerFirebase(
      TextEditingController email, TextEditingController pwd) async {
    try {
      final UserCredential userCredential = await FirebaseData.auth
          .createUserWithEmailAndPassword(
              email: email.text, password: pwd.text);
      final User? user = userCredential.user;
      Get.to(() => LoginPageView());
      if (user != null) {
      } else {}
    } catch (e) {
      print(e);
    }
  }
}
