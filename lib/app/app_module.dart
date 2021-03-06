import 'package:chat/app/app_controller.dart';
import 'package:chat/app/modules/repository/user_repository.dart';
import 'package:chat/app/modules/repository/user_repository_impl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:chat/app/app_widget.dart';
import 'package:chat/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => Firestore.instance),
        Bind<UserRepository>((i) => UserRepositoryImpl(i.get()))
      ];

  @override
  List<Router> get routers => [
        Router('/', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
