import 'package:charadas/shared/custom/dio.dart';
import 'package:dio/dio.dart';

class CharadaAPi {
  CustomDio dio;

  CharadaAPi(this.dio);

  Future<Response> aleatorio() async {
    try {
      return dio.client.get('/charada');
    } on DioError catch (e) {
      throw e;
    }
  }

  Future<Response> detalhe(int id) async {
    try {
      return dio.client.get('/charada/$id');
    } on DioError catch (e) {
      throw e;
    }
  }
}
