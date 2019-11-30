import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'app_bloc.dart';
import 'app_screen.dart';

class AppModule extends ModuleWidget {
  AppModule() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
  @override
  List<Bloc> get blocs => [Bloc((i) => AppBloc())];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => AppScreen();

  static Inject get to => Inject<AppModule>.of();
}
