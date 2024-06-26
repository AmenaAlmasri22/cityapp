// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../core/services/services.dart';
import '../data/signindata.dart';

abstract class SignInController extends GetxController {
  signIn();
}

class SignInControllerImp extends SignInController {
  MyServices myServices = Get.find();
  SinInData siginData = SinInData();
  late TextEditingController username;
  late TextEditingController password;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  signIn() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      update();
      var response = await siginData.postdata(username.text, password.text);
      if (response['message'] == "Login Successfully") {
        myServices.sharedPreferences
            .setString("id", response['data']['id'].toString());
        String userid = myServices.sharedPreferences.getString("id")!;
        myServices.sharedPreferences
            .setString("username", response['data']['user_name']);
        myServices.sharedPreferences.setString("step", "1");

        Get.offNamed(AppRoutes.homepage);
      } else {
        Get.defaultDialog(
            title: "ُWarning", middleText: "Email Or Password Not Correct");
        Get.toNamed(AppRoutes.signin);
      }
    }
  }

  @override
  void onInit() {
    username = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }
}
