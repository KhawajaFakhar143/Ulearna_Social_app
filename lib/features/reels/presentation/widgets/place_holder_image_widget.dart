import 'package:flutter/material.dart';
import 'package:ulearna_social_app/core/app_assets/app_assets.dart';

class PlaceHolderImage extends StatelessWidget {
  const PlaceHolderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.placeHolderImage,
      fit: BoxFit.fill,
    );
  }
}