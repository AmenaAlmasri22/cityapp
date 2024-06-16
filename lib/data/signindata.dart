import 'dart:convert';

import 'package:http/http.dart' as http;
import '../linkapi.dart';

class SinInData {
  SinInData();
  postdata(String username, String password) async {
    String token = '7|x0AVPrpcYsZfeE4AO4ASVHRV0dakrOWdTpFxDZ3M1db4b608';
    var response = await http.post(Uri.parse(LinkApp.signin), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }, body: {
      "user_name": username,
      "password": password
    });
    print(response.body);
    return jsonDecode(response.body);
  }
}
