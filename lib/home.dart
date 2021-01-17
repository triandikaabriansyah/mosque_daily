import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mosque_daily/header_content.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Center(
        child: Container(
            padding: EdgeInsets.only(top:50.0),
            alignment: Alignment.center,
            color: Colors.white,
            child: Column(
            children: <Widget>[
                new  Text(
                "TODAY", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
              ),
            MosqueImage()
            ],
        ),
      ),
    );
  }
}

class MosqueImage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    AssetImage assetImage = AssetImage('images/image.png');
    Image image = Image(image: assetImage,);
    return Container(child: image,);
  }
}
