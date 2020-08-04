import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图片控件'),
        leading: BackButton(),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Image.network('http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLYicLia9bCyRQhpCG3ofQ4dQhouIRlvnTv3DCox8v0sj9Tk01TmD3xPZTjFLxmARgEKy27T0RSC6UA/132'),
          ),
          Center(
            child: Image.asset('images/avatar.jpg'),
          ),
          /*Center(
            child: FutureBuilder(
              future: _getLocalFile('images/avatar.jpg'),
              builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
                  return snapshot.data != null ? Image.file(snapshot.data) : Container();
              })
            ),*/
          Stack(
            children: <Widget>[
              Center(
                child: CircularProgressIndicator(),
              ),
              Center(
                child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLYicLia9bCyRQhpCG3ofQ4dQhouIRlvnTv3DCox8v0sj9Tk01TmD3xPZTjFLxmARgEKy27T0RSC6UA/132'),
              )
            ],
          ),
          Center(
            child: CachedNetworkImage(
              imageUrl: 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLYicLia9bCyRQhpCG3ofQ4dQhouIRlvnTv3DCox8v0sj9Tk01TmD3xPZTjFLxmARgEKy27T0RSC6UA/132',
              placeholder: (context, url) => CircularProgressIndicator(),
            ),
          ),
          Center(
            child: Icon(Icons.android, size: 50, color: Colors.pink),
          )
        ],
      ),
    );
  }

  Future<File> _getLocalFile(String filename) async {
    String dir = (await getExternalStorageDirectory()).path;
    File f = new File('$dir/$filename');
    return f;
  }
}
