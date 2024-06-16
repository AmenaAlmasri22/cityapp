import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controller/homepage_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageassets.dart';
import '../../core/functions/opendialogeaddcity.dart';
import '../../data/model/city_modle.dart';
import '../widget/cityinfowidget.dart';
import '../widget/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        titleTextStyle: TextStyle(fontSize: 15.sp),
        elevation: 20,
        backgroundColor: AppColor.primary,
        title: Padding(
          padding: EdgeInsets.only(right: 30.sp),
          child: const Center(child: Text('SUPER ADMIN')),
        ),
      ),
      drawer: const DrawerHomePage(),
      body: ListView(physics: const AlwaysScrollableScrollPhysics(), children: [
        Padding(
          padding: EdgeInsets.only(top: 15.sp),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 115.sp, right: 10.sp),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.black,
                      borderRadius: BorderRadius.all(Radius.circular(20.sp))),
                  height: 40.sp,
                  width: 90.sp,
                  child: Center(
                      child: Text(
                    'المدن',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                      color: AppColor.primary,
                    ),
                  )),
                ),
              ),
              const Icon(
                Icons.arrow_back_ios,
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColor.black,
                    borderRadius: BorderRadius.all(Radius.circular(20.sp))),
                height: 40.sp,
                width: 110.sp,
                child: Center(
                    child: Text(
                  'الرئيسية',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                    color: AppColor.primary,
                  ),
                )),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.sp, top: 60.sp),
              child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.all(Radius.circular(8.sp))),
                  height: 40.sp,
                  width: 110.sp,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.sp,
                      ),
                      const Icon(
                        Icons.add_circle_outlined,
                        color: AppColor.white,
                      ),
                      TextButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              )),
                              elevation: const MaterialStatePropertyAll(5)),
                          onPressed: () {
                            opendilog(context);
                          },
                          child: const Text(
                            'إضافة مدينة',
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  )),
            ),
            SizedBox(
              width: 100.sp,
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.sp, left: 18.sp),
              child: Text(
                'المدن',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35.sp,
                  color: AppColor.primary,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.sp,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.sp, right: 20),
          child: Container(
            decoration: const BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))),
            height: 47.sp,
            child: Padding(
              padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
              child: Row(
                children: [
                  SizedBox(
                    width: 50.sp,
                  ),
                  const Text(
                    'الحدث ',
                    style: TextStyle(color: AppColor.white),
                  ),
                  SizedBox(
                    width: 100.sp,
                  ),
                  const Text(
                    'اسم المدينة ',
                    style: TextStyle(color: AppColor.white),
                  )
                ],
              ),
            ),
          ),
        ),
        FutureBuilder(
          future: controller.getdata(),
          builder: (BuildContext context, AsyncSnapshot<CityModle?> snapshot) =>
              controller.isLoading == true
                  ? Center(
                      child: Lottie.asset(AssestLottie.loading,
                          width: 250, height: 250, repeat: false))
                  : ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data?.data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 20.sp, right: 20),
                          child: Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 149, 149, 149),
                                    blurRadius: 4,
                                    offset: Offset(2, 4), // Shadow position
                                  ),
                                ],
                                color: AppColor.white,
                                //                    <-- BoxDecoration
                                border: Border(bottom: BorderSide()),
                              ),
                              child: cityInfo(
                                  snapshot.data?.data?[index].name ?? 'null')),
                        );
                      },
                    ),
        ),
      ]),
    );
  }
}


  // FutureBuilder(
  //           future: controller.getdata(),
  //           builder: (BuildContext context,
  //                   AsyncSnapshot<CityModle?> snapshot) =>
  //               controller.isLoading == true
  //                   ? Center(
  //                       child: Lottie.asset(AssestLottie.loading,
  //                           width: 250, height: 250, repeat: false))
  //                   : ListView.builder(
  //                       shrinkWrap: true,
  //                       itemCount: snapshot.data?.data?.length,
  //                       itemBuilder: (BuildContext context, int index) {
  //                         return Padding(
  //                           padding: EdgeInsets.only(left: 20.sp, right: 20),
  //                           child: Container(
  //                               decoration: const BoxDecoration(
  //                                 boxShadow: [
  //                                   BoxShadow(
  //                                     color: Color.fromARGB(255, 149, 149, 149),
  //                                     blurRadius: 4,
  //                                     offset: Offset(2, 4), // Shadow position
  //                                   ),
  //                                 ],
  //                                 color: AppColor.white,
  //                                 //                    <-- BoxDecoration
  //                                 border: Border(bottom: BorderSide()),
  //                               ),
  //                               child: cityInfo(
  //                                   snapshot.data?.data?[index].name ??
  //                                       'null')),
  //                         );
  //                       },
  //                     ),
  //         )