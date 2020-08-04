import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//AnimatedBuilder的使用
class AnimationPage2 extends StatefulWidget {
  @override
  _AnimationPage2State createState() => _AnimationPage2State();
}

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  const GrowTransition({this.animation, this.child});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) => Center(
    child: AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Container(
        height: animation.value,
        width: animation.value,
        child: child,
      ),
      child: child,
    ),
  );
}


class _AnimationPage2State extends State<AnimationPage2> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画组件2'),
      ),
      body: GrowTransition(animation: animation, child: LogoWidget())
    );
  }
}
