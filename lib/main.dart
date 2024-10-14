import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearna_social_app/features/reels/presentation/bloc/reels_bloc.dart';
import 'package:ulearna_social_app/features/reels/presentation/bloc/reels_event.dart';
import 'package:ulearna_social_app/injection_container.dart';
import 'package:ulearna_social_app/ulearna_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependency();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return 
    BlocProvider(
      create: (context) => ReelsBloc(sl())..add(FetchReels()),
      child: const MaterialApp(
        title: "Ulearna Social App",
        home: UlearnaApp(),
      ),
    );
  }
}
