import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sample01/core/utily/constat.dart';
import 'package:sample01/view/login/login_page_view.dart';
import 'package:sample01/viewmodel/register/register_view_model.dart';

import 'package:sample01/widget.dart/text_form_field_widget.dart';

class RegisterPageView extends StatefulWidget {
  RegisterPageView({Key? key}) : super(key: key);
  @override
  _RegisterPageViewState createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends State<RegisterPageView> {
  Register _register = new Register();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register Page",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textFormField(Icons.person, TextValue.email, TextValue.email,
                    TextValue.emailTextController, false),
                SizedBox(
                  height: 10,
                ),
                textFormField(Icons.lock, TextValue.pwd, TextValue.pwd,
                    TextValue.pwdTextController, true),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: () {
                    _register.registerFirebase(TextValue.emailTextController,
                        TextValue.pwdTextController);
                    TextValue.emailTextController.text = "";
                    TextValue.pwdTextController.text = "";
                  },
                  child: Text(TextValue.loginButton),
                )
              ],
            ),
          )),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
