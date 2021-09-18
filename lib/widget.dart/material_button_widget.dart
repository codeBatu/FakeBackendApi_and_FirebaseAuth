import 'package:flutter/material.dart';

materialButtonWidget(
    Color color, String buttonTitle, Widget path, BuildContext context) {
  return MaterialButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (builder) {
            return path;
          },
        ),
      );
    },
    height: 50,
    color: color,
    child: Text(buttonTitle),
  );
}
