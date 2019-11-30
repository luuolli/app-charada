import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:charadas/shared/apis/charada_api.dart';
import 'package:charadas/shared/models/charada.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase {
  CharadaAPi api;
  CharadaModel charada;

  bool hiddenResponse = true;
  bool first = true;
  HomeBloc(this.api);
  BehaviorSubject<HomeBloc> _bloc = BehaviorSubject<HomeBloc>.seeded(null);
  Sink<HomeBloc> get sink => _bloc.sink;
  Observable<HomeBloc> get stream => _bloc.stream;

  showHideResponse() {
    hiddenResponse = false;
    sink.add(this);
  }

  aleatorio() async {
    try {
      var data = await api.aleatorio();
      charada = CharadaModel.fromJson(data.data);
      hiddenResponse = true;
      first = false;
      sink.add(this);
    } on DioError catch (e) {
      _bloc.addError(e);
    }
  }

  detalhe(int id) async {
    try {
      var data = await api.detalhe(id);
      charada = CharadaModel.fromJson(data.data);
      hiddenResponse = true;
      sink.add(this);
    } on DioError catch (e) {
      _bloc.addError(e);
    }
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}
