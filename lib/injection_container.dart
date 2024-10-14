import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get_it/get_it.dart';
import 'package:ulearna_social_app/core/constants/constant.dart';
import 'package:ulearna_social_app/features/reels/data/data_source/reels_api_service.dart';
import 'package:ulearna_social_app/features/reels/data/repositories/reels_repository_imp.dart';
import 'package:ulearna_social_app/features/reels/domain/repositories/reels_repository.dart';
import 'package:ulearna_social_app/features/reels/domain/use_cases/reels_use_cases.dart';
import 'package:ulearna_social_app/features/reels/presentation/bloc/reels_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependency({String? baseUrl}) async{
  sl.registerSingleton<Dio>(buildDioclient(base: baseUrl));

  //Dependencies
  sl.registerSingleton<ReelsApiService>(ReelsApiService(sl()));

  //repositories
  sl.registerSingleton<ReelsRepository>(ReelsRepositoryImp(sl()));

  //use cases
  sl.registerSingleton<ReelsCall>(ReelsCall(sl()));

  //Blocs
  sl.registerSingleton<ReelsBloc>(ReelsBloc(sl()));
}

Dio buildDioclient({String? base}) {
  final dio = Dio()
    ..options = BaseOptions(
      baseUrl: base ?? reelsApiBaseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );

  dio.httpClientAdapter = IOHttpClientAdapter(
    onHttpClientCreate: (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    },
  );
  return dio;
}
