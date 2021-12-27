import 'package:flutter/material.dart';
import 'package:flutter_test_app/models/News.dart';
import 'package:flutter_test_app/viewmodel/NewsModel.dart';
import 'package:flutter_test_app/webservice/WebService.dart';
import 'package:provider/provider.dart';


class NewsListPage extends StatefulWidget {
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<NewsListViewModel>(context, listen: false).fetchNewsData();
//you can use anything you like or not use anything here. I call it just to have a content on the screen rather than having a blank screen
  }

  @override
  Widget build(BuildContext context) {
    Webservice client = Webservice();
    final vm = Provider.of<NewsListViewModel>(context);

    return Scaffold(
        appBar: AppBar(
            title: Text("Inshorts Test News App ")
        ),
      body: FutureBuilder(
        future: client.fetchNews(),
        builder: (BuildContext context, AsyncSnapshot<List<NewsModel>> snapshot) {
          if (snapshot.hasData) {
            List<NewsModel> articles = snapshot.data!;
            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) => customListTile(articles[index], context)
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),

    );
  }
}





Widget customListTile(NewsModel article, BuildContext context) {
  return InkWell(
    onTap: () {

    },
    child: Container(
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          article.data!.first.imageUrl != null ?
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage( article.data!.first.imageUrl!), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ) :

          SizedBox(height: 8.0),
          Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Text(
              article.data!.first.content!,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            article.data!.first.title!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          )
        ],
      ),
    ),
  );
}