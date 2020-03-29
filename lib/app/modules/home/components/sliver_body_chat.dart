import 'package:chat/app/modules/home/components/login_screen.dart';
import 'package:chat/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';

class SliverBodyChat extends StatelessWidget {
  const SliverBodyChat({
    Key key,
    @required this.controller,
    @required AnimationController controllerAnimation,
  })  : _controllerAnimation = controllerAnimation,
        super(key: key);

  final HomeController controller;
  final AnimationController _controllerAnimation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height - 100),
      child: LayoutBuilder(builder: (_, constraints) {
        if (controller.statusAnimation > 0.2) {
          return Opacity(
            opacity: controller.statusAnimation,
            child: Padding(
              padding:
                  EdgeInsets.only(top: calcTranslationReverse(constraints)),
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
              padding: EdgeInsets.only(top: calcTranslation(constraints)),
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
}
