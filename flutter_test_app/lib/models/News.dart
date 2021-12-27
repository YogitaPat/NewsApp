import 'package:flutter_test_app/models/Articles.dart';

class NewsModel {
  String? status;
  String? category;
  List<Articles>? data;

  NewsModel({this.status, this.category, this.data});

  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];


    if (json['articles'] != null) {
      // ignore: deprecated_member_use
      data= Articles().fromMapList(json['data']);
    }
    // if (json['articles'] != null) {
    //   // ignore: deprecated_member_use
    //   data = <Articles>[];
    //   json['articles'].forEach((v) {
    //     data!.add(new Articles.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data1 = new Map<String, dynamic>();
    data1['status'] = this.status;
    if (this.data != null) {
      data1['data'] = Articles().toMapList(data!);
    }

    // if (this.data != null) {
    //   data['articles'] = this.data!.map((v) => v.toJson()).toList();
    // }
    return data1;
  }
}