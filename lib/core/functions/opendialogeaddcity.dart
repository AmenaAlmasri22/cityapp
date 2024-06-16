import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task/core/constant/routes.dart';
import 'package:task/core/functions/validinput.dart';

import '../../controller/addcity_controller.dart';

Future opendilog(context) async {
  showDialog(
      context: context,
      builder: (context) {
        AddCityControllerImp controller = Get.put(AddCityControllerImp());
        return Form(
          key: controller.formstate,
          child: AlertDialog(
            actions: [
              TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      elevation: const MaterialStatePropertyAll(5)),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    'تجاهل',
                    style: TextStyle(color: Colors.white),
                  )),
              TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      elevation: const MaterialStatePropertyAll(5)),
                  onPressed: () {
                    controller.addcity();
                  },
                  child: const Text(
                    'حفظ',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
            title: const Center(
                child: Text(
              'إضافة مدينة ',
              style: TextStyle(
                  color: Color.fromARGB(255, 1, 21, 56),
                  fontWeight: FontWeight.bold),
            )),
            content: Column(
              children: [
                const Divider(),
                TextFormField(
                  validator: (val) {
                    return validinput(val!, 0, 100, "ar");
                  },
                  controller: controller.ar,
                  autovalidateMode: AutovalidateMode.disabled,
                  decoration: InputDecoration(
                    hintText: 'الاسم باللغة العربية ',
                    hintTextDirection: TextDirection.ltr,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(1.sp))),
                  ),
                ),
                SizedBox(
                  height: 5.sp,
                ),
                TextFormField(
                  validator: (val) {
                    return validinput(val!, 2, 100, "username");
                  },
                  controller: controller.en,
                  autovalidateMode: AutovalidateMode.disabled,
                  decoration: InputDecoration(
                    hintText: 'الاسم باللغة الثانوية ',
                    hintTextDirection: TextDirection.ltr,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(1.sp))),
                  ),
                )
              ],
            ),
          ),
        );
      });
}
