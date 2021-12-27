
import 'package:flutter_test_app/models/Articles.dart';
import 'package:flutter_test_app/models/News.dart';

class NewsViewModel {

  final NewsModel? news;

  NewsViewModel({this.news});

  String? get category {
    return this.news!.category!;
  }

  String get status {
    return this.news!.status!;
  }
  List <Articles>? get data{
    return this.news!.data;
  }
}