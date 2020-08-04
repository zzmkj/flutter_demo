import 'package:flutter/material.dart';

///如何获取flutter应用的生命周期
///WidgetsBindingObserver 是一个widgets绑定观察器，通过它我们可以监听应用的生命周期
class AppLifecycle extends StatefulWidget {
  @override
  _AppLifecycleState createState() => _AppLifecycleState();
}

class _AppLifecycleState extends State<AppLifecycle> with WidgetsBindingObserver {

  ///添加监听器
  @override
  void initState() {
    print('----initState----');
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('----build----');
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter应用生命周期'),
        leading: BackButton(),
      ),
      body: Container(
        child: Text('Flutter应用生命周期'),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('state = $state');
    if (state == AppLifecycleState.paused) {
      print('App 进入后台！');
    } else if (state == AppLifecycleState.resumed) {
      print('App 进入前台！');
    } else if (state == AppLifecycleState.inactive) {
      print('App 挂起');
    } else if (state == AppLifecycleState.detached) {
      print('App 退出!');
    }
  }

  ///移除监听器
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    print('----dispose---');
  }


}
