import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TextValue {
  static String loginButton = "Login";
  static String email = "E-mail";
  static String pwd = "Password";
  static String registerButton = "Register";
  static String forgotPwdButton = "Forgot Password";
  static String googleButton = "Google";
  static TextEditingController emailTextController = TextEditingController();
  static TextEditingController pwdTextController = TextEditingController();
  static TextEditingController fNameTextController = TextEditingController();
  static TextEditingController lNameTextController = TextEditingController();
  static TextEditingController emailUserTextController =
      TextEditingController();

  static String fName = "FirstName";
  static String lName = "Last Name";
}

class FirebaseData {
  static FirebaseAuth auth = FirebaseAuth.instance;
}
