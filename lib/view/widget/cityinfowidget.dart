import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget cityInfo(String c) => ListTile(
      title: Row(
        children: [
          SizedBox(
            width: 30.w,
          ),
          IconButton(
            icon:
                Icon(Icons.not_interested, color: Color.fromRGBO(0, 13, 23, 1)),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Color.fromARGB(255, 0, 13, 23)),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.edit_outlined,
                color: Color.fromARGB(255, 0, 13, 23)),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.remove_red_eye_rounded,
              color: Color.fromARGB(255, 0, 13, 23),
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: 100.sp,
          ),
          Text(c, textDirection: TextDirection.rtl),
        ],
      ),
    );
