import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_test_app/models/News.dart';


class Webservice {

  final client = http.Client();


  Future<List<NewsModel>> fetchNews() async {
    final uri = Uri.https("https://inshortsapi.vercel.app/news?category=national",'');
    final response = await client.get(uri);


    if(response.statusCode == 200) {

      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['data'];
      List<NewsModel> articles = body.map((dynamic item) => NewsModel.fromJson(item)).toList();
      return articles;

    } else {
      throw Exception("Unable to perform request!");
    }
  }
}