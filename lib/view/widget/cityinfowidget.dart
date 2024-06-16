import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget cityInfo(String c) => ListTile(
      title: Row(
        children: [
          SizedBox(
            width: 30.sp,
          ),
          const Icon(
            Icons.not_interested,
            color: Color.fromARGB(255, 0, 13, 23),
          ),
          const Icon(
            Icons.delete,
            color: Color.fromARGB(255, 0, 13, 23),
          ),
          const Icon(
            Icons.edit_outlined,
            color: Color.fromARGB(255, 0, 13, 23),
          ),
          const Icon(
            Icons.remove_red_eye_rounded,
            color: Color.fromARGB(255, 0, 13, 23),
          ),
          SizedBox(
            width: 100.sp,
          ),
          Text(c, textDirection: TextDirection.rtl),
        ],
      ),
    );
