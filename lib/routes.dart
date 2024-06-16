// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:task/view/screen/homepage.dart';
import 'package:task/view/screen/signin.dart';

import 'core/constant/routes.dart';
import 'core/middleware/mymiddleware.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const SignIn(), middlewares: [MyMiddleWare()]),
  GetPage(
    name: AppRoutes.homepage,
    page: () => const HomePage(),
  ),
];
