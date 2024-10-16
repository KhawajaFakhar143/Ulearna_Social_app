import 'package:ulearna_social_app/core/resources/data_state.dart';
import 'package:ulearna_social_app/features/reels/domain/entities/reels_entity.dart';

abstract class ReelsRepository {
  Future<DataState<List<ReelsEntity>>> getReelsData({
    required String page,
    required String limit,
    required String location,
  });
}
