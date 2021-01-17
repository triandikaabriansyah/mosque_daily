import 'package:flutter/material.dart';
import './home.dart';
import './schedule.dart';
import './daily.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new Main(),

    );
  }
}

class Main extends StatefulWidget{
  @override
  _MainState createState() => new _MainState();
}

class _MainState extends State<Main> {
  int _bottomNavCurrentIndex = 0;
  List<Widget> _container = [new Home(),new Schedule(), new Daily()];


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: _container[_bottomNavCurrentIndex],
        bottomNavigationBar: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index){
            setState(() {
              _bottomNavCurrentIndex = index;
            });
          },
          currentIndex: _bottomNavCurrentIndex,
          items: [
            BottomNavigationBarItem(
              activeIcon: new Icon(
                Icons.home,
                color: Colors.blue,
              ),
              icon: new Icon(
                Icons.home,
                color: Colors.grey,
              ),
              title: new Text('Home',
                  style: TextStyle(
                      color: _bottomNavCurrentIndex == 0
                          ? Colors.grey
                          : Colors.grey)),
            ),
            BottomNavigationBarItem(
              activeIcon: new Icon(
                Icons.today,
                color: Colors.blue,
              ),
              icon: new Icon(
                Icons.today,
                color: Colors.grey,
              ),
              title: new Text('Schedule',
                  style: TextStyle(
                      color: _bottomNavCurrentIndex == 0
                          ? Colors.grey
                          : Colors.grey)),
            ),
            BottomNavigationBarItem(
              activeIcon: new Icon(
                Icons.library_books,
                color: Colors.blue,
              ),
              icon: new Icon(
                Icons.library_books,
                color: Colors.grey,
              ),
              title: new Text('Daily',
                  style: TextStyle(
                      color: _bottomNavCurrentIndex == 0
                          ? Colors.grey
                          : Colors.grey)),
            ),
          ],
        )
    );
  }
}

