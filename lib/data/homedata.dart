import '../linkapi.dart';
import 'package:http/http.dart' as http;

class CityData {
  String token = '7|x0AVPrpcYsZfeE4AO4ASVHRV0dakrOWdTpFxDZ3M1db4b608';
  getData() async {
    var response = await http.get(Uri.parse(LinkApp.viewcity), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    // ignore: avoid_print
    print(response.body);
    return response;
  }
}
