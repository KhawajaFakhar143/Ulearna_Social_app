import 'package:flutter/material.dart';
class UlearnaApp extends StatefulWidget {
  const UlearnaApp({super.key});

  @override
  State<UlearnaApp> createState() => _UlearnaAppState();
}

class _UlearnaAppState extends State<UlearnaApp> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reels Display page"),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Reels Dislay Here")],
      ),
    );
  }
}
