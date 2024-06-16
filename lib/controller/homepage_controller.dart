import 'dart:convert';

import 'package:get/get.dart';
import '../data/homedata.dart';
import '../data/model/city_modle.dart';

abstract class HomeController extends GetxController {
  getdata();
}

class HomeControllerImp extends HomeController {
  CityModle? city;
  @override
  void onInit() {
    getdata();
    super.onInit();
  }

  CityData homedata = Get.put(CityData());
  bool? isLoading;
  @override
  Future<CityModle?> getdata() async {
    isLoading = true;
    var response = await homedata.getData();
    city = CityModle.fromJson(jsonDecode(response.body));
    isLoading = false;
    update();
    return city;
  }
}
