import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'internet_service/dio_client.dart';
import 'repository/photo_repository.dart';

final GetIt get = GetIt.instance;

void setupLocator() {
  get.registerFactory(() => Logger());

  get.registerLazySingleton<Dio>(() {
    return Dio(BaseOptions(
      baseUrl: dotenv.env['BASE_URL']!,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      responseType: ResponseType.json,
      headers: {"Authorization": "Client-ID ${dotenv.env['CLIENT_ID']!}"},
    ));
  });

  // DioClient
  get.registerFactory(() => DioClient(get<Dio>()));

  // PhotoRepository
  get.registerFactory(() => PhotoRepository(get<DioClient>(), get<Logger>()));
}
