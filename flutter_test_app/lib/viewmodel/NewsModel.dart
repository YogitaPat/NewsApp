import 'package:flutter/material.dart';
import 'package:flutter_test_app/webservice/WebService.dart';
import 'NewsViewModel.dart';

class NewsListViewModel extends ChangeNotifier {

  // ignore: deprecated_member_use
  List<NewsViewModel> news =[];

  Future<void> fetchNewsData() async {
    final results =  await Webservice().fetchNews();
    this.news = results.map((item) => NewsViewModel(news: item)).toList();
    notifyListeners();
  }

}