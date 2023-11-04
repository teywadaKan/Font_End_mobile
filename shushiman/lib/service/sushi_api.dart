import 'package:shushiman/model/sushi_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SushiApi {
  static Future<List<SushiModel>> getData() async {
    String url = "http://192.168.1.2:5000/sushi";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      List<SushiModel> sushis =
          data.map((e) => SushiModel.fromJson(e)).toList();

      return sushis;
    } else {
      throw Exception("error");
    }
  }
}
