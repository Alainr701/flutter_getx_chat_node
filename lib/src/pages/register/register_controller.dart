import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  bool obsPassword = true;
  bool obsConfirmPassword = true;
  String email = '',
      password = '',
      confirmPassword = '',
      name = '',
      lastName = '',
      cellphone = '',
      address = '';

  void submit() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
  }

  void updatePasswordVisibility() {
    obsPassword = !obsPassword;
    update();
  }

  void updateConfirmPasswordVisibility() {
    obsConfirmPassword = !obsConfirmPassword;
    update();
  }
}
