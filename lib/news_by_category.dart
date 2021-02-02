import 'package:flutter/material.dart';
import 'package:mosque_daily/helper/widget.dart';
import 'package:mosque_daily/model/ResponseBerita.dart';
import 'package:mosque_daily/news_item.dart';
import 'package:mosque_daily/helper/data_request.dart';

class NewsByCategories extends StatefulWidget {
  final String newsCategory;
  const NewsByCategories({this.newsCategory});

  @override
  _NewsByCategoriesState createState() => _NewsByCategoriesState(newsCategory);
}

class _NewsByCategoriesState extends State<NewsByCategories> {
  NewsByCategory newsByCategory = NewsByCategory();
  String newsCategory;

  _NewsByCategoriesState(this.newsByCategory);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppBar(),
      body: FutureBuilder(
          future: newsByCategory.getNewsByCategory(newsCategory),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListNewsCategory(snapshot.data);
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Center(child: Text("Data tidak di temukan"));
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

class ListNewsCategory extends StatelessWidget {
  ResponseBerita responseBerita;
  ListNewsCategory(this.responseBerita);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 16),
          child: ListView.builder(
              itemCount: responseBerita.articles.length,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return NewsItem(
                  imgurl: responseBerita.articles[index].urlToImage ?? "",
                  title: responseBerita.articles[index].title ?? "",
                  desc: responseBerita.articles[index].description ?? "",
                  content: responseBerita.articles[index].content ?? "",
                  posturl: responseBerita.articles[index].url ?? "",
                  name: responseBerita.articles[index].source.name ?? "",
                );
              }),
        ));
  }
}