import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mosque_daily/model/ResponseBerita.dart';

String apiKey = "fa33e3e12c094be6819410182e6d36d5";

class News {
  Future<ResponseBerita> getNews() async {
    String url ="https://newsapi.org/v2/top-headlines?country=id&apiKey=$apiKey";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return ResponseBerita.fromJsonMap(jsonData);
  }
}

class NewsByCategory{
  Future<ResponseBerita> getNewsByCategory(String category) async{
    String url ="https://newsapi.org/v2/top-headlines?country=id&category=$category&" + "apiKey=$apiKey";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return ResponseBerita.fromJsonMap(jsonData);
  }
}