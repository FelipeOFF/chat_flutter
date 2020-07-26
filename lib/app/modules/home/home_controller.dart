import 'package:chat/app/modules/models/user.dart';
import 'package:chat/app/modules/repository/user_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  final UserRepository repository;

  _HomeBase(this.repository) {
    users = repository.getAllUsersStream().asObservable();
    onNameChanged("");
  }

  @observable
  ObservableStream<List<User>> users;
  @observable
  double statusAnimation = 0.0;
  @observable
  String name;
  @observable
  bool loadingSave = false;
  @observable
  bool success = false;

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

  @action
  Future<void> addUser() async {
    this.loadingSave = true;
    try {
      await repository.saveUser(User(name: name));
      success = true;
    } catch (e) {
      print(e);
      success = false;
    } finally {
      this.loadingSave = false;
    }
  }
}
