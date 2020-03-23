// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeBase, Store {
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
  String toString() {
    final string = 'statusAnimation: ${statusAnimation.toString()}';
    return '{$string}';
  }
}
