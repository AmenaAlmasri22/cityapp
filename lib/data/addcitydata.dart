import 'dart:convert';

import '../linkapi.dart';
import 'package:http/http.dart' as http;

class AddCityData {
  AddCityData();
  postdata(String enname, String arname) async {
    String token = '7|x0AVPrpcYsZfeE4AO4ASVHRV0dakrOWdTpFxDZ3M1db4b608';
    var response = await http.post(Uri.parse(LinkApp.addcity), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }, body: {
      "name_en": enname,
      "name_ar": arname
    });
    print(response.body);
    return jsonDecode(response.body);
  }
}
