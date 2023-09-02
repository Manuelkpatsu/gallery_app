import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  const DioClient(this._dio);

  Future<Response> getPhotos({required int page, required int perPage}) {
    return _dio.get('photos', queryParameters: {"page": page, "per_page": perPage});
  }
}
