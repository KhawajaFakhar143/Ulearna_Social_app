import 'package:flutter/material.dart';
import 'package:ulearna_social_app/core/app_strings/app_strings.dart';
import 'package:ulearna_social_app/features/reels/presentation/widgets/text_widget.dart';

class ReelsMenuPage extends StatelessWidget {
  const ReelsMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const TextWidget(text: AppStrings.reelMenuTitleText),),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
        return 
      },)
    );
  }
}