import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  @observable
  double statusAnimation = 0.0;

  @action
  void setStatus(double value) => statusAnimation = value;
}
