import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../home_controller.dart';
import 'login_screen.dart';
import '../../helper/box_constraints_ext.dart';

class LoginSliver extends StatelessWidget {
  const LoginSliver({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: controller.statusAnimation > 0.2,
      child: Container(
        height: (MediaQuery.of(context).size.height - 100),
        child: LayoutBuilder(builder: (_, constraints) {
          return Observer(builder: (_) {
            var loadingMode = controller.loadingSave;
            return Opacity(
              opacity: _getPercentForOpacity(),
              child: Padding(
                padding: EdgeInsets.only(
                    top: constraints
                        .calcTranslation(controller.statusAnimation)),
                child: LoginScreen(
                  statusAnimation: controller.statusAnimation,
                  onError: controller.validateName,
                  onTextChanged: controller.onNameChanged,
                  onClickLogin: _controllerIsValid(),
                  isLoading: loadingMode,
                ),
              ),
            );
          });
        }),
      ),
    );
  }

  Function _controllerIsValid() => controller.isValid
      ? () async {
          await controller.addUser();
        }
      : null;

  double _getPercentForOpacity() =>
      1.0 -
      (controller.statusAnimation <= 0.2
          ? controller.statusAnimation / 0.2
          : 1.0);
}
