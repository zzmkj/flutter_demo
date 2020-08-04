import 'package:flutter/material.dart';
import 'package:flutterapp/animation_hero.dart';
import 'package:flutterapp/animation_hero2.dart';
import 'package:flutterapp/animation_page1.dart';
import 'package:flutterapp/animation_page2.dart';
import 'package:flutterapp/app_lifecycle.dart';
import 'package:flutterapp/flutter_layout_page.dart';
import 'package:flutterapp/flutter_widget_lifecycle.dart';
import 'package:flutterapp/gesture_page.dart';
import 'package:flutterapp/image_page.dart';
import 'package:flutterapp/launch_page.dart';
import 'package:flutterapp/less_group_page.dart';
import 'package:flutterapp/photo_app_page.dart';
import 'package:flutterapp/plugin_use.dart';
import 'package:flutterapp/res_page.dart';
import 'package:flutterapp/statefull_group_page.dart';

void main() {
  runApp(DynamicTheme());
}

class DynamicTheme extends StatefulWidget {
  @override
  _DynamicThemeState createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  Brightness _brightness = Brightness.light;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
//        fontFamily: 'RubikMonoOne', //把该字体应用到全局
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
        brightness: _brightness
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('如何创建和使用Flutter的路由和导航'),),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                setState(() {
                  if (_brightness == Brightness.dark) {
                    _brightness = Brightness.light;
                  } else {
                    _brightness = Brightness.dark;
                  }
                });
              },
              child: Text('切换主题abc', style: TextStyle(fontFamily: 'RubikMonoOne'),), //局部应用字体
            ),
            RouteNavigator()
          ],
          ),
        )
      ),
      routes: <String, WidgetBuilder>{
        'plugin': (BuildContext context) => PluginUse(),
        'less': (BuildContext context) => LessGroupPage(),
        'ful': (BuildContext context) => StateFulGroup(),
        'layout': (BuildContext context) => FlutterLayout(),
        'gesture': (BuildContext context) => GesturePage(),
        'res': (BuildContext context) => ResPage(),
        'launch': (BuildContext context) => LaunchPage(),
        'widgetLifecycle': (BuildContext context) => WidgetLifecycle(),
        'appLifecycle': (BuildContext context) => AppLifecycle(),
        'photoApp': (BuildContext context) => PhotoApp(),
        'imagePage': (BuildContext context) => ImagePage(),
        'animationPage1': (BuildContext context) => AnimationPage1(),
        'animationPage2': (BuildContext context) => AnimationPage2(),
        'animationHero': (BuildContext context) => AnimationHero(),
        'radialExpansionDemo': (BuildContext context) => RadialExpansionDemo(),
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SwitchListTile(title: Text('${byName ? '' : '不'}通过路由名跳转'),value: byName, onChanged: (value){
           setState(() {
             byName = value;
           });
          }),
          _item('如何使用Flutter包和插件', PluginUse(), 'plugin'),
          _item('StateLessWidget基础组件', LessGroupPage(), 'less'),
          _item('StateFulWidget基础组件', StateFulGroup(), 'ful'),
          _item('Flutter Layout布局', FlutterLayout(), 'layout'),
          _item('如何检测用户手势以及处理点击事件', GesturePage(), 'gesture'),
          _item('如何导入和使用Flutter的资源文件', ResPage(), 'res'),
          _item('如何打开第三方应用', LaunchPage(), 'launch'),
          _item('Flutter页面生命周期', WidgetLifecycle(), 'widgetLifecycle'),
          _item('拍照应用App', PhotoApp(), 'photoApp'),
          _item('图片控件', ImagePage(), 'imagePage'),
          _item('动画控件1', AnimationPage1(), 'animationPage1'),
          _item('动画控件2', AnimationPage2(), 'animationPage2'),
          _item('Hero动画1', AnimationHero(), 'animationHero1'),
          _item('Hero动画2', RadialExpansionDemo(), 'radialExpansionDemo'),
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: (){
          if(byName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
