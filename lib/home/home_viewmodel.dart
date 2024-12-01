import 'dart:async';

import 'package:news_app/core/injection/locator.dart';
import 'package:news_app/core/model/top_headline.dart';
import 'package:news_app/core/network/api_status.dart';
import 'package:news_app/core/network/dio_service.dart';

import '../core/network/api_response.dart';

class HomeViewModel {

  StreamController<ApiResult<TopHeadline>> headlineStream = StreamController();

  closeStreams() {
    headlineStream.close();
  }

  getTopHeadlines() async {
    headlineStream.add(ApiResult.loading());
    final response = await locator<DioService>().getTopHeadlines();
    final apiResponse = ApiResponse.returnResponse(response);
    if(apiResponse.status == ApiStatus.COMPLETED) {
      final headlinesResponse = TopHeadline.fromJson(apiResponse.data);
      headlineStream.add(ApiResult.success(headlinesResponse));
    } else if (apiResponse.status == ApiStatus.ERROR){
      headlineStream.add(ApiResult.error(apiResponse.apiError?.errorMessage));
    }
  }

}