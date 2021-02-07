import 'package:flutter/material.dart';
import 'package:mosque_daily/news.dart';

class Home extends StatefulWidget{
  @override
  _HomeScreen createState() =>  _HomeScreen();
}

class _HomeScreen extends State<Home>{
  @override
  Widget build(BuildContext context) {
    final header = Stack(
      children: <Widget>[
//        Center(child: Text("TODAY", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),),),
        Container(
    height: MediaQuery.of(context).size.width - 120,
        decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
    bottomRight: Radius.circular(30.0),
    bottomLeft: Radius.circular(30.0)),
    boxShadow: [
    BoxShadow(
    blurRadius: 6.0,
    offset: Offset(0.0, 2.0),
    color: Colors.white)
    ],
    image: DecorationImage(
    fit: BoxFit.cover,
    image: AssetImage('images/image.png'),
    )
    ),
    ),
    ]
    );
    return Scaffold(
      resizeToAvoidBottomPadding : false,
      body: Column(
        children: <Widget>[(header),
          Expanded(
              child: Homenews()
          )
        ],
      ),
    );
  }
  }
class Homenews extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter HTTP",
      theme: ThemeData(appBarTheme: AppBarTheme(elevation: 0)),
      home: News(),
    );
  }
}
