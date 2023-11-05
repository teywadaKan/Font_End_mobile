import 'package:http/http.dart' as http;
import 'package:shushiman/model/user_login_model.dart';
import 'dart:convert';

import 'package:shushiman/model/user_model.dart';

class UserApi {
  static Future<UserModel> login(UserLoginModel user) async {
    String url = "http://localhost:5000/user/login";
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(user),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      // ignore: unnecessary_null_comparison
      if (response.body != null) {
        final data = json.decode(response.body);
        return data;
      } else {
        throw Exception("Response body is null");
      }
    } else {
      throw Exception("error login");
    }
  }
}
