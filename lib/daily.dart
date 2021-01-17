import 'package:flutter/material.dart';

class Daily extends StatefulWidget{
  @override
  _DailyState createState() => new _DailyState();
}

class _DailyState extends State<Daily> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        body: SafeArea(
          child: new Container(
              color: Colors.white,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Daily'),
                    ]),
              )),
        ));
  }
}

