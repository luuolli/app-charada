import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class CustomInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    options.data = jsonEncode(options.data);
    options.headers = {
      "content-type": "application/json",
    };
    return options;
  }

  @override
  onResponse(Response response) async {
    return response;
  }

  @override
  onError(DioError e) async {
    throw e;
  }
}
