import 'package:flutter/material.dart';
import 'package:sample01/core/utily/constat.dart';
import 'package:sample01/widget.dart/text_form_field_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textFormField(Icons.person, TextValue.email, TextValue.email,
                TextValue.emailTextController, false),
            MaterialButton(
              onPressed: () {
                FirebaseData.auth.sendPasswordResetEmail(
                    email: TextValue.emailTextController.text);

                Navigator.pop(context);

                TextValue.emailTextController.text = "";
              },
              child: Text(
                "Forgot Password",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
