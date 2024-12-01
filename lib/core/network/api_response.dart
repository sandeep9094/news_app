import 'package:dio/dio.dart';

import '../../utils/constants/string_const.dart';
import 'api_base_helper.dart';

/// Wrapper class for Api Response
class ApiResponse<T> {
  ApiStatus? status;
  T? data;
  String? message;
  ApiError? apiError;

  ApiResponse.withoutData({this.status, this.apiError});

  ApiResponse({this.status, this.data, this.apiError});

  /// loading
  static ApiResponse<T> loading<T>() {
    return ApiResponse<T>(status: ApiStatus.LOADING);
  }

  /// success
  static ApiResponse<T> success<T>(T data) {
    return ApiResponse<T>(status: ApiStatus.COMPLETED, data: data);
  }

  /// error
  static ApiResponse error<T>(
      {int? errCode, String? errMsg, T? errBdy, T? data}) {
    var apiError = ApiError(
        statusCode: errCode!, errorMessage: errMsg!, errorBody: errBdy);
    return ApiResponse.withoutData(status: ApiStatus.ERROR, apiError: apiError);
  }

  /// method wraps response in ApiResponse class
  static ApiResponse<dynamic> returnResponse<T>(Response response) {
    if (response.statusCode == ApiResponseCode.internet_unavailable) {
      return ApiResponse.error(errCode: response.statusCode, errMsg: StringConstant.NO_INTERNET_CONNECTION);
    } else if (response.statusCode == ApiResponseCode.success_201 || response.statusCode == ApiResponseCode.success_200) {
      return ApiResponse.success(response.data);
    } else if (response.statusCode! >= ApiResponseCode.error_400 &&
        response.statusCode! <= ApiResponseCode.error_499) {
      return ApiResponse.error(
          errCode: response.statusCode,
          errMsg: response.statusMessage,
          errBdy: response.data,
          data: response.data);
    } else {
      return ApiResponse.error(
          errCode: ApiResponseCode.error_500,
          errMsg: StringConstant.SOMETHING_WENT_WRONG,
          errBdy: StringConstant.SOMETHING_WENT_WRONG,
          data: null);
    }
  }

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

/// Error class to store Api Error Response
class ApiError<T> {
  int? statusCode;
  String? errorMessage;
  T? errorBody;

  ApiError({statusCode, this.errorMessage, this.errorBody});
}

/// Enum to check Api Status
enum ApiStatus { LOADING, COMPLETED, ERROR }
