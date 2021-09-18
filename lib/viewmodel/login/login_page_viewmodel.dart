import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sample01/core/utily/constat.dart';
import 'package:sample01/view/home/home_page_view.dart';

class Login {
  void loginToFirebase(
      TextEditingController email, TextEditingController pwd) async {
    try {
      final UserCredential userCredential = await FirebaseData.auth
          .signInWithEmailAndPassword(email: email.text, password: pwd.text);
      final User? user = userCredential.user;
      Get.to(() => HomePageView());
    } catch (e) {
      print(e);
    }
  }
}
