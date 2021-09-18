import 'package:flutter/material.dart';

Container textFormField(IconData icons, String hintText, String labelText,
    TextEditingController controllerTextFormField, bool scure) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27), color: Colors.grey[200]),
    child: TextFormField(
      obscureText: scure,
      validator: (String? value) {
        if (value == "" && value == null) {
          print("Lütfen bir ${hintText.toString()} yazınız ... ");
          return "Lütfen bir ${hintText.toString()} yazınız ... ";
        } else {}
      },
      controller: controllerTextFormField,
      decoration: InputDecoration(
        icon: Icon(icons),
        hintText: hintText,
        labelText: labelText,
        border: InputBorder.none,
      ),
    ),
  );
}
