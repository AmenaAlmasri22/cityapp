// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertexitapp() {
  Get.defaultDialog(
      title: " warning ",
      middleText: "do you want exit the app ?",
      actions: [
        MaterialButton(
          onPressed: () {
            exit(0);
          },
          child: const Text("confirm"),
        ),
        MaterialButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("cancel"),
        )
      ]);
  return Future.value(true);
}
