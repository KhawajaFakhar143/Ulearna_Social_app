import 'package:bloc/bloc.dart';
import 'package:ulearna_social_app/core/resources/data_state.dart';
import 'package:ulearna_social_app/features/reels/domain/entities/reels_call_params.dart';
import 'package:ulearna_social_app/features/reels/domain/entities/reels_entity.dart';
import 'package:ulearna_social_app/features/reels/domain/use_cases/reels_use_cases.dart';
import 'package:ulearna_social_app/features/reels/presentation/bloc/reels_event.dart';
import 'package:ulearna_social_app/features/reels/presentation/bloc/reels_state.dart';

class ReelsBloc extends Bloc<ReelsEvent, ReelsState> {
  final ReelsCall _callGetReels;

  List<ReelsEntity> reelsData = [];

  ReelsBloc(this._callGetReels) : super(ReelsInitial()) {
    on<FetchReels>(_fetchReels);
  }

  void _fetchReels(FetchReels event, Emitter<ReelsState> emit) async {
    final dataState = await _callGetReels(
        params:
            ReelsCallParams(page: "1", country: "United States", limit: "10"));

    if (dataState is DataSuccess && dataState.data != null) {
      reelsData = dataState.data as List<ReelsEntity>;
      for (var element in reelsData) {
          element.logIt();
        }
    } else if (dataState is DataFailed && dataState.exception != null) {
      //TODO: Handling Exception and showing appropriate error message to the user
      emit(ReelsFetchingFailed());
    } else {
      emit(ReelsFetchingFailed());
    }
  }
}
