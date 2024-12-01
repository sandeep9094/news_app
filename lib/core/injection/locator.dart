import 'package:get_it/get_it.dart';

import '../network/dio_service.dart';

final locator = GetIt.instance;

void setup() {

  locator.registerLazySingleton<DioService>(() => DioService());

}