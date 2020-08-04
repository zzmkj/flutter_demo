import 'package:flutter/material.dart';

class LessGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    Color c = const Color(0xFF42A5F5);//16进制的ARGB
    return MaterialApp(
      title: 'StateLessWidget与基础组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('hello flutter'),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text('I am text', style: textStyle),
              Icon(Icons.android, size: 50, color: Colors.green,),
              CloseButton(),
              BackButton(),
              Chip(
                backgroundColor: Colors.grey[200],
                label: Text('郑智明同学'),
                avatar: Icon(Icons.people),
                deleteIcon: Icon(Icons.close),
                onDeleted: () => print("deleted"),
                deleteIconColor: Colors.grey,
              ),
              Divider(
                height: 10,
                color: Colors.orange,
                indent: 40,
                endIndent: 40,
              ),
              Card(
                color: Colors.blue,
                elevation: 10,
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'I am Card',
                    style: textStyle,
                  ),
                ),
              ),
              AlertDialog(
                title: Text('flutter牛！'),
                content: Text('Flutter 菜！sssssssssssssssss', style: TextStyle(color: const Color(0xFF666666)),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
