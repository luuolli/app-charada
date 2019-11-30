import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class AppBloc extends BlocBase {
  BehaviorSubject _appBloc = BehaviorSubject.seeded(null);
  Sink sink;
  Observable stream;

  @override
  void dispose() {
    _appBloc.close();
    super.dispose();
  }
}
