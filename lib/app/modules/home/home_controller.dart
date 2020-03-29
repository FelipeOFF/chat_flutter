import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  @observable
  double statusAnimation = 0.0;

  @observable
  String name;

  @computed
  bool get isValid {
    return validateName() == null;
  }

  String validateName() {
    if (name == null || name.isEmpty) {
      return "Este campo é obrigatório";
    }

    return null;
  }

  @action
  void setStatus(double value) => statusAnimation = value;

  @action
  void onNameChanged(String value) => name = value;
}
