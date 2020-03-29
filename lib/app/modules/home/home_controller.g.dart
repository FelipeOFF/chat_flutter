// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;

  final _$usersAtom = Atom(name: '_HomeBase.users');

  @override
  ObservableStream<List<User>> get users {
    _$usersAtom.context.enforceReadPolicy(_$usersAtom);
    _$usersAtom.reportObserved();
    return super.users;
  }

  @override
  set users(ObservableStream<List<User>> value) {
    _$usersAtom.context.conditionallyRunInAction(() {
      super.users = value;
      _$usersAtom.reportChanged();
    }, _$usersAtom, name: '${_$usersAtom.name}_set');
  }

  final _$statusAnimationAtom = Atom(name: '_HomeBase.statusAnimation');

  @override
  double get statusAnimation {
    _$statusAnimationAtom.context.enforceReadPolicy(_$statusAnimationAtom);
    _$statusAnimationAtom.reportObserved();
    return super.statusAnimation;
  }

  @override
  set statusAnimation(double value) {
    _$statusAnimationAtom.context.conditionallyRunInAction(() {
      super.statusAnimation = value;
      _$statusAnimationAtom.reportChanged();
    }, _$statusAnimationAtom, name: '${_$statusAnimationAtom.name}_set');
  }

  final _$nameAtom = Atom(name: '_HomeBase.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$_HomeBaseActionController = ActionController(name: '_HomeBase');

  @override
  void setStatus(double value) {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.setStatus(value);
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onNameChanged(String value) {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.onNameChanged(value);
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<User> addUser() {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.addUser();
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'users: ${users.toString()},statusAnimation: ${statusAnimation.toString()},name: ${name.toString()},isValid: ${isValid.toString()}';
    return '{$string}';
  }
}
