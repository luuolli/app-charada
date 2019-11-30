import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:charadas/shared/apis/charada_api.dart';
import 'package:charadas/shared/custom/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'home_bloc.dart';
import 'home_screen.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => HomeBloc(i.getDependency<CharadaAPi>())),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => Dio()),
        Dependency((i) => CustomDio(i.getDependency<Dio>())),
        Dependency((i) => CharadaAPi(i.getDependency<CustomDio>())),
      ];

  @override
  Widget get view => HomeScreen();

  static Inject get to => Inject<HomeModule>.of();
}
