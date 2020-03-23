import 'package:chat/app/modules/home/components/base_dynamic_height_sliver_for_percent.dart';
import 'package:chat/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'components/chat_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controllerAnimation;

  @override
  void initState() {
    super.initState();
    _controllerAnimation =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controllerAnimation)
          ..addListener(() {
            controller.setStatus(_animation.value);
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          physics: PageScrollPhysics(),
          slivers: <Widget>[
            Observer(builder: (con) {
              return SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: BaseDynamicHeightSliverForPercent(
                  animationExpandedHeight: controller.statusAnimation,
                  maxAnimation: 300,
                  minAnimation: 160,
                  minHeight: 100,
                  update: (double percent, double maxHeight) {
                    print(percent);
                    return ChatHeader(
                      percentage: percent,
                      height: maxHeight,
                      startAnimation: controller.statusAnimation,
                    );
                  },
                ),
              );
            }),
            SliverFillRemaining(
              child: Center(
                child: RaisedButton(
                  onPressed: () {
                    if (_animation.value == 1.0) {
                      _controllerAnimation.reverse();
                    } else {
                      _controllerAnimation.forward();
                    }
                  },
                  child: Text("Teste"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controllerAnimation.dispose();
    super.dispose();
  }
}
