import 'package:flutter/material.dart';
import 'package:mosque_daily/view/homepage.dart';

void main(){
  runApp(Daily());
}

class Daily extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DailyNews",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}
