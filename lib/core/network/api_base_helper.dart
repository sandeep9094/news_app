import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app/utils/logs.dart';

import '../../utils/constants/string_const.dart';
import 'api_constant.dart';

/// Helper class for configuring Api calls
class ApiBaseHelper {
  Dio? _dio;

  ApiBaseHelper() {
    var options = BaseOptions(
        receiveTimeout: const Duration(milliseconds: ApiConstant.apiRequestTimeOut),
        connectTimeout: const Duration(milliseconds: ApiConstant.apiRequestTimeOut));
    options.baseUrl = ApiConstant.baseUrl;
    _dio = Dio(options);
    _dio!.interceptors.add(LogInterceptor(requestBody: true, error: true));
    _dio!.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        logger.d("initInterceptors:onRequest: ${options.method} ${options.baseUrl}");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        logger.d("initInterceptors:onResponse: ${response.data}");
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        logger.e("initInterceptors:onError: ${e.message}");
        return handler.next(e);
      },
    ));
  }

  /// Method : GET
  /// Params : url
  Future<Response<dynamic>> get(String url) async {
    var response = await _dio?.get(url, options: Options(responseType: ResponseType.json));
    return response!;
  }

  /// Method : GET
  /// Params : url, map for parameters
  Future<Response<dynamic>> getWithParam({String url = '', params}) async {
    Response response;
    try {
      response = (await _dio?.get(url, queryParameters: params, options: Options(responseType: ResponseType.json)))!;
    } on SocketException catch (_) {
      logger.e('object SocketException');
      response = Response(requestOptions: RequestOptions(path: 'path'));
      response.statusCode = ApiResponseCode.internet_unavailable;
      response.statusMessage = StringConstant.NO_INTERNET_CONNECTION;
    } on Exception catch (e) {
      logger.e('object Exception');
      response = Response(requestOptions: RequestOptions(path: 'path'));
      response.statusCode = ApiResponseCode.unknown;
      response.statusMessage = "$e ${StringConstant.SOMETHING_WENT_WRONG}";
    }
    logger.d('response : $response');
    return response;
  }

  /// Method : POST
  /// Params : url, map for parameters
  Future<Response> post({String url = '', params}) async {
    var response = await _dio!.post(url, data: params, options: Options(responseType: ResponseType.json));
    return response;
  }

  /// Method : POST
  /// Params : url, map for parameters
  Future<Response> postFormData(String url, FormData formData, ProgressCallback? uploadProgress) async {
    var response = await _dio!.post(
      url,
      data: formData,
      options: Options(responseType: ResponseType.json),
      onSendProgress: uploadProgress,
    );
    return response;
  }

  /// Method : PUT
  /// Params : url, map for parameters
  Future<Response> put(String url, params) async {
    var response = await _dio!.put(url, data: params, options: Options(responseType: ResponseType.json));
    return response;
  }

  /// Method : DELETE
  /// Params : url, map for parameters
  Future<Response> delete(String url, params) async {
    var response = await _dio!.delete(url, data: params, options: Options(responseType: ResponseType.json));
    return response;
  }
}

/// Api Response codes
class ApiResponseCode {
  static const int success_200 = 200;
  static const int success_201 = 201;
  static const int error_400 = 400;
  static const int error_499 = 499;
  static const int error_401 = 201;
  static const int error_404 = 201;
  static const int error_500 = 500;
  static const int internet_unavailable = 999;
  static const int unknown = 533;
}

final apiHelper = ApiBaseHelper();
