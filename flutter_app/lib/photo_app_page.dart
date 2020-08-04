import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class PhotoApp extends StatefulWidget {
  @override
  _PhotoAppState createState() => _PhotoAppState();
}

class _PhotoAppState extends State<PhotoApp> {
  List<File> _images = [];
  final picker = ImagePicker();

  Future getImage(bool isTakePhoto) async {
    Navigator.pop(context);
    final pickedFile = await picker.getImage(
        source: isTakePhoto ? ImageSource.camera : ImageSource.gallery);

    setState(() {
      _images.add(File(pickedFile.path));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('拍照App应用'),
        leading: BackButton(),
      ),
      body: Center(
        child: _images.isEmpty
            ? Text('没有选择图片！')
            : Wrap(spacing: 5, runSpacing: 5, children: _genImages()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: '选择图片',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  void _pickImage() {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: 160,
              child: Column(
                children: <Widget>[
                  _item('拍照', true),
                  _item('从相册选择', false),
                ],
              ),
            ));
  }

  _item(String title, bool isTakePhoto) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(isTakePhoto ? Icons.camera_alt : Icons.photo_library),
        title: Text(title),
        onTap: () => getImage(isTakePhoto),
      ),
    );
  }

  _genImages() {
    return _images.map((file){
          return Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child:
                    Image.file(file, width: 120, height: 90, fit: BoxFit.fill),
              ),
              Positioned(
                  top: 5,
                  right: 5,
                  child: GestureDetector(
                    child: ClipOval(
                      child: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(color: Colors.black54),
                        child: Icon(
                          Icons.close,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _images.remove(file);
                      });
                    },
                  )),
            ],
          );
        }).toList();
  }
}
