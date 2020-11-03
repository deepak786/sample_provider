import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  bool separateNavigator;

  String name;
  String email;
  String gender;
  String phone;
  String occupation;

  String getDisplayedData() {
    return "Name: $name\nEmail: $email\nGender: $gender\nPhone: $phone\nOccupation: $occupation";
  }
}
