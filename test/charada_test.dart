import 'package:charadas/shared/apis/charada_api.dart';
import 'package:charadas/shared/custom/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final api = CharadaAPi(CustomDio(Dio()));
  test('Charada aleatória teste', () async {
    Response response = await api.aleatorio();
    print(response.data['pergunta']);
    expect(response.statusCode, 200);
  });
}
