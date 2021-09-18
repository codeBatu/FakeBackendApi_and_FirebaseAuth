import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample01/core/api_service.dart';
import 'package:sample01/core/utily/constat.dart';
import 'package:sample01/view/home/home_page_view.dart';
import 'package:sample01/viewmodel/home/homepage_viewmodel.dart';
import 'package:sample01/widget.dart/text_form_field_widget.dart';

class UserAddPage extends StatefulWidget {
  UserAddPage({Key? key}) : super(key: key);

  @override
  _UserAddPageState createState() => _UserAddPageState();
}

class _UserAddPageState extends State<UserAddPage> {
  ApiService apiService = new ApiService();
  HomePageViewModel hvm = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        // body: GetBuilder<HomePageViewModel>(
        //   builder: (x) {
        //     return FutureBuilder(
        //       future: apiService.getFectData(),
        //       builder: (BuildContext context, AsyncSnapshot snapshot) {
        //         return Text(apiService.getFectData());
        //       },
        //     );
        //   },
        // ),
        );
  }
}
