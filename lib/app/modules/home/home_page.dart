import 'package:chat/app/modules/base/components/behavior_none.dart';
import 'package:chat/app/modules/home/components/base_dynamic_height_sliver_for_percent.dart';
import 'package:chat/app/modules/home/components/list_client.dart';
import 'package:chat/app/modules/home/components/login_sliver.dart';
import 'package:chat/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../models/user.dart';
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
  List<ReactionDisposer> _disposers = [];

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

    _disposers.add(reaction((_) => controller.success, (success) async {
      if (success) {
        await _controllerAnimation.forward();
      }
    }));

    controller.onNameChanged("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: ScrollConfiguration(
          behavior: BehaviorNone(),
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
              Observer(builder: (_) {
                if (controller.statusAnimation > 0.2) {
                  if (controller.users.data == null) {
                    return SliverFillRemaining(
                      child: Center(
                        child: Text("Data is null"),
                      ),
                    );
                  } else if (!(controller.users.data is List)) {
                    return SliverFillRemaining(
                      child: Center(
                        child: Text("Data is not list"),
                      ),
                    );
                  }

                  var data = controller.users.data as List<User>;
                  return ListClient(data: data);
                }

                return LoginSliver(controller: controller);
              }),
            ],
          ),
        ),
      ),
    );
  }

  double calcTranslationReverse(BoxConstraints constraints) =>
      ((constraints.maxHeight * 0.2) -
          ((constraints.maxHeight * 0.2) * controller.statusAnimation));

  @override
  void dispose() {
    _controllerAnimation.dispose();
    _disposers.forEach((dispose) => dispose());
    super.dispose();
  }
}
