import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/signin_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageassets.dart';
import '../../core/functions/alertexitapp.dart';
import '../../core/functions/validinput.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    SignInControllerImp mycontroller = Get.put(SignInControllerImp());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.primary,
      body: WillPopScope(
        onWillPop: alertexitapp,
        child: GetBuilder<SignInControllerImp>(builder: (controller) {
          return Form(
            key: mycontroller.formstate,
            child: Center(
                child: ListView(children: [
              Padding(
                padding: EdgeInsets.only(left: 65.sp),
                child: SizedBox(
                  height: 300.sp,
                  width: double.infinity,
                  child: Image.asset(
                    AssestImage.logo,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  child: Text("تسجيل الدخول",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(color: AppColor.white, fontSize: 20.sp)),
                ),
              ),
              SizedBox(
                height: 30.sp,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.sp, right: 30.sp),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.sp))),
                      child: TextFormField(
                        validator: (val) {
                          return validinput(val!, 3, 100, "username");
                        },
                        controller: mycontroller.username,
                        autovalidateMode: AutovalidateMode.disabled,
                        decoration: InputDecoration(
                          hintText: 'اسم المستخدم ',
                          hintTextDirection: TextDirection.rtl,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.sp))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.sp))),
                      child: TextFormField(
                        obscureText: true,
                        validator: (val) {
                          return validinput(val!, 3, 100, "password");
                        },
                        controller: mycontroller.password,
                        autovalidateMode: AutovalidateMode.disabled,
                        // validator: validate,
                        //   controller: mycontroller,
                        decoration: InputDecoration(
                          hintText: 'كلمة المرور ',
                          hintTextDirection: TextDirection.rtl,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.sp))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.sp,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.sp))),
                        height: 50.sp,
                        width: 150.sp,
                        child: TextButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                                elevation: const MaterialStatePropertyAll(5)),
                            onPressed: () {
                              mycontroller.signIn();
                            },
                            child: const Text(
                              'تسجيل الدخول ',
                              style: TextStyle(color: AppColor.white),
                            )))
                  ],
                ),
              ),
            ])),
          );
        }),
      ),
    );
  }
}
