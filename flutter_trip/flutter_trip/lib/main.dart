import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geek/navigator/tab_navigator.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String showResult = '';

  Future<CommonModel> fetchPost() async {
    Utf8Decoder decode = new Utf8Decoder();
    final response = await http.get('http://devio.org/io/flutter_app/json/test_common_model.json');
    final result = json.decode(decode.convert(response.bodyBytes));
    return CommonModel.fromJson(result);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Http'),
        ),
        body: FutureBuilder<CommonModel>(
          future: fetchPost(),
          builder: (BuildContext context, AsyncSnapshot<CommonModel> snapshot){
            switch(snapshot.connectionState) {
              case ConnectionState.none:
                return Text('Input a URL to start');
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.active:
                return Text('');
              case ConnectionState.done:
                if(snapshot.hasError) {
                  return Text('${snapshot.error}', style: TextStyle(color: Colors.red));
                }
                return Column(
                  children: <Widget>[
                    Text('icon: ${snapshot.data.icon}'),
                    Text('statusBarColor: ${snapshot.data.statusBarColor}'),
                    Text('title: ${snapshot.data.title}'),
                    Text('url: ${snapshot.data.url}'),
                  ],
                );
               default:
                 return Text('1');
            }
          },
        )
      ),
    );
  }
}

class CommonModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  CommonModel({this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      icon: json['icon'],
      title: json['title'],
      url: json['url'],
      statusBarColor: json['statusBarColor'],
      hideAppBar: json['hideAppBar'],
    );
  }
}