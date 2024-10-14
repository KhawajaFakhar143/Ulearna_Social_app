import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ulearna_social_app/features/reels/data/models/reels_model.dart';

part 'reels_api_service.g.dart';

@RestApi()
abstract class ReelsApiService{
  factory ReelsApiService(Dio dio,{String baseUrl}) = _ReelsApiService;

  @GET("/bytes/all")
  Future<HttpResponse<ReelsModel>> fetchReels({
    @Query("page") String? page,
    @Query("limit") String? limit,
    @Query("country") String? location,
  });
}