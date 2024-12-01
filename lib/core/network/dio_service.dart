import 'package:dio/dio.dart';

import '../../utils/constants/string_const.dart';
import 'api_base_helper.dart';
import 'api_constant.dart';

class DioService {

  Future<Response> getTopHeadlines() async {
    Response response;
    try {
      //https://newsapi.org/v2/top-headlines?country=us&apiKey=84c3ff866c444a14bc72dc0a64d683ed
      String url = "${ApiConstant.baseUrl}?country=us&apiKey=${ApiConstant.apiKey}";
      response = await ApiBaseHelper().get(url);
    } on DioException catch(exception) {
      response = Response(requestOptions: RequestOptions(path: 'path'));
      response.statusCode = ApiResponseCode.internet_unavailable;
      response.statusMessage = StringConstant.NO_INTERNET_CONNECTION;
    }
    return response;
  }


}