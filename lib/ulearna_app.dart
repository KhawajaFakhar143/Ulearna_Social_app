import 'package:flutter/material.dart';
import 'package:ulearna_social_app/features/reels/presentation/pages/reels_menu.dart';
class UlearnaApp extends StatefulWidget {
  const UlearnaApp({super.key});

  @override
  State<UlearnaApp> createState() => _UlearnaAppState();
}

class _UlearnaAppState extends State<UlearnaApp> {

//This Widget is usefull when later we will need to handle the user navigation,checks
//on the app launch
  @override
  Widget build(BuildContext context) {
    return const ReelsMenuPage();
  }
}
