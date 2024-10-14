import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ulearna_social_app/core/resources/data_state.dart';
import 'package:ulearna_social_app/features/reels/data/data_source/reels_api_service.dart';
import 'package:ulearna_social_app/features/reels/data/models/reels_model.dart';
import 'package:ulearna_social_app/features/reels/domain/entities/reels_entity.dart';
import 'package:ulearna_social_app/features/reels/domain/repositories/reels_repository.dart';

class ReelsRepositoryImp extends ReelsRepository {
  final ReelsApiService _reelsApiService;

  ReelsRepositoryImp(this._reelsApiService);
  @override
  Future<DataState<List<ReelsEntity>>> getReelsData({
    required String page,
    required String limit,
    required String location,
  }) async {
    try {
      final httpResponse = await _reelsApiService.fetchReels(
          limit: limit, page: page, location: location);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        
        return DataSuccess((httpResponse.data).toEntity());
      } else {
       
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      log("ex res");
      return DataFailed(e);
    }
  }
}
