import 'package:ulearna_social_app/core/resources/data_state.dart';
import 'package:ulearna_social_app/core/usecase/usecase.dart';
import 'package:ulearna_social_app/features/reels/domain/entities/reels_call_params.dart';
import 'package:ulearna_social_app/features/reels/domain/entities/reels_entity.dart';
import 'package:ulearna_social_app/features/reels/domain/repositories/reels_repository.dart';

class ReelsCall extends UseCase<DataState<List<ReelsEntity>>, ReelsCallParams> {
  final ReelsRepository _reelsRepository;
  ReelsCall(this._reelsRepository);
  @override
  Future<DataState<List<ReelsEntity>>> call({ReelsCallParams? params}) {
    return _reelsRepository.getReelsData(
      page: params?.page ?? "",
      limit: params?.limit ?? "",
      location: params?.country ?? "",
    );
  }
}
