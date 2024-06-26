import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageassets.dart';

class DrawerHomePage extends StatelessWidget {
  const DrawerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: const Color.fromARGB(255, 1, 21, 56),
      child: ListView(children: [
        Center(
          child: DrawerHeader(
            child: Image.asset(
              AssestImage.logo,
              fit: BoxFit.cover,
            ),
          ),
        ),
        ListTile(
          leading:
              Icon(Icons.home_outlined, color: AppColor.white, size: 25.sp),
          title: Text("المدن ",
              style: TextStyle(color: AppColor.white, fontSize: 15.sp)),
        ),
        ListTile(
          leading: Icon(
            Icons.groups,
            color: AppColor.white,
            size: 25.sp,
          ),
          title: Text("المشرفين",
              style: TextStyle(color: Colors.white, fontSize: 15.sp)),
        ),
        ListTile(
          leading:
              Icon(Icons.grading_outlined, color: Colors.white, size: 25.sp),
          title: Text("مدخلين البيانات ",
              style: TextStyle(color: AppColor.white, fontSize: 15.sp)),
        ),
        ListTile(
          leading:
              Icon(Icons.tag_faces_rounded, color: AppColor.white, size: 25.sp),
          title: Text("الرموز التعبيرية",
              style: TextStyle(color: AppColor.white, fontSize: 15.sp)),
        ),
        ListTile(
          leading:
              Icon(Icons.view_list_rounded, color: AppColor.white, size: 25.sp),
          title: Text("القوائم ",
              style: TextStyle(color: AppColor.white, fontSize: 15.sp)),
        ),
        ListTile(
          leading: Icon(Icons.star, color: AppColor.white, size: 25.sp),
          title: Text("التقييمات",
              style: TextStyle(color: AppColor.white, fontSize: 15.sp)),
        ),
        ListTile(
          leading:
              Icon(Icons.file_present_sharp, color: Colors.white, size: 25.sp),
          title: Text("عرض العقود ",
              style: TextStyle(color: AppColor.white, fontSize: 15.sp)),
        ),
        ListTile(
          leading: Icon(Icons.logout, color: AppColor.white, size: 25.sp),
          title: Text("تسجيل الخروج ",
              style: TextStyle(color: AppColor.white, fontSize: 15.sp)),
        )
      ]),
    ));
  }
}
