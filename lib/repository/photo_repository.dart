import 'dart:io';

import 'package:dio/dio.dart';
import 'package:gallery_app/internet_service/dio_client.dart';
import 'package:gallery_app/model/photo.dart';
import 'package:logger/logger.dart';

class PhotoRepository {
  final DioClient _client;
  final Logger _logger;

  const PhotoRepository(this._client, this._logger);

  Future<List<Photo>> getPhotos({required int page, int? perPage}) async {
    try {
      _logger.d('Getting photos');

      final response = await _client.getPhotos(page: page, perPage: perPage ?? 20);

      _logger.d('Fetched photos: ${List<Photo>.from(response.data.map((i) => Photo.fromJson(i)))}');
      return List<Photo>.from(response.data.map((i) => Photo.fromJson(i)));
    } on DioException catch (error) {
      if (error.error is SocketException) {
        throw error.error!;
      }

      rethrow;
    }
  }
}
