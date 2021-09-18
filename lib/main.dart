import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample01/viewmodel/home/homepage_viewmodel.dart';

import 'view/login/login_page_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Start());
}

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    HomePageViewModel homePageViewModel = Get.put(HomePageViewModel());
    return GetMaterialApp(
      home: LoginPageView(),
    );
  }
}
