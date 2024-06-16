import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../data/addcitydata.dart';

abstract class AddCityController extends GetxController {
  addcity();
}

class AddCityControllerImp extends AddCityController {
  AddCityData addData = AddCityData();
  late TextEditingController ar;
  late TextEditingController en;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  addcity() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      update();
      var response = await addData.postdata(en.text, ar.text);
      if (response['message'] == "City Created Successfully") {
        Get.defaultDialog(actions: [
          MaterialButton(
            onPressed: () {
              update();

              Get.toNamed(AppRoutes.homepage, preventDuplicates: false);
            },
            child: const Text("OK"),
          )
        ], title: "Done", middleText: "City Created Successfully");
      } else {
        Get.defaultDialog(
            title: "ُWarning", middleText: "The city has already been taken");
      }
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    ar = TextEditingController();
    en = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    ar.dispose();
    en.dispose();
  }
}
