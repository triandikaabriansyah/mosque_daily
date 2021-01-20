import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mosque_daily/header_content.dart';
import 'package:mosque_daily/model/ResponseJadwal.dart';


class Home extends StatefulWidget{
  @override
  _HomeScreen createState() =>  _HomeScreen();
}

class _HomeScreen extends State<Home>{

  TextEditingController _locationController = TextEditingController();


  Future<ResponseJadwal> getJadwal({String location}) async{

    String url = 'https://api.pray.zone/v2/times/today.json?city=$location&school=9';
    final response = await http.get(url);
    final jsonResponse = json.decode(response.body);
    return ResponseJadwal.fromJsonMap(jsonResponse);
  }

  @override
  void initState(){
    if(_locationController.text.isEmpty || _locationController.text == null){
      _locationController.text = 'Purwokerto';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final header = Stack(
      children: <Widget>[
        Center(child: Text("TODAY", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),),),
        Container(
          height: MediaQuery.of(context).size.width - 120,
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/image.png'),
              )
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Tooltip(
                message: 'Ubah Lokasi',
                child: IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.location_on),
                    onPressed: (){
                      _showDialogEditLocation(context);
                    }),
              ),
            ],
          ),
        ),
        FutureBuilder(
            future: getJadwal(
                location: _locationController.text.toLowerCase().toString()),
            builder: (context, AsyncSnapshot snapshot){
              if(snapshot.hasData){
                return HeaderContent(snapshot.data);
              }else if(snapshot.hasError){
                print(snapshot.error);
                return Positioned.fill(
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Data Tidak Tersedia',
                          style: TextStyle(color: Colors.white),
                        )));
              }
              return Positioned.fill(child: Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ));
            }
        ),
//        Align(
//          alignment: Alignment.centerLeft,
//          child: Text(
//          "Dialy News", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
//          ),
//        ),
      ],
    );

    return Scaffold(
      body: Column(
        children: <Widget>[header],
      ),
    );
  }
  void _showDialogEditLocation(BuildContext context) async{
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Ubah Lokasi'),
            content: TextField(
              controller: _locationController,
              decoration: InputDecoration(hintText: 'Lokasi'),
            ),
            actions: <Widget>[
              new FlatButton(onPressed: (){
                Navigator.of(context).pop();
              },
                child: new Text('Batal'),
              ),
              new FlatButton(onPressed: (){
                Navigator.pop(context, (){
                  setState(() {
                    getJadwal(
                        location: _locationController.text
                            .toLowerCase()
                            .toString());
                  });
                });
              }, child: new Text('OK'),
              ),
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
          );
        });
  }
}

