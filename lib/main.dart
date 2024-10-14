import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearna_social_app/core/constants/constant.dart';
import 'package:ulearna_social_app/features/reels/presentation/bloc/reels_bloc.dart';
import 'package:ulearna_social_app/features/reels/presentation/bloc/reels_event.dart';
import 'package:ulearna_social_app/injection_container.dart';
import 'package:ulearna_social_app/ulearna_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

   initDependency(baseUrl: reelsApiBaseUrl);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    MultiBlocProvider(
       providers: [
        BlocProvider<ReelsBloc>(create: (_) => sl<ReelsBloc>()..add(FetchReels())),       
      ],
      child: const  MaterialApp(
        title: "Ulearna Social App",
        home: UlearnaApp(),
      ),
    );
  }
}
