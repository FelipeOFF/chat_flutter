import 'package:chat/app/modules/base/components/behavior_none.dart';
import 'package:chat/app/modules/home/components/base_dynamic_height_sliver_for_percent.dart';
import 'package:chat/app/modules/home/components/login_screen.dart';
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
                return SliverFillRemaining(
                  hasScrollBody: controller.statusAnimation > 0.2,
                  child: Container(
                    height: (MediaQuery.of(context).size.height - 100),
                    child: LayoutBuilder(builder: (_, constraints) {
                      if (controller.statusAnimation > 0.2) {
                        return Opacity(
                          opacity: controller.statusAnimation,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: calcTranslationReverse(constraints)),
                            child: Container(
                              child: Center(
                                child: RaisedButton(
                                  onPressed: () async {
                                    await _controllerAnimation.reverse();
                                  },
                                  child: Text("Reverse"),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Opacity(
                          opacity: _getPercentForOpacity(),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: calcTranslation(constraints)),
                            child: LoginScreen(
                              statusAnimation: controller.statusAnimation,
                              onError: controller.validateName,
                              onTextChanged: controller.onNameChanged,
                              onClickLogin: controller.isValid
                                  ? () async {
                                      await _controllerAnimation.forward();
                                    }
                                  : null,
                            ),
                          ),
                        );
                      }
                    }),
                  ),
                );
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

  double calcTranslation(BoxConstraints constraints) =>
      ((constraints.maxHeight * 0.2) * controller.statusAnimation);

  double _getPercentForOpacity() =>
      1.0 -
      (controller.statusAnimation <= 0.2
          ? controller.statusAnimation / 0.2
          : 1.0);

  @override
  void dispose() {
    _controllerAnimation.dispose();
    super.dispose();
  }
}
