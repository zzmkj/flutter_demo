import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AnimationHero extends StatefulWidget {
  @override
  _AnimationHeroState createState() => _AnimationHeroState();
}

class PhotoHero extends StatelessWidget {
  const PhotoHero({Key key, this.photo, this.onTap, this.width})
      : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: Hero(
          tag: photo,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Image.network(
                photo,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ));
  }
}

class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 3; //动画时间

    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Hero Animation'),
      ),
      body: Center(
        child: PhotoHero(
          photo: 'https://zzm888.oss-cn-shenzhen.aliyuncs.com/2020/06/05/57a736a3fcc143f89adbf53f09ce45cdfile.png',
          width: 300,
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text('Flippers Page'),
                  ),
                  body: Container(
                    color: Colors.lightBlueAccent,
                    padding: EdgeInsets.all(16),
                    alignment: Alignment.topLeft,
                    child: PhotoHero(
                      photo: 'https://zzm888.oss-cn-shenzhen.aliyuncs.com/2020/06/05/57a736a3fcc143f89adbf53f09ce45cdfile.png',
                      width: 100,
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                );
              }
            ));
          },
        ),
      ),
    );
  }
}


class _AnimationHeroState extends State<AnimationHero> {
  @override
  Widget build(BuildContext context) {
    return HeroAnimation();
  }
}
