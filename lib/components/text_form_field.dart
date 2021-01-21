import 'package:booking_app/init/constants.dart';
import 'package:flutter/material.dart';


class TextFormComponent extends StatelessWidget {
  final String hintText;
  final Icon icon;
  final TextInputType textInputType;

  const TextFormComponent({Key key, this.hintText, this.icon, this.textInputType}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: kSecondaryColor,
            )),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter user name';
        }
        return null;
      },
    );
  }
}

bool validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(value)) ? false : true;
}

bool validateText(String value) {
  if (value.isEmpty) {
    return false;
  }
  return true;
}