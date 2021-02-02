import 'package:flutter/material.dart';
import 'package:mosque_daily/helper/data_category.dart';
import 'package:mosque_daily/helper/data_request.dart';
import 'package:mosque_daily/helper/widget.dart';
import 'package:mosque_daily/model/category.dart';

import '../news_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  News news = News();

  List<Category> categories = List<Category>();

  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      appBar: myAppBar(),
      body:  SafeArea(
        child: FutureBuilder(
            future: news.getNews(),
            builder: (context, snapshot){
              if (snapshot.hasData){
                return NewsPage(snapshot.data, categories);
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Center(child: Text("Data tidak tersedia"));
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}