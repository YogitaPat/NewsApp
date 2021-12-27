class Articles {

  final String? author;
  final String? content;
  final String? date;
  final String? imageUrl;
  final String? readMoreUrl;
  final String? time;
  final String? title;
  final String? url;

  Articles({this.author, this.content ,this.date,this.imageUrl,this.readMoreUrl,this.title,this.time,this.url


  });
  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
        title: json["title"],
        author: json["author"],
        content: json["content"],
        date: json["date"],
        imageUrl: json["imageUrl"],
        readMoreUrl: json["readMoreUrl"],
          time: json["time"],
          url: json["url"],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['author'] = this.author;
    data['title'] = this.title;
    data['content'] = this.content;
    data['date'] = this.date;
    data['imageUrl'] = this.imageUrl;
    data['readMoreUrl'] = this.readMoreUrl;
    data['time'] = this.time;
    data['url'] = this.url;
    return data;
  }

  @override
  List<Articles> fromMapList(List<dynamic> dynamicDataList) {
    //var trainingList = <Training>[];
    Map<String, dynamic>  data = new Map();
    final List<Articles> articleList = <Articles>[];
    if (dynamicDataList != null) {
      for (int i =0; i< dynamicDataList.length;i++) {
        articleList.add(Articles(
          author: dynamicDataList[i]["author"].toString(),
          title: dynamicDataList[i]["title"].toString(),
          content: dynamicDataList[i]["content"].toString(),
          date: dynamicDataList[i]["date"].toString(),
          imageUrl: dynamicDataList[i]["imageUrl"].toString(),
          readMoreUrl: dynamicDataList[i]["readMoreUrl"].toString(),
          time: dynamicDataList[i]["time"].toString(),
          url: dynamicDataList[i]["url"].toString(),
        ));
      }
    }
    return articleList;
  }


  @override
  List<Map<String, dynamic>> toMapList(List<dynamic> objectList) {
    final List<Map<String, dynamic>> dynamicList = <Map<String, dynamic>>[];
    if (objectList != null) {
      for (dynamic data1 in objectList) {
        if (data1 != null) {

          final Map<String, dynamic> data = new Map<String, dynamic>();
          data['author'] = data1.author;
          data['title'] = data1.title;
          data['content'] = data1.content;
          data['date'] = data1.date;
          data['imageUrl'] = data1.imageUrl;
          data['readMoreUrl'] = data1.readMoreUrl;
          data['time'] = data1.time;
          data['url'] = data1.url;
          dynamicList.add(data);
        }
      }
    }
    return dynamicList;
  }

}