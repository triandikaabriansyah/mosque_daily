import 'package:flutter/material.dart';
import 'package:mosque_daily/category_item.dart';
import 'package:mosque_daily/model/ResponseBerita.dart';
import 'package:mosque_daily/model/category.dart';
import 'package:mosque_daily/news_item.dart';

class NewsPage extends StatelessWidget {
  ResponseBerita responseBerita;
  List <Category> categories;

  NewsPage(this.responseBerita, this.categories);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 70,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index){
                    return CategoryItem (
                      categoryName: categories[index].categoryImage,
                      imageAsstUrl: categories[index].imagUrl,
                    );
                  })
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: ListView.builder(
                itemCount: responseBerita.articles.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index){
                  return NewsItem(
                    imgurl: responseBerita.articles[index].urlToImage ?? "",
                    title: responseBerita.articles[index].title ?? "",
                    desc: responseBerita.articles[index].description ?? "",
                    content: responseBerita.articles[index].content ?? "",
                    posturl: responseBerita.articles[index].url ?? "",
                    name: responseBerita.articles[index].source.name ?? "",
                  );
                }),
          )
        ],
      ),
    );
  }
}