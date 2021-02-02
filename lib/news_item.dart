import 'package:flutter/material.dart';
import 'package:mosque_daily/article_view.dart';
import 'package:mosque_daily/model/articles.dart';

class NewsItem extends StatelessWidget {
  final String imgurl, title, desc, content, posturl, name;

  const NewsItem({
    this.imgurl,
    this.title,
    this.desc,
    this.content,
    @required this.posturl,
    this.name});
  @override
  Widget build(BuildContext context) {
    return GestureDetector (
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(postUrl: posturl)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 24),
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(6),
                  bottomLeft: Radius.circular(6)
              )
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      desc,
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      name,
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    imgurl,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}