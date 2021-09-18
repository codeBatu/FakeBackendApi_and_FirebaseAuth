import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sample01/core/utily/constat.dart';

import 'package:sample01/view/register/forgotpwd/forgot_password.dart';
import 'package:sample01/view/register/register_page.dart';
import 'package:sample01/viewmodel/login/login_page_viewmodel.dart';
import 'package:sample01/widget.dart/material_button_widget.dart';
import 'package:sample01/widget.dart/text_form_field_widget.dart';

class LoginPageView extends StatefulWidget {
  LoginPageView({Key? key}) : super(key: key);

  @override
  _LoginPageViewState createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  Login login = new Login();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Row(
                    children: [
                      materialButtonWidget(
                          Colors.orange,
                          TextValue.forgotPwdButton,
                          ForgotPasswordPage(),
                          context),
                      SizedBox(
                        width: 10,
                      ),
                      materialButtonWidget(Colors.orange,
                          TextValue.registerButton, RegisterPageView(), context)
                    ],
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  textFormField(Icons.person, TextValue.email, TextValue.email,
                      TextValue.emailTextController, false),
                  SizedBox(
                    height: 10,
                  ),
                  textFormField(Icons.lock, TextValue.pwd, TextValue.pwd,
                      TextValue.pwdTextController, true),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [loginMaterialButtonWidget()],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey[200]),
                    child: InkWell(
                      onTap: () {},
                      child: ListTile(
                        leading: Icon(Icons.flutter_dash),
                        title: Text(
                          TextValue.googleButton,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  MaterialButton loginMaterialButtonWidget() {
    return MaterialButton(
      onPressed: () {
        try {
          TextValue.emailTextController.text = "a@a.com";
          TextValue.pwdTextController.text = "123123";
          if (TextValue.emailTextController.text == "" &&
              TextValue.pwdTextController.text == "") {
            print("Email veya Şifre Boş");
          } else {
            login.loginToFirebase(
                TextValue.emailTextController, TextValue.pwdTextController);

            //   TextValue.emailTextController.text = "";
            //   TextValue.pwdTextController.text = "";
          }
        } catch (e) {}
      },
      child: Text(TextValue.loginButton),
    );
  }

  @override
  void dispose() {
    TextValue.emailTextController.dispose();
    TextValue.pwdTextController.dispose();
    super.dispose();
  }
}
